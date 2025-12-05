--// =====================================================
--// Auto friend everyone in the current server (client)
--// Synapse / executor friendly
--// =====================================================

getgenv().AUTO_FRIEND_ALL = true  -- set to false + re-exec to stop

local Players     = game:GetService("Players")
local StarterGui  = game:GetService("StarterGui")

-- Make sure the game + SetCore are ready
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local function coreReady()
    return pcall(function()
        StarterGui:SetCore("ResetButtonCallback", nil)
    end)
end

repeat task.wait(0.2) until coreReady()

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local prompted = {}  -- [userId] = true once we already prompted

--// Prompt Roblox's built-in friend request UI for a player
local function promptFriend(player)
    if not getgenv().AUTO_FRIEND_ALL then return end
    if not player or player == LocalPlayer then return end
    if prompted[player.UserId] then return end

    local ok, err = pcall(function()
        StarterGui:SetCore("PromptSendFriendRequest", player)
    end)

    if ok then
        prompted[player.UserId] = true
        print("[AutoFriend] Prompted friend request to:", player.Name)
    else
        warn("[AutoFriend] Failed to prompt for", player.Name, "=>", err)
    end
end

--// Prompt for everyone currently in the server
for _, plr in ipairs(Players:GetPlayers()) do
    promptFriend(plr)
end

--// Prompt for any new players that join
Players.PlayerAdded:Connect(function(plr)
    task.wait(1) -- small delay just in case
    promptFriend(plr)
end)

--// Optional: log when someone actually becomes your friend
pcall(function()
    local friendedBindable = StarterGui:GetCore("PlayerFriendedEvent")
    if friendedBindable and friendedBindable.Event then
        friendedBindable.Event:Connect(function(plr)
            print("[AutoFriend] You are now friends with:", plr.Name, "(", plr.UserId, ")")
        end)
    end
end)

print("[AutoFriend] Loaded. It will prompt friend requests for everyone in this server.")
print("[AutoFriend] To stop, set getgenv().AUTO_FRIEND_ALL = false and re-execute.")
