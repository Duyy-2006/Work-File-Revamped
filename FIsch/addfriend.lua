repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer.Character 
local Players = game:GetService("Players")
local PlayersTable = {}
local Count = 0 

local function addPlayer(player)
    if player ~= Players.LocalPlayer then
        table.insert(PlayersTable, player.Name)
    end
end

local function removePlayer(player)
    for i, v in pairs(PlayersTable) do
        if v == player.Name then
            table.remove(PlayersTable, i)
            break
        end
    end
end

Players.PlayerAdded:Connect(addPlayer)

Players.PlayerRemoving:Connect(removePlayer)

print('============== << STARTING ADD ALL TO TABLE >> ==============')
for _, player in pairs(Players:GetPlayers()) do
    addPlayer(player)
end

spawn(function()
    print('============== << STARTING CHECK >> ==============')
    while true do task.wait(5)
        if #PlayersTable > 0 then
            for i, playerName in pairs(PlayersTable) do
                local player = Players:FindFirstChild(playerName)
                if player then
                    local success, err = pcall(function()
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "Friend Request",
                            Text = player.Name,
                            Duration = 5
                        })
                        Players.LocalPlayer:RequestFriendship(player)
                        task.wait(10) 
                        Count += 1
                        if Count >= 5 then
                            table.remove(PlayersTable, i)
                            Count = 0 
                        end
                    end)
                    if not success then
                        warn("error" .. tostring(err))
                    end
                end
            end
        end
    end
end)