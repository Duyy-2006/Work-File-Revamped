if not game:IsLoaded() then game.Loaded:Wait() end
wait(10)

local targetPlaceId = 18219125606
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- =============================================
-- APPROACH 1: Destroy trực tiếp tutorial UI
-- Nếu game không check state → tutorial biến mất
-- =============================================
local function destroyTutorialUI()
    local keywords = {"Tutorial", "PartOne", "PartTwo", "PartThree", "TutorialHandler"}
    for _, obj in ipairs(game:GetDescendants()) do
        for _, kw in ipairs(keywords) do
            if obj.Name:find(kw) then
                pcall(function()
                    obj:Destroy()
                    print("[DESTROY] " .. obj:GetFullName())
                end)
                break
            end
        end
    end
end

-- =============================================
-- APPROACH 2: :Fire() trực tiếp trên signal
-- (Roblox API chuẩn, không cần executor API)
-- =============================================
local function fireSignals(frame)
    -- Fire trực tiếp lên frame
    pcall(function() frame.Activated:Fire() end)
    pcall(function() frame.InputBegan:Fire(Instance.new("InputObject")) end)

    -- Fire lên tất cả children
    for _, child in ipairs(frame:GetDescendants()) do
        if child:IsA("TextButton") or child:IsA("ImageButton") then
            pcall(function()
                child.MouseButton1Click:Fire()
                child.Activated:Fire()
                child.MouseButton1Down:Fire(0, 0)
                child.MouseButton1Up:Fire(0, 0)
                print("[SIGNAL] " .. child:GetFullName())
            end)
        end
        -- Frame cũng có thể có InputBegan
        if child:IsA("Frame") then
            pcall(function()
                child.InputBegan:Fire(Instance.new("InputObject"))
                child.Activated:Fire()
            end)
        end
    end
end

-- =============================================
-- APPROACH 3: Set tất cả values liên quan
-- =============================================
local function setAllValues()
    local kws = {
        "tutorial","skip","complet","finish","shown",
        "progress","step","phase","done","passed",
        "intro","guide","first","seen"
    }
    for _, obj in ipairs(game:GetDescendants()) do
        local n = obj.Name:lower()
        for _, kw in ipairs(kws) do
            if n:find(kw) then
                pcall(function()
                    if obj:IsA("BoolValue")   then obj.Value = true        end
                    if obj:IsA("IntValue")    then obj.Value = 999         end
                    if obj:IsA("NumberValue") then obj.Value = 999         end
                    if obj:IsA("StringValue") then obj.Value = "completed" end
                    print("[VALUE] " .. obj:GetFullName())
                end)
                break
            end
        end
    end
end

-- =============================================
-- APPROACH 4: Fire tất cả Remote/Bindable liên quan
-- (API chuẩn Roblox, không cần executor)
-- =============================================
local function fireAllRemotes()
    local kws = {
        "skip","tutorial","complet","finish",
        "close","dismiss","proceed","next",
        "quest","progress","advance","step"
    }
    for _, obj in ipairs(game:GetDescendants()) do
        local n = obj.Name:lower()
        for _, kw in ipairs(kws) do
            if n:find(kw) then
                if obj:IsA("RemoteEvent") then
                    pcall(function()
                        obj:FireServer()
                        print("[REMOTE] " .. obj.Name)
                    end)
                elseif obj:IsA("RemoteFunction") then
                    pcall(function()
                        obj:InvokeServer()
                        print("[RFUNC] " .. obj.Name)
                    end)
                elseif obj:IsA("BindableEvent") then
                    pcall(function()
                        obj:Fire()
                        print("[BIND] " .. obj.Name)
                    end)
                elseif obj:IsA("BindableFunction") then
                    pcall(function()
                        obj:Invoke()
                        print("[BFUNC] " .. obj.Name)
                    end)
                end
                break
            end
        end
    end
end

