while true do
    if game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild('Tutorial') and game:GetService("Players").LocalPlayer.PlayerGui.HUD.Tutorial.Visible == true then
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpawnTutorialBrainrot"):FireServer()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("FinishTutorial"):FireServer()
    end
    wait(5)
end    
