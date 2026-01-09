--// Synapse-friendly: Find 3 CurrencyTemplate by order (1=Gems, 2=Leaves, 3=CakeSlices) and send continuously

if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
task.wait(10)

local Players = game:GetService("Players")
local lp = Players.LocalPlayer or Players.PlayerAdded:Wait()

local SEND_EVERY = 120 -- seconds
local GOOGLE_WEBAPP_URL = "https://script.google.com/macros/s/AKfycbwi3hpH4Zraea8YpNmv3FunemAKMnhpH0vtQzy0jDl524qCnEwQ62gSAtElJsBX44NsrA/exec"

-- ===== helpers =====
local function urlencode(str)
    str = tostring(str or "")
    str = str:gsub("\n", " ")
    return str:gsub("([^%w%-_%.~ ])", function(c)
        return string.format("%%%02X", string.byte(c))
    end):gsub(" ", "%%20")
end

local function getRequestFunc()
    if syn and syn.request then return syn.request end
    if http and http.request then return http.request end
    if http_request then return http_request end
    if request then return request end
    return nil
end

local function getAmountLabel(inst)
    -- Exactly like your way: CurrencyTemplate -> Main -> Amount -> TextLabel
    if not inst or inst.Name ~= "CurrencyTemplate" then return nil end

    local mainFrame = inst:FindFirstChild("Main")
    local amount = mainFrame and mainFrame:FindFirstChild("Amount")
    if not amount then return nil end

    local label = (amount:IsA("TextLabel") and amount) or amount:FindFirstChildWhichIsA("TextLabel")
    if label and label:IsA("TextLabel") then
        return label
    end
    return nil
end

local function safeText(label)
    if not label then return nil end
    local ok, txt = pcall(function() return label.Text end)
    if ok then return txt end
    return nil
end

-- ===== locate GUI =====
local function getGains()
    local gui = lp:WaitForChild("PlayerGui")
    local main = gui:WaitForChild("Main")
    local gains = main:WaitForChild("Gains")
    return gains
end

-- ===== bind 3 templates by order =====
local gemsLabel, leavesLabel, cakeLabel
local gains = getGains()

local function bindFirst3()
    gemsLabel, leavesLabel, cakeLabel = nil, nil, nil

    local found = {}

    -- Existing ones (order from GetChildren / ipairs)
    for _, child in ipairs(gains:GetChildren()) do
        if child.Name == "CurrencyTemplate" then
            local label = getAmountLabel(child)
            if label then
                table.insert(found, label)
                if #found >= 3 then break end
            end
        end
    end

    gemsLabel   = found[1]
    leavesLabel = found[2]
    cakeLabel   = found[3]

    return (#found >= 3)
end

local function ensureBound()
    if gemsLabel and gemsLabel.Parent and leavesLabel and leavesLabel.Parent and cakeLabel and cakeLabel.Parent then
        return true
    end

    -- try rebind quickly
    if bindFirst3() then
        print("[Bind] Found 3 CurrencyTemplate labels by order.")
        return true
    end

    -- wait for spawn (ChildAdded) until enough
    print("[Bind] Waiting CurrencyTemplate spawn...")
    local found = {}
    local conn
    conn = gains.ChildAdded:Connect(function(child)
        task.wait(0.1)
        if child.Name ~= "CurrencyTemplate" then return end
        local label = getAmountLabel(child)
        if not label then return end
        table.insert(found, label)
        if #found >= 3 then
            conn:Disconnect()
            gemsLabel   = found[1]
            leavesLabel = found[2]
            cakeLabel   = found[3]
            print("[Bind] Bound 3 labels after ChildAdded.")
        end
    end)

    -- also scan again while waiting (in case they already exist but weren’t ready)
    for i = 1, 50 do
        if gemsLabel and leavesLabel and cakeLabel then
            if conn.Connected then conn:Disconnect() end
            return true
        end
        bindFirst3()
        if gemsLabel and leavesLabel and cakeLabel then
            if conn.Connected then conn:Disconnect() end
            return true
        end
        task.wait(0.1)
    end

    if conn and conn.Connected then conn:Disconnect() end
    warn("[Bind] Failed to bind 3 CurrencyTemplate labels.")
    return false
end

-- ===== send to sheet =====
local function sendToSheet(gems, leaves, cakeSlices)
    local req = getRequestFunc()
    if not req then
        warn("[Sheet] No HTTP request function found.")
        return
    end

    local timestamp = os.date("%Y-%m-%d %H:%M:%S")

    local url = GOOGLE_WEBAPP_URL
        .. "?timestamp="  .. urlencode(timestamp)
        .. "&username="   .. urlencode(lp.Name)
        .. "&gems="       .. urlencode(gems or "")
        .. "&leaves="     .. urlencode(leaves or "")
        .. "&cakeSlices=" .. urlencode(cakeSlices or "")

    local ok, res = pcall(req, { Url = url, Method = "GET" })
    if ok then
        print("[Sheet] Sent:", res.StatusCode or res.Status or "N/A", " | ", gems, leaves, cakeSlices)
    else
        warn("[Sheet] Send failed:", res)
    end
end

-- ===== main loop =====
task.spawn(function()
    while true do
        if ensureBound() then
            local gems = safeText(gemsLabel)
            local leaves = safeText(leavesLabel)
            local cake = safeText(cakeLabel)

            print(("Gems=%s | Leaves=%s | CakeSlices=%s"):format(tostring(gems), tostring(leaves), tostring(cake)))
            sendToSheet(gems, leaves, cake)
        end

        task.wait(SEND_EVERY)
    end
end)
