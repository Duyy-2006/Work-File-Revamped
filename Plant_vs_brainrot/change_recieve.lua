if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
local TreeTable = {
    "Mango",
}



local Players     = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local player      = Players.LocalPlayer
local filename    = player.Name .. ".txt"
local error_count = 0
repeat task.wait() until LocalPlayer and LocalPlayer:FindFirstChild("Backpack")

while true do
    wait(1)
    local matchCount = 0

    -- Count tools in Backpack
    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
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

    if matchCount > 0 then
        writefile(filename, "Yummytool")
        player:Kick("du pet r be iu di ra th")
    else 
        error_count += 1
    end

    if error_count >= 3000 then
        player:Kick("Loi pet r bro")
    end
    
    task.wait(.1)
end
