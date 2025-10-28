-- // Wait for game
if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
task.wait(5)

-- // Config
local listcangift = { "Tomatrio", "Shroombino", "Mango", "
King Limone",
}
local listnguoicangift = {
    "minny_nxy","Hug0Hannah47","MrsAndrewkn0ll2005","Emmajolt2012","MrsGamerKnack2006",
    "NexusJill_Dancer","ArrowFlick21","XxCyberPixelChaosxX2","Z0e_Thunder2014YT","PandaFusionPow3r",
    "XxPaisleySaberxX2023","SamuelHawkLucky20191","L3g3ndCraftPrimal","XxSt3althN3onxX2005",
    "XxHeroSparkOmegaxX20","Cooki3Alpha2008", "Tig3rTurbo200854","EliHyperUltra","BlizzardBaneTurbo70","XxMinerMoonxX2006","Jaxon_Blizzard2010",
}
local MIN_STOCK_AFTER_GIFT = 1         -- <-- change threshold here
local REPLICATION_WAIT = 0.75          -- wait after gifting for inventory to replicate
local KICK_MESSAGE = "du pet r be iu di ra th"

-- // Services / locals
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui        = game:GetService("StarterGui")
local LocalPlayer       = Players.LocalPlayer
local FILENAME          = (LocalPlayer and LocalPlayer.Name or "player") .. ".txt"

-- // Helper: toast notify (non-fatal)
local function showNotify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title or "Thông báo",
            Text = text or "",
            Duration = duration or 3,
        })
    end)
end

-- // Clean up plots (your original)
local function GetAllCayTrongvapet()
    for _, v in pairs(workspace.Plots:GetChildren()) do
        if v:GetAttribute('Owner') == Players.LocalPlayer.Name then
            for _, v1 in pairs(v.Hitboxes:GetChildren()) do
                local args = { v1.Name }
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("RemoveItem"):FireServer(unpack(args))
            end 
            for _, v1 in pairs(v.Brainrots:GetChildren()) do
                if v1:FindFirstChild('Brainrot') and v1:FindFirstChild('Hitbox') and v1.Hitbox:FindFirstChildOfClass('ProximityPrompt') then
                    local hrp = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = v1.Hitbox.CFrame
                        task.wait(0.2)
                        pcall(function()
                            fireproximityprompt(v1.Hitbox:FindFirstChildOfClass('ProximityPrompt'))
                        end)
                    end
                end
            end
        end
    end
end
GetAllCayTrongvapet()

-- // Target selection
local function findPlayer()
    for _, name in ipairs(listnguoicangift) do
        local p = Players:FindFirstChild(name)
        if p then return p end
    end
end

-- // Count watched items across Backpack + Character
local function countWatched()
    local count, backpackCount = 0, 0

    -- Backpack
    if LocalPlayer and LocalPlayer:FindFirstChild("Backpack") then
        for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                backpackCount += 1
                for _, itemName in ipairs(listcangift) do
                    if string.find(tool.Name, itemName, 1, true) then
                        count += 1
                        break
                    end
                end
            end
        end
    end

    -- Character
    local character = LocalPlayer and (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
    if character then
        for _, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                for _, itemName in ipairs(listcangift) do
                    if string.find(tool.Name, itemName, 1, true) then
                        count += 1
                        break
                    end
                end
            end
        end
    end

    return count, backpackCount
end

-- // Pick any watched item from Backpack
local function findItemToGift()
    if not LocalPlayer or not LocalPlayer:FindFirstChild("Backpack") then return end
    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            for _, itemName in ipairs(listcangift) do
                if string.find(tool.Name, itemName, 1, true) then
                    return tool
                end
            end
        end
    end
end

-- // Panic: write file + kick (only once)
local didPanic = false
local function panicAndExit(reason)
    if didPanic then return end
    didPanic = true

    -- try writefile
    pcall(function()
        if typeof(writefile) == "function" then
            writefile(FILENAME, "Yummytool")
        elseif typeof(appendfile) == "function" then
            appendfile(FILENAME, "Yummytool")
        end
    end)

    if reason then
        showNotify("Thoát", tostring(reason), 4)
    end
    pcall(function() LocalPlayer:Kick(KICK_MESSAGE) end)
end

-- // Gift loop
task.spawn(function()
    -- wait until character ready
    repeat task.wait(0.1) until LocalPlayer
        and LocalPlayer:FindFirstChild("Backpack")
        and (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())

    while task.wait(5) do
        -- PRE-CHECK: already too low? (avoid gifting at low stock)
        local preCount = countWatched()
        if preCount < MIN_STOCK_AFTER_GIFT then
            panicAndExit("Hết hàng theo ngưỡng cài đặt.")
            return
        end

        local target = findPlayer()
        local item   = findItemToGift()

        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            if item then
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid  = character:FindFirstChildOfClass("Humanoid")
                local myHRP     = character:FindFirstChild("HumanoidRootPart")
                local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")

                if humanoid and myHRP and targetHRP then
                    -- equip + TP near target
                    pcall(function() humanoid:EquipTool(item) end)
                    myHRP.CFrame = targetHRP.CFrame
                    task.wait(0.2)

                    -- fire remote to gift
                    local args = { { Item = item, ToGift = target.Name } }
                    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("GiftItem"):FireServer(unpack(args))
                    showNotify("Thông Báo", "Đã gửi: " .. (item.Name or "Item"), 4)

                    -- POST-CHECK: after gift replicates, is stock below threshold?
                    task.wait(REPLICATION_WAIT)
                    local afterCount = countWatched()
                    if afterCount < MIN_STOCK_AFTER_GIFT then
                        panicAndExit("Tồn kho dưới ngưỡng sau khi gửi.")
                        return
                    end
                end
            else
                showNotify("Thông Báo Lỗi", "Không tìm thấy item cần trade", 5)
            end
        else
            showNotify("Thông Báo Lỗi", "Không tìm thấy người cần trade", 5)
        end
    end
end)
