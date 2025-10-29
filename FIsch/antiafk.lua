if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end

task.wait(10)

local player = game:GetService("Players").LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local level = leaderstats:WaitForChild("Level")
print(level.Value)

while true do
    local first = level.Value
    task.wait(300)
    local second = level.Value
    if first == second then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end 
end
