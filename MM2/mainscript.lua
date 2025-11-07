if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end

wait(5)
setfpscap(5)

task.spawn(function()
    script_key = "BVpLUEgYVUXtqprzrfKgxVRTqrUtAlnm";

    getgenv().Config = {
        HUDHopMinGain   = 500,     -- Candies                    -- Minimum candy collected (supports "HUDHopWindowSec") 
        HUDHopWindowSec = 3600,    -- Second                     -- Minimum farming time (supports "HUDHopMinGain") 
        FPSCap          = 5,                                  -- Best fps optimized, can change if you want! (recommend 5 fps+)
        Mode            = "",                                 -- "battlepass" or "crate"
        OpenDelay       = 2.5,    -- Second                    -- Crate Open Delay
        Webhook         = "your webhook here",                -- Crate notify
        DiscordID       = "put your discord id here"          -- Crate notify (need metion)
    }

    -- USE THE CORRECT LOADSTRING FOR YOUR NUMBER OF TABS! PICK ONLY ONE LOADSTRING!
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/415a39cc0109e5b58e77746da4f782d4.lua"))() -- 300 TABS
end)
