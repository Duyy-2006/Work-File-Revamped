--// Synapse-friendly: Send username, timestamp, items(array), honey to Google Sheet (WebApp)

if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
task.wait(10)

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local lp = Players.LocalPlayer or Players.PlayerAdded:Wait()

local SEND_EVERY = 120 -- seconds
local GOOGLE_WEBAPP_URL = "https://script.google.com/macros/s/AKfycbz_q5zNU4y8Jd-jGaFVdqGvENYnrkECAX_YwU9Ux1bIW-SA7kLf6-HuR_E5Qb6r2tbIoA/exec"

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

local function safeTextLabelText(label)
    if not label then return nil end
    local ok, txt = pcall(function() return label.Text end)
    if ok then return txt end
    return nil
end

-- ===== items (accessories array) =====
local function getAccessoriesArray(plr)
    local names = {}
    local char = plr and plr.Character
    if not char then return names end

    for _, obj in ipairs(char:GetChildren()) do
        if obj:IsA("Accessory") or obj:IsA("Hat") then
            names[#names + 1] = obj.Name
        end
    end

    table.sort(names)
    return names
end

local function getItemsJson(plr)
    local arr = getAccessoriesArray(plr)
    local ok, json = pcall(function()
        return HttpService:JSONEncode(arr) -- ["Hat","Glasses",...]
    end)
    if ok and json then return json end

    -- fallback if JSONEncode fails (rare)
    local out = table.create(#arr)
    for i, v in ipairs(arr) do
        out[i] = string.format("%q", tostring(v))
    end
    return "[" .. table.concat(out, ",") .. "]"
end

-- ===== honey =====
local function getHoneyLabel()
    local pg = lp:FindFirstChild("PlayerGui")
    if not pg then return nil end

    local sg = pg:FindFirstChild("ScreenGui")
    if not sg then return nil end

    local meter = sg:FindFirstChild("MeterHUD")
    if not meter then return nil end

    local honeyMeter = meter:FindFirstChild("HoneyMeter")
    if not honeyMeter then return nil end

    local bar = honeyMeter:FindFirstChild("Bar")
    if not bar then return nil end

    local tl = bar:FindFirstChild("TextLabel")
    if tl and tl:IsA("TextLabel") then
        return tl
    end

    -- sometimes TextLabel might be deeper
    return bar:FindFirstChildWhichIsA("TextLabel")
end

local function getHoneyText()
    local label = getHoneyLabel()
    return safeTextLabelText(label)
end

-- ===== send =====
local function sendToSheet(username, timestamp, itemsJson, honey)
    local req = getRequestFunc()
    if not req then
        warn("[Sheet] No HTTP request function found.")
        return
    end

    local url = GOOGLE_WEBAPP_URL
        .. "?timestamp=" .. urlencode(timestamp)
        .. "&username="  .. urlencode(username or "")
        .. "&items="     .. urlencode(itemsJson or "[]")
        .. "&honey="     .. urlencode(honey or "")

    local ok, res = pcall(req, { Url = url, Method = "GET" })
    if ok then
        print("[Sheet] Sent:", res.StatusCode or res.Status or "N/A", "|", username, honey, itemsJson)
    else
        warn("[Sheet] Send failed:", res)
    end
end

-- ===== main loop =====
task.spawn(function()
    while true do
        local timestamp = os.date("%Y-%m-%d %H:%M:%S")
        local username = lp.Name
        local itemsJson = getItemsJson(lp)
        local honey = getHoneyText()

        print(("[Local] username=%s | honey=%s | items=%s"):format(tostring(username), tostring(honey), tostring(itemsJson)))
        sendToSheet(username, timestamp, itemsJson, honey)

        task.wait(SEND_EVERY)
    end
end)
