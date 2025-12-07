if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
wait(5)
setfpscap(2)
task.spawn(function()
    script_key="dCsrDWdsslpaMkVGHZmrKbKOdfPkMXCG";
    getgenv().Config = {
        ["PetAMountToBuy"] = "999", -- can be 999
        ["WhatCategory"] = "pets", -- gifts if WhatCategory = "" then = pets
        ["PetRemoteToBuy"] = "aztec_egg_2025_aztec_egg", -- exemple for gifts halloween_2025_spider_box


        ["PetFarmAutoSwitchFullGrown"] = false,
        ["PetFarmActive"] = true, -- farm potion


        ["EggFarmActive"] = false, -- farm egg, if no more eggs will farm potion, if found new egg will farm them to
        ["EggToIgnore"] = {""}, -- eggs to ignore when eggfarm active
        ["LoopBuyEgg"] = true, -- when enough bucks will buy egg, only work with eggfarm
        ["EggToBuyEgg"] = "aztec_egg_2025_aztec_egg",


        ["NeonMegaFarm"] = true,
        ["BuyEgg"] = "aztec_egg_2025_aztec_egg", -- only work with NeonMegaFarm, will loop buy this egg when enough bucks
        

        ["AutoReleasePet"] = false, -- work with egg/pet farm, will release selected rarity
        ["RecycleWebhook"] = "",
        ["common"] = false,
        ["uncommon"] = false,
        ["rare"] = false,
        ["ultra_rare"] = false,

        ["HideUselessGui"] = true,
        ["Blur_username"] = true,
        ["Blazing_Lion_Log"] = false,
        ["DiscordId"] = "123456",
        ["Webhook"] = "",
        ["LegendaryWebhook"] = "",
        ["NeonMegaWebhook"] = "",
    }
    loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/66567bfd337b57eb059b58dbe1badb89.lua"))()
end)
