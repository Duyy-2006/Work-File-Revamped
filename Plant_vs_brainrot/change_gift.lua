-- LocalScript in StarterPlayerScripts
if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
wait(60)
local TreeTable = {
   "Shroombino",
}

local Players     = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local player      = Players.LocalPlayer
local filename    = player.Name .. ".txt"

repeat task.wait() until LocalPlayer and LocalPlayer:FindFirstChild("Backpack")

while true do
    local matchCount = 0
    local backpackcount = 0
    -- Count tools in Backpack
    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        backpackcount += 1
        if tool:IsA("Tool") then
            for _, treeName in ipairs(TreeTable) do
                if string.find(tool.Name, treeName, 1, true) then
                    matchCount = matchCount + 1
                    break -- stop checking this tool once matched
                end
            end
        end
    end

    -- Count currently equipped tools (parented to Character)
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    for _, tool in ipairs(character:GetChildren()) do
        if tool:IsA("Tool") then
            for _, treeName in ipairs(TreeTable) do
                if string.find(tool.Name, treeName, 1, true) then
                    matchCount = matchCount + 1
                    break -- stop checking this tool once matched
                end
            end
        end
    end
    task.wait(10)
    print(matchCount)
    if matchCount < 1 and backpackcount > 0 then
        writefile(filename, "Yummytool")
        player:Kick("du pet r be iu di ra th")
    end

    
end
