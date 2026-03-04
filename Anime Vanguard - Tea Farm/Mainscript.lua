if not game:IsLoaded() then game.Loaded:Wait() end
wait(10)

local targetPlaceId = 18219125606
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function findSkipFrame()
    for _, desc in ipairs(game:GetDescendants()) do
        if desc.Name == "SkipTutorial" then
            return desc
        end
    end
    return nil
end

local function runSkipTutorial()
    print("=== Mobile-Safe SkipTutorial ===")
    local done = false
    local attempts = 0

    while not done and attempts < 300 do
        attempts = attempts + 1
        task.wait(0.1)

        local frame = findSkipFrame()
        if not frame then
            if attempts % 20 == 0 then print("Chưa thấy... " .. attempts) end
            continue
        end

        print("[" .. attempts .. "] Found: " .. frame:GetFullName())

        -- =============================================
        -- METHOD 1: firetouchinterest (mobile executor hỗ trợ)
        -- =============================================
        pcall(function()
            firetouchinterest(frame, player.Character and player.Character:FindFirstChild("HumanoidRootPart"), 0)
            firetouchinterest(frame, player.Character and player.Character:FindFirstChild("HumanoidRootPart"), 1)
            print("[M1] firetouchinterest fired")
        end)

        -- =============================================
        -- METHOD 2: firetouchinterest trên children
        -- =============================================
        for _, child in ipairs(frame:GetDescendants()) do
            pcall(function()
                if child:IsA("TextButton") or child:IsA("ImageButton") or child:IsA("Frame") then
                    firetouchinterest(child, player.Character and player.Character:FindFirstChild("HumanoidRootPart"), 0)
                    firetouchinterest(child, player.Character and player.Character:FindFirstChild("HumanoidRootPart"), 1)
                end
            end)
        end

        -- =============================================
        -- METHOD 3: Click thẳng signal (không cần getconnections)
        -- =============================================
        for _, child in ipairs(frame:GetDescendants()) do
            if child:IsA("TextButton") or child:IsA("ImageButton") then
                pcall(function()
                    -- Direct signal fire (hoạt động trên một số mobile executor)
                    child.MouseButton1Click:Fire()
                    child.Activated:Fire()
                    print("[M3] Signal fired on: " .. child.Name)
                end)
            end
        end

        -- =============================================
        -- METHOD 4: Frame Activated signal
        -- =============================================
        pcall(function()
            frame.Activated:Fire()
            frame.InputBegan:Fire(Instance.new("InputObject"))
        end)

        -- =============================================
        -- METHOD 5: Fire tất cả RemoteEvent/BindableEvent
        -- =============================================
        for _, obj in ipairs(game:GetDescendants()) do
            local name = obj.Name:lower()
            if name:find("skip") or name:find("tutorial") or name:find("complet") then
                if obj:IsA("RemoteEvent") then
                    pcall(function()
                        obj:FireServer()
                        print("[M5] RemoteEvent: " .. obj.Name)
                    end)
                elseif obj:IsA("BindableEvent") then
                    pcall(function()
                        obj:Fire()
                        print("[M5] BindableEvent: " .. obj.Name)
                    end)
                elseif obj:IsA("RemoteFunction") then
                    pcall(function()
                        obj:InvokeServer()
                        print("[M5] RemoteFunction: " .. obj.Name)
                    end)
                end
            end
        end

        -- =============================================
        -- METHOD 6: Set BoolValue/IntValue tutorial flags
        -- =============================================
        for _, obj in ipairs(game:GetDescendants()) do
            local name = obj.Name:lower()
            if name:find("tutorial") or name:find("skip") or name:find("complet") then
                pcall(function()
                    if obj:IsA("BoolValue") then
                        obj.Value = true
                        print("[M6] BoolValue: " .. obj.Name)
                    elseif obj:IsA("IntValue") then
                        obj.Value = 999
                        print("[M6] IntValue: " .. obj.Name)
                    end
                end)
            end
        end

        -- Check nếu frame đã biến mất = thành công
        task.wait(0.1)
        if not findSkipFrame() then
            done = true
            print("=== SUCCESS: Frame gone sau " .. attempts .. " lần ===")
        end
    end
end

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