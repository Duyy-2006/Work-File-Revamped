--// Instant self-kick if server has > 1 player
--// Synapse-friendly (LocalScript / executor)

-- Ensure game and LocalPlayer are ready
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")

-- Some executors can run before LocalPlayer exists; wait for it.
local function getLocalPlayer()
    while not Players.LocalPlayer do
        task.wait()
    end
    return Players.LocalPlayer
end

local LP = getLocalPlayer()

-- Kick reason message (optional)
local REASON = "Auto-safety: more than 1 player detected in server."

-- Core checker
local function checkAndKick()
    -- GetPlayers() is up-to-date and fast
    local count = #Players:GetPlayers()
    if count > 1 then
        -- Use pcall to avoid errors if something races the kick
        pcall(function()
            LP:Kick(REASON)
        end)
    end
end

-- Run immediately on start
checkAndKick()

-- Instant reaction when someone joins
Players.PlayerAdded:Connect(function()
    -- Kick as soon as a second player appears
    checkAndKick()
end)

-- (Optional) tiny watchdog in case an event is missed due to executor timing
task.spawn(function()
    while task.wait(0.5) do
        checkAndKick()
    end
end)
