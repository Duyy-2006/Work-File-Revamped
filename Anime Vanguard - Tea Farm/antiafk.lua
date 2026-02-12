--[[
    Roblox Anti-AFK Script (Lua)
    ----------------------------
    Prevents the automatic AFK kick by simulating tiny
    inputs at regular intervals.

    How it works:
      - Connects to the Players.Idled event to detect when
        Roblox thinks you're idle.
      - Simulates a small virtual click via VirtualUser to
        reset the AFK timer.
      - Also runs a periodic backup loop as a safety net.

    Usage:
      Paste this into a LocalScript (e.g. StarterPlayerScripts)
      or run via the Developer Console (F9) while testing.
]]

-- Services
local Players     = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

-- Settings
local INTERVAL = 60  -- Seconds between periodic nudges

---------------------------------------------------------------------
-- Method 1: React to the Idled event (fires at ~20 min idle)
---------------------------------------------------------------------
local player = Players.LocalPlayer

player.Idled:Connect(function()
    -- Simulate a quick virtual mouse click to reset the timer
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(0.1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    print("[Anti-AFK] Idled event caught — input sent.")
end)

---------------------------------------------------------------------
-- Method 2: Periodic nudge loop (backup safety net)
---------------------------------------------------------------------
task.spawn(function()
    while task.wait(INTERVAL) do
        VirtualUser:ClickButton1(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        print("[Anti-AFK] Periodic nudge sent.")
    end
end)

---------------------------------------------------------------------
-- Optional: Tiny character movement nudge
---------------------------------------------------------------------
task.spawn(function()
    while task.wait(INTERVAL + 10) do
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                -- Make the character jump briefly
                humanoid.Jump = true
                print("[Anti-AFK] Jump nudge sent.")
            end
        end
    end
end)

print("[Anti-AFK] Script loaded successfully. AFK kick is now prevented.")