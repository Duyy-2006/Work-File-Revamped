-- Chờ game load hoàn toàn
if not game:IsLoaded() then
    game.Loaded:Wait()
end
wait(10)

local targetPlaceId = 18219125606
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local player = Players.LocalPlayer

-- =============================================
-- DETECT MOBILE
-- =============================================
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
print("Platform: " .. (isMobile and "MOBILE" or "PC"))

-- =============================================
-- FIRE CONNECTIONS
-- =============================================
local function fireConnections(instance, eventName)
    local ok, conns = pcall(getconnections, instance[eventName])
    if not ok or not conns then return false end
    local fired = false
    for _, conn in ipairs(conns) do
        pcall(function()
            conn:Fire()
            fired = true
            print("[Connections] Fired: " .. instance:GetFullName() .. "." .. eventName)
        end)
    end
    return fired
end

-- =============================================
-- MOBILE TOUCH SIMULATION
-- =============================================
local function simulateTouch(guiObject)
    if not guiObject or not guiObject.Parent then return false end
    local fired = false

    local pos = guiObject.AbsolutePosition
    local size = guiObject.AbsoluteSize
    local cx = pos.X + size.X / 2
    local cy = pos.Y + size.Y / 2

    -- Method 1: VirtualInputManager Touch
    pcall(function()
        VirtualInputManager:SendTouchEvent(0, Vector2.new(cx, cy), true, game)
        task.wait(0.05)
        VirtualInputManager:SendTouchEvent(0, Vector2.new(cx, cy), false, game)
        print("[Touch] VirtualInputManager touch sent")
        fired = true
    end)

    -- Method 2: VirtualInputManager Mouse (fallback)
    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(cx, cy, 0, true, game, 0)
        task.wait(0.05)
        VirtualInputManager:SendMouseButtonEvent(cx, cy, 0, false, game, 0)
        print("[Touch] VirtualInputManager mouse sent")
        fired = true
    end)

    -- Method 3: SendTouchEvent via gyroscope workaround
    pcall(function()
        VirtualInputManager:SendMouseMoveEvent(cx, cy, game)
        task.wait(0.02)
        VirtualInputManager:SendMouseButtonEvent(cx, cy, 0, true, game, 0)
        task.wait(0.05)
        VirtualInputManager:SendMouseButtonEvent(cx, cy, 0, false, game, 0)
        fired = true
    end)

    return fired
end

-- =============================================
-- FIRE ALL EVENTS (PC + Mobile)
-- =============================================
local function fireAllEvents(obj)
    local fired = false

    -- PC events
    local pcEvents = {
        "MouseButton1Click", "MouseButton1Down", "MouseButton1Up",
        "Activated", "InputBegan", "InputEnded", "MouseEnter"
    }
    for _, ev in ipairs(pcEvents) do
        pcall(function()
            fired = fired or fireConnections(obj, ev)
        end)
    end

    -- Mobile/Touch events
    local touchEvents = {
        "TouchTap", "TouchLongPress", "TouchSwipe",
        "TouchPinch", "TouchRotate", "TouchPan"
    }
    for _, ev in ipairs(touchEvents) do
        pcall(function()
            fired = fired or fireConnections(obj, ev)
        end)
    end

    -- Simulate actual touch position
    fired = fired or simulateTouch(obj)

    return fired
end

-- =============================================
-- FIND & FIRE REMOTES
-- =============================================
local function findAndFireRemotes()
    local keywords = {"skip", "tutorial"}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local name = obj.Name:lower()
            for _, kw in ipairs(keywords) do
                if name:find(kw) then
                    print("Remote: " .. obj:GetFullName())
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
-- FORCE DISMISS
-- =============================================
local function forceDismissTutorial()
    local keywords = {"Tutorial", "PartOne", "TutorialHandler", "HUD"}
    for _, obj in ipairs(game:GetDescendants()) do
        for _, kw in ipairs(keywords) do
            if obj.Name:find(kw) then
                pcall(function()
                    if obj:IsA("ScreenGui") or obj:IsA("Frame") then
                        obj.Enabled = false
                        print("[ForceDismiss] Disabled: " .. obj:GetFullName())
                    end
                    if obj:IsA("LocalScript") or obj:IsA("Script") then
                        obj.Disabled = true
                        print("[ForceDismiss] Script disabled: " .. obj:GetFullName())
                    end
                end)
                break
            end
        end
    end
end

-- =============================================
-- SET VALUES
-- =============================================
local function setTutorialValues()
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("BoolValue") or obj:IsA("IntValue") then
            local name = obj.Name:lower()
            if name:find("tutorial") or name:find("skip") or name:find("complet") then
                pcall(function()
                    if obj:IsA("BoolValue") then obj.Value = true end
                    if obj:IsA("IntValue") then obj.Value = 1 end
                    print("[Value] Set: " .. obj:GetFullName())
                end)
            end
        end
    end
end

-- =============================================
-- TRY ACTIVATE (Frame + Children)
-- =============================================
local function tryActivateFrame(frame)
    local fired = false

    -- Fire trên tất cả children (TextButton, ImageButton, Frame)
    for _, child in ipairs(frame:GetDescendants()) do
        if child:IsA("TextButton") or child:IsA("ImageButton") or child:IsA("Frame") then
            print("Thử child: " .. child:GetFullName())
            fired = fired or fireAllEvents(child)
        end
    end

    -- Fire trên chính frame
    fired = fired or fireAllEvents(frame)

    return fired
end

-- =============================================
-- RUN SKIP TUTORIAL
-- =============================================
local function runSkipTutorial()
    print("=== SkipTutorial bắt đầu (Mobile + PC) ===")
    local done = false
    local attempts = 0

    while not done and attempts < 300 do
        attempts = attempts + 1
        task.wait(0.1)

        local button = nil
        for _, desc in ipairs(game:GetDescendants()) do
            if desc.Name == "SkipTutorial" then
                button = desc
                break
            end
        end

        if button then
            print("Tìm thấy: " .. button:GetFullName() .. " | Class: " .. button.ClassName)

            local m1 = tryActivateFrame(button)
            findAndFireRemotes()
            forceDismissTutorial()
            setTutorialValues()

            if m1 then
                done = true
                print("=== Kích hoạt thành công sau " .. attempts .. " lần ===")
            end
        else
            if attempts % 20 == 0 then
                print("Chưa thấy SkipTutorial... lần " .. attempts)
            end
        end
    end
end

-- =============================================
-- MAIN LOGIC
-- =============================================
local function checkAndTeleport()
    if game.PlaceId ~= targetPlaceId then
        print("Đang dịch chuyển về đúng Place...")
        TeleportService:Teleport(targetPlaceId, player)
    else
        if setfpscap then
            setfpscap(2)
            print("Đã hạ FPS xuống 2.")
        end
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