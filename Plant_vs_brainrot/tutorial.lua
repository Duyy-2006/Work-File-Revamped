if not game:IsLoaded() then
    game.Loaded:Wait()
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local SpawnTutorial = Remotes:WaitForChild("SpawnTutorialBrainrot")
local FinishTutorial = Remotes:WaitForChild("FinishTutorial")

local function getSeenTutorial()
    local ok, seen = pcall(function()
        local PlayerData = require(ReplicatedStorage:WaitForChild("PlayerData"))
        local d = PlayerData:GetData()
        return d and d.Data and d.Data.SeenTutorial or false
    end)
    return ok and seen or false
end

local attempts, maxAttempts = 0, 10
local done = false

while not done and attempts < maxAttempts do
    local seen = getSeenTutorial()
    print("SeenTutorial =", tostring(seen))

    if not seen then
        print("Skip Tutorial (attempt " .. (attempts + 1) .. ")")
        pcall(function() SpawnTutorial:FireServer() end)
        task.wait(0.5)
        pcall(function() FinishTutorial:FireServer() end)
        task.wait(1)
        if getSeenTutorial() then
            print("Tutorial marked finished.")
            done = true
            break
        end
    else
        print("Tutorial already finished.")
        done = true
        break
    end

    attempts = attempts + 1
    task.wait(5) -- check again in 5 seconds
end
