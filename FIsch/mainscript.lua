_G.config = {
    build = "0.0a",
    fishing_position = CFrame.new(3702.94043, -1102.62109, -1089.09399, 0.0015249321, 0.00411154795, -0.999990404, -0.00142530177, 0.999990523, 0.00410937518, 0.999997795, 0.00141902152, 0.0015307779),
    rod = {
        free_gift = "Fabulous Rod",
        main = {
            "Original No-Life Rod",
            "Carrot Rod",
            -- "Luminescent Oath",
            "Great Rod of Oscar",
        },
        second = {
            "Ethereal Prism Rod", "Cerulean Fang Rod", "Aurora Rod", "Tempest Rod", "Anchor n' Chain",
            "Abyssal Specter Rod", "Destiny Rod", "Challenger's Rod", "Rod Of The Zenith", "Tidemourner",
            "Nocturnal Rod", "Kings Rod", "Trident Rod", "Poseidon Rod", "Champions Rod",
            "Volcanic Rod", "Summit Rod", "Training Rod", "Fast Rod", "Steady Rod", "Thalassar's Ruin",
            "Precision Rod", "Depthseeker Rod", "Vocanic Rod", "Treasure Rod", 'Fallen Rod',
            "Riptide Rod", "Rainbow Cluster Rod", "The Boom Ball", "Scarlet Spincaster Rod",
            "Zeus Rod", "Kraken Rod", "Leviathan's Fang Rod", "Celestial Rod", "Rod Of The Depths",
            "Rod Of The Forgotten Fang", "Plastic Rod", "Carbon Rod", "Long Rod", "Lucky Rod",
            "Fortune Rod", "Rapid Rod", "Magnet Rod", "Mythical Rod", "Midas Rod", "Scurvy Rod",
            "Phoenix Rod", "Arctic Rod", "Crystalized Rod", "Ice Warpers Rod", "Avalanche Rod",
            "Heaven's Rod", "Magma Rod", "Firefly Rod", "Frog Rod", "Frostbane Rod", "Blazebringer Rod",
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
                    levelfarm = {"Clever"},
                    cashfarm = {"Clever"},
                },
            },
            ["Luminescent Oath"] = {
                ["Enchant Relic"] = {
                    levelfarm = {"Clever", "Insight", "Sea King"},
                    cashfarm = {"Sea King"},
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
        auto_send_log = true,
        auto_change_account = true,
        changed_on = {
            level = {
                enable = true,
                amount = 2000,
            },
            rod = {
                enable = false,
                amount = 50,
            },
            cash = {
                enable = false,
                amount = 10000000,
            },
        },
    }
}
script_key="ZhHXPhFcLsWRspVRalhmcSuhqHVsoOOE";
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/Muhaha/refs/heads/main/Loader.lua"))()