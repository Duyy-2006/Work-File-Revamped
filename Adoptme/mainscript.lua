if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
wait(5)
setfpscap(2)
script_key="dCsrDWdsslpaMkVGHZmrKbKOdfPkMXCG";
getgenv().Config = {
    ["PetAMountToBuy"] = "0", -- can be 999
    ["WhatCategory"] = "pets", -- gifts if WhatCategory = "" then = pets
    ["PetRemoteToBuy"] = "aztec_egg_2025_aztec_egg", -- exemple for gifts halloween_2025_spider_box

    ["PetFarmAutoSwitchFullGrown"] = false,
    ["PetFarmActive"] = false,
    ["LitePetFarmActive"] = true,
    ["EggFarmActive"] = false,
    
    ["HideUselessGui"] = true,
    ["Blur_username"] = true,
    ["Blazing_Lion_Log"] = false,
    ["DiscordId"] = "123456",
    ["Webhook"] = "",
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/66567bfd337b57eb059b58dbe1badb89.lua"))()