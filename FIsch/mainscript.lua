_G.Fish_Location = CFrame.new(3726.26172, -1127.95703, -1070.00867, 0.732412577, 2.20410072e-08, 0.680861115, 8.9077199e-09, 1, -4.19544186e-08, -0.680861115, 3.67928621e-08, 0.732412577)
_G.FPSLimit = 10
_G.WhiteScreen = true
_G.MinReelTime = 3
_G.AutoSell = true

_G.SecondaryRods = {
    "Ethereal Prism Rod", "Cerulean Fang Rod", "Aurora Rod", "Tempest Rod",
    "Abyssal Specter Rod", "Destiny Rod", "Challenger's Rod", "Rod Of The Zenith",
    "Nocturnal Rod", "Kings Rod", "Trident Rod", "Poseidon Rod", "Champions Rod",
    "Volcanic Rod", "Summit Rod", "Training Rod", "Fast Rod", "Steady Rod",
    "Precision Rod", "Depthseeker Rod", "Vocanic Rod", "Voyager Rod",
    "Riptide Rod", "Rainbow Cluster Rod", "The Boom Ball", "Scarlet Spincaster Rod",
    "Zeus Rod", "Kraken Rod", "Leviathan's Fang Rod", "Celestial Rod", "Rod Of The Depths",
    "Rod Of The Forgotten Fang", "Plastic Rod", "Carbon Rod", "Long Rod", "Lucky Rod",
    "Fortune Rod", "Rapid Rod", "Magnet Rod", "Mythical Rod", "Midas Rod", "Scurvy Rod",
    "Phoenix Rod", "Arctic Rod", "Crystalized Rod", "Ice Warpers Rod", "Avalanche Rod",
    "Heaven's Rod", "Magma Rod", "Firefly Rod", "Frog Rod", "Frostbane Rod", "Dreambreaker", "Tryhard Rod",
    "Azure Of Lagoon", "Free Spirit Rod", "Verdant Shear Rod", "Stone Rod","Wildflower Rod", --"Carrot Rod",
    "Great Dreamer Rod", "Wicked Fang Rod", "Fungal Rod", "Duskwire", "Sanguine Spire", "Evil Pitchfork"
}

_G.Totems = {
    Enabled = true,
    ActivationLevel = 100,

    DayTotem = "Sundial Totem",
    NightTotem = "Aurora Totem",

    AutoPurchase = true,
    PurchaseLimit = {
        Day = 1,
        Night = 1,
    },
}

_G.AutoSell = {
    Enabled = true,
    Delay = 60, -- seconds
    Rarity = {
        Event = true,
        Mythical = true,
        Legendary = true,
        Exotic = true, -- recommended
    }
}

_G.DailyShop = {
    Buy = true,
    Items = {
        "Exalted Relic",
        "Enchant Relic",
        "Aurora Totem",
    }
}

_G.Enchant = {
    Enabled = true,
    Rod = {
        ["Great Rod of Oscar"] = {
            ["Enchant Relic"] = {
                LevelFarm = {"Clever"},
                CashFarm = {"Clever"},
            },
        },
        ["Luminescent Oath"] = {
            ["Enchant Relic"] = {
                LevelFarm = {"Clever", "Insight", "Sea King"},
                CashFarm = {"Sea King"},
            },
        },
		["Tryhard Rod"] = {
			["Enchant Relic"] = {
                LevelFarm = {"Clever", "Insight", "Sea King"},
                CashFarm = {"Sea King"},
            },
		}
    },
}

_G.RAM = {
    Port = 7963,
    Password = "",
    UpdateInterval = 30,
    ReconnectDelay = 1,
    MaxRetries = 15,
}

_G.Aquarium = { Enabled = true }
script_key="JgJCPAqMdlfDJKbqRwjcDvvkWRvyaFXQ";
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/Muhaha/refs/heads/main/Loader.lua"))()