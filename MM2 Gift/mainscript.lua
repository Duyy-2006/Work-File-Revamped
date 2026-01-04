script_key="yIftqDhcUjivCHqxnGQrcOGClbMYHOCW";
getgenv().Config = {
    HUDHopMinGain = 80,     -- Tokens                    -- Minimum snow tokens collected (in 10 minutes)
    HUDHopWindowSec = 600,  -- Second                    --
    FPSCap     = 5,                                      -- Best fps optimized, can change if you want! (recommend 5 fps+)
    AutoSendGiftSelf = false,                             -- true or false
    Mode       = "mysterybox",                     -- "battlepass" or "crate" or "mysterybox"
    Webhook    = "your_webhook_here",                    -- Crate notify
    DiscordID  = "put_your_discord_id_here"              -- Crate notify (need metion)
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/415a39cc0109e5b58e77746da4f782d4.lua"))() -- 300 TABS