-- =============================================
-- APPROACH 5: Disable scripts tutorial
-- =============================================
local function disableTutorialScripts()
    local kws = {"Tutorial", "Intro", "Guide", "Onboard"}
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then return end
    for _, obj in ipairs(playerGui:GetDescendants()) do
        for _, kw in ipairs(kws) do
            if obj.Name:find(kw) then
                if obj:IsA("LocalScript") or obj:IsA("Script") then
                    pcall(function()
                        obj.Disabled = true
                        print("[SCRIPT] Disabled: " .. obj:GetFullName())
                    end)
                end
                break
            end
        end
    end
end

-- =============================================
-- APPROACH 6: Rejoin same server (nuclear option)
-- Nếu tutorial chỉ hiện lần đầu vào server mới
-- =============================================
local rejoinAttempted = false
local function rejoinServer()
    if rejoinAttempted then return end
    rejoinAttempted = true
    -- Lấy JobId để vào lại cùng server
    local jobId = game.JobId
    if jobId and jobId ~= "" then
        print("[REJOIN] Rejoining server: " .. jobId)
        pcall(function()
            TeleportService:TeleportToPlaceInstance(targetPlaceId, jobId, player)
        end)
    else
        -- Vào server mới
        TeleportService:Teleport(targetPlaceId, player)
    end
end

-- =============================================
-- APPROACH 7: Watch & Intercept - khi frame xuất hiện
-- thì destroy ngay lập tức trước khi render
-- =============================================
local function watchAndDestroy()
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then return end

    playerGui.DescendantAdded:Connect(function(obj)
        if obj.Name == "SkipTutorial" or obj.Name:find("Tutorial") then
            task.wait() -- 1 frame delay
            pcall(function()
                -- Thử signal trước
                if obj:IsA("TextButton") or obj:IsA("ImageButton") then
                    obj.MouseButton1Click:Fire()
                    obj.Activated:Fire()
                end
                pcall(function() obj.Activated:Fire() end)
                pcall(function() obj.InputBegan:Fire(Instance.new("InputObject")) end)

                -- Rồi mới destroy nếu vẫn còn
                task.wait(0.5)
                if obj and obj.Parent then
                    obj:Destroy()
                    print("[WATCH] Destroyed on appear: " .. obj.Name)
                end
            end)
        end
    end)
    print("[WATCH] Watching PlayerGui for tutorial objects")
end

-- =============================================
-- MAIN LOOP
-- =============================================
local function findFrame()
    for _, desc in ipairs(game:GetDescendants()) do
        if desc.Name == "SkipTutorial" then return desc end
    end
    return nil
end

local function runSkipTutorial()
    print("=== NO-API SkipTutorial ===")

    -- Bật watcher ngay
    watchAndDestroy()

    local done = false
    local attempts = 0
    local destroyedAt = 0

    while not done and attempts < 500 do
        attempts = attempts + 1
        task.wait(0.1)

        local frame = findFrame()

        if frame then
            print("[" .. attempts .. "] Found: " .. frame:GetFullName())

            -- B1: Fire signals
            fireSignals(frame)

            -- B2: Set values (mỗi 5 lần)
            if attempts % 5 == 1 then
                setAllValues()
            end

            -- B3: Fire remotes (mỗi 10 lần)
            if attempts % 10 == 1 then
                fireAllRemotes()
            end

            -- B4: Disable scripts (mỗi 20 lần)
            if attempts % 20 == 1 then
                disableTutorialScripts()
            end

            -- B5: Nếu 100 lần vẫn không xong → destroy UI
            if attempts == 100 then
                print("[!] 100 lần thất bại → Destroy UI")
                destroyTutorialUI()
                destroyedAt = attempts
            end

            -- B6: Nếu 200 lần vẫn không xong → rejoin
            if attempts == 200 then
                print("[!] 200 lần thất bại → Rejoin server")
                rejoinServer()
            end

        else
            if attempts > 5 then
                done = true
                print("=== SUCCESS: Frame gone sau " .. attempts .. " lần ===")
                if destroyedAt > 0 then
                    print("(Frame bị destroy ở lần " .. destroyedAt .. ")")
                end
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