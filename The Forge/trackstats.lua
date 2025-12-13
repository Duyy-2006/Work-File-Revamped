if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end

task.wait(30)

task.spawn(function()
    -- ================== SERVICES ==================
    local Players     = game:GetService("Players")
    local HttpService = game:GetService("HttpService")

    local lp = Players.LocalPlayer or Players.PlayerAdded:Wait()

    -- ================== HELPER: lấy label Level ==================
    local function getLevelLabel()
        local gui          = lp:WaitForChild("PlayerGui")
        local menu         = gui:WaitForChild("Menu")
        local frame1       = menu:WaitForChild("Frame")
        local frame2       = frame1:WaitForChild("Frame")
        local menus        = frame2:WaitForChild("Menus")
        local achievements = menus:WaitForChild("Achievements")
        local playerStats  = achievements:WaitForChild("PlayerStats")
        local playerLevel  = playerStats:WaitForChild("PlayerLevel")

        -- TextLabel tên "2"
        local label2       = playerLevel:WaitForChild("2")
        return label2
    end

    -- ================== HELPER: urlencode ==================
    local function urlencode(str)
        str = tostring(str or "")
        str = str:gsub("\n", " ")
        return str:gsub("([^%w%-_%.~ ])", function(c)
            return string.format("%%%02X", string.byte(c))
        end):gsub(" ", "%%20")
    end

    -- ================== GOOGLE SHEET CONFIG ==================
    local GOOGLE_SHEET_URL = "https://script.google.com/macros/s/AKfycbyoOzPEvwpO3ca1uBA-9JwXL2T28PklJP9h5lcVlxg9lPvFPArUbnsMrW1NcuZdh8gj/exec"

    local function getRequestFunc()
        if syn and syn.request then return syn.request end
        if http and http.request then return http.request end
        if http_request then return http_request end
        if request then return request end
        return nil
    end

    local function sendToGoogleSheet(levelText)
        local req = getRequestFunc()
        if not req then
            warn("[Sheet] No HTTP request function found (syn.request/http_request/request)")
            return
        end

        local timestamp = os.date("%Y-%m-%d %H:%M:%S")
        local url = GOOGLE_SHEET_URL
            .. "?timestamp=" .. urlencode(timestamp)
            .. "&username="  .. urlencode(lp.Name)
            .. "&level="     .. urlencode(levelText)

        local ok, res = pcall(req, {
            Url    = url,
            Method = "GET"
        })

        if ok then
            print("[Sheet] Sent to Google Sheet. Status:",
                res.StatusCode or res.Status or "N/A")
            print("[Sheet] Body:", res.Body or res.body or "NO BODY")
        else
            warn("[Sheet] Failed to send:", res)
        end
    end

    -- ============ LOOP MỖI 120 GIÂY ============ --
    while true do
        local ok, result = pcall(getLevelLabel)
        if ok and result then
            local levelText = result.Text
            print("PlayerLevel.2.Text =", levelText)
            sendToGoogleSheet(levelText)
        else
            warn("Không tìm thấy PlayerLevel.2, sẽ thử lại...", result)
        end

        task.wait(120) -- chỉnh lại nếu muốn gửi nhanh/chậm hơn
    end
end)
