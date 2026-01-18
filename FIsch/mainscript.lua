_G.config = {
    fishing_position = CFrame.new(3726.26172, -1127.95703, -1070.00867, 0.732412577, 2.20410072e-08, 0.680861115, 8.9077199e-09, 1, -4.19544186e-08, -0.680861115, 3.67928621e-08, 0.732412577),
    rod = {
        free_gift = "Fabulous Rod",
        main = {
            "Original No-Life Rod",
            "Carrot Rod",
            "Luminescent Oath",
            "Great Rod of Oscar",
        },
        second = {
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
            "Heaven's Rod", "Magma Rod", "Firefly Rod", "Frog Rod", "Frostbane Rod", "Tryhard Rod",
            "Azure Of Lagoon", "Free Spirit Rod", "Verdant Shear Rod", "Stone Rod","Wildflower Rod", --"Carrot Rod",
            "Great Dreamer Rod", "Wicked Fang Rod", "Fungal Rod", "Duskwire", "Sanguine Spire", "Boreal Rod",
            "Cryolash"
        },
        quest_rod_start_on = 2000
    },
    totem = {
        enabled = true,
        active_at_level = 100,

        day_totem = "Sundial Totem",
        night_totem = "Aurora Totem",

        auto_purchase = true,
        purchase_limit = {
            day = 1,
            night = 1,
        },
    },
    sell = {
        enabled = true,
        delay = 60, -- seconds
        rarity = {
            event = true,
            mythical = true,
            legendary = true,
            Exotic = true, -- recommended
        }
    },
    daily_shop = {
        buy = true,
        items = {
            "Exalted Relic",
            "Enchant Relic",
            "Aurora Totem",
        }
    },
    enchant = {
        enabled = true,
        rod = {
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
        },
    },
    util = {
        fps = 10,
        white_screen = true,
        reel_speed = 2.8,
    },
    roblox_account_manager = {
        port = 7963,
        password = "",
        update_interval = 30,
        reconnect_delay = 1,
        max_retries = 15,
        display_limit = 5,
        suffix = " • ",
    },
    horst_manager = {
        log_style = "Default", -- Default, Brackets, Horizontal
        auto_change_account = true,
        changed_on = {
            level = {
                enable = true,
                amount = 2000,
            },
            rod = {
                enable = true,
                amount = 50,
            },
            cash = {
                enable = true,
                amount = 10000000,
            },
        },
    }
}
script_key="JgJCPAqMdlfDJKbqRwjcDvvkWRvyaFXQ";
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/Muhaha/refs/heads/main/Loader.lua"))()