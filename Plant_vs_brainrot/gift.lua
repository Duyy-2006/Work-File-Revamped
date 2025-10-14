if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
wait(5)
local listcangift = {
    "Shroombino",
}
 -- tên Item cần gửi
local listnguoicangift = { "minny_nxy",
    "Hug0Hannah47",
    "MrsAndrewkn0ll2005",
    "Emmajolt2012",
    "MrsGamerKnack2006",
    "NexusJill_Dancer",
    "ArrowFlick21",
    "XxCyberPixelChaosxX2",
    "Z0e_Thunder2014YT",
    "PandaFusionPow3r",
    "XxPaisleySaberxX2023",
    "SamuelHawkLucky20191",
    "L3g3ndCraftPrimal",
    "XxSt3althN3onxX2005",
    "XxHeroSparkOmegaxX20",
    "Cooki3Alpha2008",} -- tên Player cần gửi

local function GetAllCayTrongvapet()
    for i,v in pairs(workspace.Plots:GetChildren()) do
        if v:GetAttribute('Owner') == game.Players.LocalPlayer.Name then
            for i1,v1 in pairs(v.Hitboxes:GetChildren()) do
                local args = {
                    v1.Name
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoveItem"):FireServer(unpack(args))
            end 
            for i1,v1 in pairs(v.Brainrots:GetChildren()) do
                if v1:FindFirstChild('Brainrot') and v1:FindFirstChild('Hitbox') and v1.Hitbox:FindFirstChildOfClass('ProximityPrompt') then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1.Hitbox.CFrame
                    wait(0.2)
                    fireproximityprompt(v1.Hitbox:FindFirstChildOfClass('ProximityPrompt'))
                end
             end
        end
    end
end
GetAllCayTrongvapet()



local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local function showNotify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title or "Thông báo",
            Text = text or "",
            Duration = duration or 3,
        })
    end)
end

local function findPlayer()
    for _, name in pairs(listnguoicangift) do
        local p = Players:FindFirstChild(name)
        if p then return p end
    end
end

local function findItem()
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        for _, itemName in pairs(listcangift) do
            if tool.Name:find(itemName) then
                return tool
            end
        end
    end
end

task.spawn(function()
    while task.wait(5) do
        local target = findPlayer()
        local item = findItem()

        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            if item then
                LocalPlayer.Character.Humanoid:EquipTool(item)
                LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
                wait(0.2)
                local args = {
                    {
                        Item = item,
                        ToGift = target.Name
                    }
                }
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("GiftItem"):FireServer(unpack(args))
                showNotify("Thông Báo", "Đã gửi pet: " .. item.Name, 5)
            else
                showNotify("Thông Báo Lỗi", "Không tìm thấy item cần trade", 5)
            end
        else
            showNotify("Thông Báo Lỗi", "Không tìm thấy người cần trade", 5)
        end
    end
end)
