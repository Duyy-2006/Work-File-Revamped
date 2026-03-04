if not game:IsLoaded() then game.Loaded:Wait() end
wait(10)

local targetPlaceId = 18219125606
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- =============================================
-- CORE: Fire mọi connection trên object
-- =============================================
local function fireAllConnections(obj)
    local fired = false
    -- Lấy toàn bộ events có thể có trên GuiObject
    local allEvents = {
        -- Touch (mobile)
        "TouchTap", "TouchLongPress", "TouchPan", "TouchPinch",
        "TouchRotate", "TouchSwipe", "TouchStarted", "TouchEnded",
        -- Input
        "InputBegan", "InputChanged", "InputEnded",
        -- Mouse (fallback)
        "MouseButton1Click", "MouseButton1Down", "MouseButton1Up",
        "MouseButton2Click", "MouseButton2Down", "MouseButton2Up",
        "MouseEnter", "MouseLeave", "MouseMoved", "MouseWheelBackward", "MouseWheelForward",
        -- GUI
        "Activated", "SelectionGained", "SelectionLost",
    }

    for _, evName in ipairs(allEvents) do
        local ok, conns = pcall(function()
            return getconnections(obj[evName])
        end)
        if ok and conns then
            for _, conn in ipairs(conns) do
                local sok = pcall(function()
                    conn:Fire()
                end)
                if sok then
                    fired = true
                    print("[FIRE] " .. obj:GetFullName() .. " -> " .. evName)
                end
            end
        end
    end

    return fired
end

-- =============================================
-- CORE: Lấy upvalue script để gọi hàm skip
-- =============================================
local function tryScriptUpvalues(frame)
    -- Tìm tất cả LocalScript liên quan trong PlayerGui
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then return end

    for _, script in ipairs(playerGui:GetDescendants()) do
        if script:IsA("LocalScript") or script:IsA("ModuleScript") then
            -- Thử lấy upvalues (chỉ executor hỗ trợ)
            local ok, upvals = pcall(debug.getupvalues, script)
            if ok and upvals then
                for k, v in pairs(upvals) do
                    if type(v) == "function" then
                        local name = tostring(k):lower()
                        if name:find("skip") or name:find("tutorial") or name:find("close") or name:find("finish") then
                            print("[Upvalue] Gọi hàm: " .. tostring(k))
                            pcall(v)
                        end
                    end
                end
            end

            -- Thử getgenv / getrenv
            local ok2, env = pcall(getfenv, script)
            if ok2 and env then
                for k, v in pairs(env) do
                    if type(v) == "function" then
                        local name = tostring(k):lower()
                        if name:find("skip") or name:find("tutorial") or name:find("close") or name:find("finish") then
                            print("[Env] Gọi hàm: " .. tostring(k))
                            pcall(v)
                        end
                    end
                end
            end
        end
    end
end

-- =============================================
-- CORE: Fire BindableEvent liên quan
-- =============================================
local function fireBindables()
    local keywords = {"skip", "tutorial", "close", "finish", "complete", "next"}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("BindableEvent") or obj:IsA("BindableFunction") then
            local name = obj.Name:lower()
            for _, kw in ipairs(keywords) do
                if name:find(kw) then
                    print("[Bindable] Fire: " .. obj:GetFullName())
                    if obj:IsA("BindableEvent") then
                        pcall(function() obj:Fire() end)
                    else
                        pcall(function() obj:Invoke() end)
                    end
                end
            end
        end
    end
end

-- =============================================
-- CORE: Fire Remote liên quan
-- =============================================
local function fireRemotes()
    local keywords = {"skip", "tutorial", "close", "finish", "complete"}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local name = obj.Name:lower()
            for _, kw in ipairs(keywords) do
                if name:find(kw) then
                    print("[Remote] Fire: " .. obj:GetFullName())
                    if obj:IsA("RemoteEvent") then
                        pcall(function() obj:FireServer() end)
                    else
                        pcall(function() obj:InvokeServer() end)
                    end
                end
            end
        end
    end
end

-- =============================================
-- MAIN: Tìm và kích hoạt SkipTutorial
-- =============================================
local function runSkipTutorial()
    print("=== SkipTutorial START ===")
    local done = false
    local attempts = 0

    while not done and attempts < 300 do
        attempts = attempts + 1
        task.wait(0.1)

        -- Tìm frame
        local frame = nil
        for _, desc in ipairs(game:GetDescendants()) do
            if desc.Name == "SkipTutorial" then
                frame = desc
                break
            end
        end

        if frame then
            print("[" .. attempts .. "] Found: " .. frame:GetFullName())

            -- B1: Fire tất cả connections trên frame
            local f1 = fireAllConnections(frame)

            -- B2: Fire tất cả connections trên children
            for _, child in ipairs(frame:GetDescendants()) do
                fireAllConnections(child)
            end

            -- B3: Thử upvalue script
            tryScriptUpvalues(frame)

            -- B4: Fire bindables
            fireBindables()

            -- B5: Fire remotes
            fireRemotes()

            if f1 then
                done = true
                print("=== SUCCESS sau " .. attempts .. " lần ===")
            end
        else
            if attempts % 20 == 0 then
                print("Chưa thấy SkipTutorial... " .. attempts)
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