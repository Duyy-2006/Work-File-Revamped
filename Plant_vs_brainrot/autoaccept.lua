if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
wait(5)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Utility = Modules:WaitForChild("Utility")
local PopUp = require(Utility:WaitForChild("PopUp"))

Remotes.GiftItem.OnClientEvent:Connect(function(data)
	local giftId = data.ID
	local giftingUser = data.Gifting
	local itemName = data.Item
	if giftId and giftingUser and itemName then
		Remotes.AcceptGift:FireServer({ ID = giftId })
	end
end)
