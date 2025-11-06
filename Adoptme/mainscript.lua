if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
wait(5)
task.spawn(function()
    script_key="dCsrDWdsslpaMkVGHZmrKbKOdfPkMXCG";
    getgenv().Config = {
        ["PetAMountToBuy"] = "0", -- can be 999
        ["WhatCategory"] = "pets", -- gifts if WhatCategory = "" then = pets
        ["PetRemoteToBuy"] = "retired_egg", -- exemple for gifts halloween_2025_spider_box

        ["PetFarmAutoSwitchFullGrown"] = false,
        ["PetFarmActive"] = false, -- farm potion
        ["EggFarmActive"] = true, -- farm egg, if no more eggs will farm potion

        ["NeonMegaFarm"] = false,
        ["BuyEgg"] = "retired_egg", -- only work with NeonMegaFarm, will loop buy this egg when enough bucks
        
        ["AutoReleasePet"] = false,
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
setfpscap(2)
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/66567bfd337b57eb059b58dbe1badb89.lua"))()
