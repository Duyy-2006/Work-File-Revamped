if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
wait(5)
setfpscap(2)
script_key="dCsrDWdsslpaMkVGHZmrKbKOdfPkMXCG";
getgenv().Config = {
    ["PetAMountToBuy"] = "0", -- can be 999
    ["WhatCategory"] = "", -- gifts if WhatCategory = "" then = pets
    ["PetRemoteToBuy"] = "", -- exemple for gifts halloween_2025_spider_box

    ["PetFarmAutoSwitchFullGrown"] = false,
    ["PetFarmActive"] = false,
    ["LitePetFarmActive"] = false,
    ["EggFarmActive"] = false,
    
    ["HideUselessGui"] = true,
    ["Blur_username"] = true,
    ["Blazing_Lion_Log"] = false,
    ["DiscordId"] = "123456",
    ["Webhook"] = "https://discord.com/api/webhooks/967820762734030899/lPujX41Md70Per8IZyU6jwMFHpvl-_5MFqQSzguUMGYZep1a_t0HHYzTFTJ8gPBolGrP",
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/66567bfd337b57eb059b58dbe1badb89.lua"))()
