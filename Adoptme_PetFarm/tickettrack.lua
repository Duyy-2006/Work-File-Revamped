if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
task.wait(10)

local Players = game:GetService("Players")
local lp = Players.LocalPlayer or Players.PlayerAdded:Wait()

local SEND_EVERY = 120
local GOOGLE_WEBAPP_URL = "https://script.google.com/macros/s/AKfycbz1W_82Gq4jKkz8IGm2EOpISScP6k78ewHGljOQNtCFCaBGz0gpTtbEP379Qlmuj9-U/exec"

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

local function getAmount()
    local ok, result = pcall(function()
        return lp:WaitForChild("PlayerGui")
            :WaitForChild("PetRecyclerTicketsIndicatorApp")
            :WaitForChild("CurrencyIndicator")
            :WaitForChild("Container")
            :WaitForChild("Amount").Text
    end)
    if ok then return result end
    warn("[Amount] Failed to read:", result)
    return nil
end

local function sendToSheet(amount)
    local req = getRequestFunc()
    if not req then
        warn("[Sheet] No HTTP request function found.")
        return
    end

    local timestamp = os.date("%Y-%m-%d %H:%M:%S")

    local url = GOOGLE_WEBAPP_URL
        .. "?timestamp=" .. urlencode(timestamp)
        .. "&username="  .. urlencode(lp.Name)
        .. "&amount="    .. urlencode(amount or "")
        .. "&sheet="     .. urlencode("Adopt Me")

    local ok, res = pcall(req, { Url = url, Method = "GET" })
    if ok then
        print("[Sheet] Sent:", res.StatusCode or res.Status or "N/A", " | ", amount)
    else
        warn("[Sheet] Send failed:", res)
    end
end

task.spawn(function()
    while true do
        local amount = getAmount()
        if amount then
            print(("Username=%s | Amount=%s"):format(lp.Name, tostring(amount)))
            sendToSheet(amount)
        end
        task.wait(SEND_EVERY)
    end
end)