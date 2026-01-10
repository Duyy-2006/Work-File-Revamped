if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end

task.wait(10)


local player = game:GetService("Players").LocalPlayer
local level = player.PlayerGui.ScreenGui.MeterHUD.HoneyMeter.Bar.TextLabel

print(level.Text)

while true do
    local first = level.Text
    wait(30)
    local second = level.Text
    if first == second then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end 
    
end
