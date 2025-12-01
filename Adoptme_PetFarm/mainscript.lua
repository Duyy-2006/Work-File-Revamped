if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
wait(5)
setfpscap(10)
script_key="dCsrDWdsslpaMkVGHZmrKbKOdfPkMXCG";
getgenv().Config = {
    ["PetAMountToBuy"] = "999", -- can be 999
    ["WhatCategory"] = "pets", -- gifts if WhatCategory = "" then = pets
    ["PetRemoteToBuy"] = "aztec_egg_2025_aztec_egg", -- exemple for gifts halloween_2025_spider_box

    ["PetFarmAutoSwitchFullGrown"] = false,
    ["PetFarmActive"] = true,
    ["LitePetFarmActive"] = true,
    ["EggFarmActive"] = true,
    
    ["HideUselessGui"] = true,
    ["Blur_username"] = true,
    ["Blazing_Lion_Log"] = false,
    ["DiscordId"] = "123456",
    ["Webhook"] = "https://discord.com/api/webhooks/967820762734030899/lPujX41Md70Per8IZyU6jwMFHpvl-_5MFqQSzguUMGYZep1a_t0HHYzTFTJ8gPBolGrP",
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/66567bfd337b57eb059b58dbe1badb89.lua"))()