script_key = "eeLluisnaQwCWznUGhHiZjNjnktVHIAp"
getgenv().TLHUB = getgenv().TLHUB or {
    SettingFarm = {
        DupePrivateServer = true,
        BoostFPS = true,
        FpsLock = { true, 20 },
        ProtectRarityAnimals = {"Secret","Brainrot God"},
        AutoRebirth = true,
        AutoBuy = true,
        AutoSellAnimals = true,
        AutoBuyAnimalsToRebirth = true,
        LockPriority = true,
        AutoLock = true,
        CollectInterval = 20,
        KickWhenRebirth = true,
        OpenLuckyBlock = false,
    },
    Rarity = { "Common","Rare","Epic","Legendary","Mythic","Admin","Brainrot God","Secret" },
    ["Buy Lucky Block"] = {
        "Admin Lucky Block",
        "Secret Lucky Block",
        "Los Lucky Blocks"
    },
    Webhook = {
        Enabled = true,
        WebhookURL = "url",
        WebhookSettings = { ModeSend = "Edit", PerSec = 20 },
        BuyNotification = { Enabled = true, PingEveryone = true, Rarity = {"Secret","Brainrot God"} }
    },
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c6b1d1e91b90e41732abcbe3cd5697d0.lua"))()
