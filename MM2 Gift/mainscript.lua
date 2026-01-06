script_key="yIftqDhcUjivCHqxnGQrcOGClbMYHOCW";
getgenv().Config = {
    HUDHopMinGain = 80,     -- Tokens                    -- Minimum snow tokens collected (in 10 minutes)
    HUDHopWindowSec = 600,  -- Second                    --
    FPSCap     = 5,                                      -- Best fps optimized, can change if you want! (recommend 5 fps+)
    AutoSendGiftSelf = true,                             -- true or false
    Mode       = "crate",                     -- "battlepass" or "crate" or "mysterybox"
    Webhook    = "https://discord.com/api/webhooks/967820762734030899/lPujX41Md70Per8IZyU6jwMFHpvl-_5MFqQSzguUMGYZep1a_t0HHYzTFTJ8gPBolGrP",                    -- Crate notify
    DiscordID  = "935143471243726858"              -- Crate notify (need metion)
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/415a39cc0109e5b58e77746da4f782d4.lua"))() -- 300 TABS
