--// ===================== CONFIG =====================
-- Giá trị cần tìm (so sánh EXACT, cùng kiểu thì mới match)
local TARGET_VALUE = "31"      -- có thể là string, number, bool, v.v.

-- Các property của Instance sẽ kiểm tra
local INSTANCE_PROPERTIES = {
    "Name",
    "Text",
    "Value",
    "ToolTip",
    "Image",
    "ClassName"
}

local SEARCH_ATTRIBUTES = true  -- có quét cả Attributes không
--// ==================================================

-- Tìm hàm copy clipboard của executor
local set_clipboard = setclipboard or toclipboard or (syn and syn.write_clipboard)

-- Helper: convert value -> chuỗi dễ đọc
local function valueToString(v)
    local t = typeof(v)
    if t == "string" then
        return string.format("%q", v)
    elseif t == "Instance" then
        return "<Instance " .. v:GetFullName() .. ">"
    else
        return tostring(v)
    end
end

-- So sánh v với TARGET_VALUE (exact type + value)
local function isMatch(v)
    if typeof(v) ~= typeof(TARGET_VALUE) then
        return false
    end
    return v == TARGET_VALUE
end

-- Tạo "path" đẹp: game.Workspace.Part.Gui.Label
local function instancePath(inst)
    if inst == game then
        return "game"
    end

    local segments = {}
    local current = inst

    while current and current ~= nil do
        local name = current.Name ~= "" and current.Name or ("[" .. current.ClassName .. "]")
        table.insert(segments, 1, name)

        current = current.Parent
        if current == game then
            table.insert(segments, 1, "game")
            break
        end
    end

    return table.concat(segments, ".")
end

-- Tìm trong toàn bộ Instance (game tree)
local function searchInstances()
    local count = 0
    local results = {} -- lưu tất cả path match để copy

    print(("[Finder] Searching Instances for value: %s"):format(valueToString(TARGET_VALUE)))

    -- include cả game
    local all = {game}
    for _, inst in ipairs(game:GetDescendants()) do
        table.insert(all, inst)
    end

    for _, inst in ipairs(all) do
        -- Check các property trong list
        for _, prop in ipairs(INSTANCE_PROPERTIES) do
            local ok, v = pcall(function()
                return inst[prop]
            end)

            if ok and v ~= nil and isMatch(v) then
                count = count + 1
                local path = ("%s.%s"):format(instancePath(inst), prop)
                table.insert(results, path)
                print(("[FOUND] %s = %s"):format(path, valueToString(v)))
            end
        end

        -- Check Attributes nếu bật
        if SEARCH_ATTRIBUTES then
            local okAttrs, attrs = pcall(function()
                return inst:GetAttributes()
            end)

            if okAttrs and attrs then
                for attrName, v in pairs(attrs) do
                    if isMatch(v) then
                        count = count + 1
                        local path = ("%s[@%s]"):format(instancePath(inst), attrName)
                        table.insert(results, path)
                        print(("[FOUND ATTR] %s = %s"):format(path, valueToString(v)))
                    end
                end
            end
        end
    end

    print(("[Finder] Done. Found %d matches."):format(count))

    -- Copy vào clipboard nếu có kết quả
    if set_clipboard and #results > 0 then
        local text = table.concat(results, "\n")
        local ok, err = pcall(function()
            set_clipboard(text)
        end)

        if ok then
            print(("[Finder] Copied %d path(s) to clipboard."):format(#results))
        else
            warn("[Finder] Failed to copy to clipboard:", err)
        end
    elseif not set_clipboard then
        warn("[Finder] This executor does not provide setclipboard/toclipboard/syn.write_clipboard.")
    else
        print("[Finder] No matches, clipboard unchanged.")
    end
end

-- Chạy luôn
searchInstances()
