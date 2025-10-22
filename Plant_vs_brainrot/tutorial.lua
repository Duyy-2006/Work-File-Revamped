if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
local v2 = game:GetService("ReplicatedStorage")
local v_u_12 = require(v2:WaitForChild("PlayerData")):GetData().Data
print(v_u_12.SeenTutorial)
if not v_u_12.SeenTutorial then
    print('Skip Tutorial')
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpawnTutorialBrainrot"):FireServer()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("FinishTutorial"):FireServer()
end
