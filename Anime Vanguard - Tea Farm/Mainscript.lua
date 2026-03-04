if not game:IsLoaded() then game.Loaded:Wait() end
wait(10)

local targetPlaceId = 18219125606
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- =============================================
-- APPROACH 1: Hook FireServer để spy xem game gửi gì khi skip
-- =============================================
local capturedRemotes = {}
local originalFireServer = RemoteEvent.FireServer

hookfunction(originalFireServer, function(self, ...)
    local name = self.Name:lower()
    if name:find("tutorial") or name:find("skip") or name:find("quest") or name:find("complete") then
        print("[SPY FireServer] " .. self:GetFullName())
        for i, v in ipairs({...}) do
            print("  arg" .. i .. " = " .. tostring(v))
        end
        -- Lưu lại để replay
        table.insert(capturedRemotes, {remote = self, args = {...}})
    end
    return originalFireServer(self, ...)
end)

-- Hook InvokeServer
local originalInvoke = RemoteFunction.InvokeServer
hookfunction(originalInvoke, function(self, ...)
    local name = self.Name:lower()
    if name:find("tutorial") or name:find("skip") or name:find("quest") or name:find("complete") then
        print("[SPY InvokeServer] " .. self:GetFullName())
        for i, v in ipairs({...}) do
            print("  arg" .. i .. " = " .. tostring(v))
        end
        table.insert(capturedRemotes, {remote = self, args = {...}, isFunction = true})
    end
    return originalInvoke(self, ...)
end)

-- =============================================
-- APPROACH 2: Scan toàn bộ script env tìm hàm skip
-- =============================================
local function scanScriptEnvironments()
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then return end

    for _, scr in ipairs(playerGui:GetDescendants()) do
        if scr:IsA("LocalScript") then
            -- getsenv: lấy environment của script đang chạy
            local ok, env = pcall(getsenv, scr)
            if ok and env then
                print("[ENV] Scanning: " .. scr:GetFullName())
                for k, v in pairs(env) do
                    if type(v) == "function" then
                        local kstr = tostring(k):lower()
                        if kstr:find("skip") or kstr:find("tutorial") 
                        or kstr:find("finish") or kstr:find("complet")
                        or kstr:find("close") or kstr:find("dismiss")
                        or kstr:find("next") or kstr:find("done") then
                            print("[ENV] Calling: " .. tostring(k) .. " in " .. scr:GetFullName())
                            pcall(v)
                        end
                    end
                    -- Tìm BoolValue/flag trong env
                    if type(v) == "boolean" then
                        local kstr = tostring(k):lower()
                        if kstr:find("tutorial") or kstr:find("skip") or kstr:find("shown") then
                            print("[ENV] Setting bool: " .. tostring(k) .. " = true")
                            pcall(function() env[k] = true end)
                        end
                    end
                end
            end

            -- debug.getprotos: lấy inner functions của script
            local ok2, protos = pcall(debug.getprotos, scr)
            if ok2 and protos then
                for i, proto in ipairs(protos) do
                    local ok3, info = pcall(debug.getinfo, proto)
                    if ok3 and info then
                        local name = (info.name or ""):lower()
                        if name:find("skip") or name:find("tutorial") 
                        or name:find("finish") or name:find("close") then
                            print("[Proto] Calling proto[" .. i .. "]: " .. (info.name or "?"))
                            pcall(proto)
                        end
                    end
                end
            end
        end
    end
end

-- =============================================
-- APPROACH 3: Replay captured remotes (chạy sau khi spy 2s)
-- =============================================
local function replayCaptured()
    if #capturedRemotes == 0 then
        print("[Replay] Không có remote nào bị capture")
        return
    end
    for _, data in ipairs(capturedRemotes) do
        print("[Replay] Re-firing: " .. data.remote:GetFullName())
        if data.isFunction then
            pcall(function() data.remote:InvokeServer(table.unpack(data.args)) end)
        else
            pcall(function() data.remote:FireServer(table.unpack(data.args)) end)
        end
    end
end

-- =============================================
-- APPROACH 4: Hook button callback trực tiếp qua debug
-- =============================================
local function hookButtonDirect()
    local frame = nil
    for _, desc in ipairs(game:GetDescendants()) do
        if desc.Name == "SkipTutorial" then
            frame = desc
            break
        end
    end
    if not frame then return end

    -- Tìm script gần nhất quản lý frame này
    local function findOwnerScript(obj)
        local cur = obj
        while cur and cur ~= game do
            for _, child in ipairs(cur:GetChildren()) do
                if child:IsA("LocalScript") and not child.Disabled then
                    return child
                end
            end
            cur = cur.Parent
        end
        return nil
    end

    local ownerScript = findOwnerScript(frame)
    if ownerScript then
        print("[HookDirect] Owner script: " .. ownerScript:GetFullName())
        local ok, env = pcall(getsenv, ownerScript)
        if ok and env then
            -- Dump toàn bộ env để debug
            for k, v in pairs(env) do
                print("  [ENV KEY] " .. tostring(k) .. " = " .. type(v))
            end
        end
    end
end

-- =============================================
-- APPROACH 5: Tìm AnimationTrack/Tween đang chạy và skip
-- =============================================
local function skipAnimationsAndTweens()
    -- Skip mọi Tween đang chạy (tutorial thường dùng tween)
    local TweenService = game:GetService("TweenService")
    for _, obj in ipairs(game:GetDescendants()) do
        -- Complete tween nếu có
        local ok, tweens = pcall(function()
            return obj:GetChildren()
        end)
    end
    print("[Tween] Attempted skip all tweens")
end

-- =============================================
-- MAIN LOOP
-- =============================================
local function runSkipTutorial()
    print("=== NEW APPROACH SkipTutorial ===")

    -- Bật spy hooks ngay lập tức
    print("[*] Spy hooks active, chờ 2s để capture...")
    task.wait(2)

    local attempts = 0
    local done = false

    while not done and attempts < 300 do
        attempts = attempts + 1
        task.wait(0.1)

        local frame = nil
        for _, desc in ipairs(game:GetDescendants()) do
            if desc.Name == "SkipTutorial" then
                frame = desc
                break
            end
        end

        if frame then
            if attempts == 1 then
                -- Lần đầu: hook direct và scan env
                hookButtonDirect()
                scanScriptEnvironments()
                skipAnimationsAndTweens()
            end

            -- Mỗi 10 lần thử: replay captured remotes
            if attempts % 10 == 0 then
                replayCaptured()
                scanScriptEnvironments()
            end

            print("[" .. attempts .. "] Frame vẫn còn, tiếp tục thử...")
        else
            if attempts > 5 then
                done = true
                print("=== Frame biến mất = Tutorial đã skip! ===")
            end
        end
    end
end

-- =============================================
-- TELEPORT + RUN
-- =============================================
local function checkAndTeleport()
    if game.PlaceId ~= targetPlaceId then
        print("Teleporting...")
        TeleportService:Teleport(targetPlaceId, player)
    else
        if setfpscap then setfpscap(2) end
        task.spawn(runSkipTutorial)
    end
end

task.wait(5)
checkAndTeleport()

while true do
    task.wait(30)
    if game.PlaceId ~= targetPlaceId then
        checkAndTeleport()
    end
end