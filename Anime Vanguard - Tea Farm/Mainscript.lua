-- Chờ game load hoàn toàn
if not game:IsLoaded() then
    game.Loaded:Wait()
end
wait(10)
local targetPlaceId = 18219125606
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- =============================================
-- SKIP TUTORIAL SCRIPT
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

local function tryActivateFrame(frame)
    local fired = false
    for _, child in ipairs(frame:GetDescendants()) do
        if child:IsA("TextButton") or child:IsA("ImageButton") then
            print("Tìm thấy button con: " .. child:GetFullName())
            fired = fired or fireConnections(child, "MouseButton1Click")
            fired = fired or fireConnections(child, "Activated")
            fired = fired or fireConnections(child, "MouseButton1Down")
        end
    end
    local events = {"InputBegan", "MouseEnter", "Activated"}
    for _, ev in ipairs(events) do
        fired = fired or fireConnections(frame, ev)
    end
    pcall(function() fireConnections(frame, "InputBegan") end)
    return fired
end

local function runSkipTutorial()
    print("=== No-Click SkipTutorial bắt đầu ===")
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
        -- Đã ở đúng place → hạ FPS + chạy skip tutorial
        if setfpscap then
            setfpscap(2)
            print("Đã hạ FPS xuống 2.")
        end
        task.spawn(runSkipTutorial)
    end
end

task.wait(5)
checkAndTeleport()

-- Kiểm tra định kỳ (đề phòng bị teleport ra)
while true do
    task.wait(30)
    if game.PlaceId ~= targetPlaceId then
        checkAndTeleport()
    end
end