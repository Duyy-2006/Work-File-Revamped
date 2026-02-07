--// Synapse-friendly: Find 2 CurrencyTemplate by order (1=Gems, 2=Present) and send continuously

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

-- ===== bind 2 templates by order =====
local gemsLabel, presentLabel
local gains = getGains()

local function bindFirst2()
    gemsLabel, presentLabel = nil, nil

    local found = {}

    for _, child in ipairs(gains:GetChildren()) do
        if child.Name == "CurrencyTemplate" then
            local label = getAmountLabel(child)
            if label then
                table.insert(found, label)
                if #found >= 2 then break end
            end
        end
    end

    gemsLabel = found[1]
    presentLabel = found[2]

    return (#found >= 2)
end

local function ensureBound()
    if gemsLabel and gemsLabel.Parent and presentLabel and presentLabel.Parent then
        return true
    end

    if bindFirst2() then
        print("[Bind] Found 2 CurrencyTemplate labels by order.")
        return true
    end

    print("[Bind] Waiting CurrencyTemplate spawn...")
    local found = {}
    local conn
    conn = gains.ChildAdded:Connect(function(child)
        task.wait(0.1)
        if child.Name ~= "CurrencyTemplate" then return end

        local label = getAmountLabel(child)
        if not label then return end

        table.insert(found, label)
        if #found >= 2 then
            conn:Disconnect()
            gemsLabel = found[1]
            presentLabel = found[2]
            print("[Bind] Bound 2 labels after ChildAdded.")
        end
    end)

    for _ = 1, 50 do
        if gemsLabel and presentLabel then
            if conn and conn.Connected then conn:Disconnect() end
            return true
        end
        bindFirst2()
        if gemsLabel and presentLabel then
            if conn and conn.Connected then conn:Disconnect() end
            return true
        end
        task.wait(0.1)
    end

    if conn and conn.Connected then conn:Disconnect() end
    warn("[Bind] Failed to bind 2 CurrencyTemplate labels.")
    return false
end

-- ===== send to sheet =====
local function sendToSheet(gems, present)
    local req = getRequestFunc()
    if not req then
        warn("[Sheet] No HTTP request function found.")
        return
    end

    local timestamp = os.date("%Y-%m-%d %H:%M:%S")

    -- Sends both `present` and `leaves` (same value) for compatibility with older sheet handlers.
    local url = GOOGLE_WEBAPP_URL
        .. "?timestamp=" .. urlencode(timestamp)
        .. "&username="  .. urlencode(lp.Name)
        .. "&gems="      .. urlencode(gems or "")
        .. "&present="   .. urlencode(present or "")
        .. "&leaves="    .. urlencode(present or "")

    local ok, res = pcall(req, { Url = url, Method = "GET" })
    if ok then
        print("[Sheet] Sent:", res.StatusCode or res.Status or "N/A", " | ", gems, present)
    else
        warn("[Sheet] Send failed:", res)
    end
end

-- ===== main loop =====
task.spawn(function()
    while true do
        if ensureBound() then
            local gems = safeText(gemsLabel)
            local present = safeText(presentLabel)

            print(("Gems=%s | Present=%s"):format(tostring(gems), tostring(present)))
            sendToSheet(gems, present)
        end

        task.wait(SEND_EVERY)
    end
end)
