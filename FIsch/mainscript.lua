local Level_Farm = CFrame.new(1374.36963, -602.399231, 2337.11328, 0.836481154, -9.18514473e-08, -0.547995687, 3.76509632e-08, 1, -1.10141599e-07, 0.547995687, 7.14988104e-08, 0.836481154)
_G.Settings = _G.Settings or {
    ["DefaultPosition"] = Level_Farm,
    ["AfkCheckTime"] = 900, -- Seconds
    ["AfkFix"] = "Reset", -- Rejoin, Reset
    ["EquipRod"] = "Auto", -- Trident Rod, Destiny Rod,... Rod
    ["InstantFishing"] = true,
    ["Return to Sea1"] = {
        ["Obtained All Rods"] = true,
    },
    ["SellFish"] = {
        ["SellDelay"] = 120, -- Seconds
        ["Enable"] = true,
        ["Method"] = {
            ["Event"] = true,
            ["Enchant"] = false,
            ["Mythical"] = true,
            ["Legendary"] = true,
            ["Exotic"] = true -- recommend to enable it
        }
    },
    ['Rod'] = {
        -- Necessary Rods: Rods that are required or essential for the gameplay
        Necessary_Rods = {
            "Reinforced Rod",
            "Depthseeker Rod",
            "Carrot Rod",
            -- "Kraken Rod",
            "Zeus Rod",

-- HIGHT PRIORITAY FOR UNPURCHASEABLE RODS

            "No-Life Rod", 
            "Seraphic Rod",

            "Ethereal Prism Rod",
        },
    
        -- Custom Rods: Special rods that can be customized after obtained all necessary rods.
        Custom_Rods = {
            "Aurora Rod",
            "Tempest Rod",
            "Abyssal Specter Rod",
            "Destiny Rod",
            "Challenger's Rod",
            "Rod Of The Zenith",
            "Challenger's Rod",
            "Nocturnal Rod",
            "Kings Rod",
            "Trident Rod",
            "Poseidon Rod",
            "Champions Rod",
            "Volcanic Rod",
            "Summit Rod",
            "Training Rod",
            "Plastic Rod",
            "Carbon Rod",
            "Long Rod",
            "Lucky Rod",
            "Fortune Rod",
            "Rapid Rod",
            "Magnet Rod",
            "Mythical Rod",
            "Midas Rod",
            "Scurvy Rod",
            "Stone Rod",
            "Phoenix Rod",
            "Arctic Rod",
            "Crystalized Rod",
            "Ice Warpers Rod",
            "Avalanche Rod",
            "Stone Rod",

            "Wildflower Rod",
            "Firefly Rod",
            "Frog Rod",
            "Azure Of Lagoon",
            "Free Spirit Rod", -- need bestinary 70%
            "Verdant Shear Rod",
            "Great Dreamer Rod",
        },
    
        -- Puzzle Rods: Rods that will be available in the future (currently unavailable)
        Puzzle_Rods = {
            --["Heaven's Rod"] = 400, -- ( name, required level )
        },
    },	
    ["Enchant"] = {
        ["Enabled"] = true,            -- Enable or disable the enchantment system
        ["Rod"] = {                    -- Specific enchantments for each rod
            ["Depthseeker Rod"] = {
                LevelFarm = {"Clever"}
            },
            ["Zeus Rod"] = {
                LevelFarm = {"Clever"}
            },
            ["Kraken Rod"] = {
                LevelFarm = {"Clever"}
            },
            ["Ethereal Prism Rod"] = {
                LevelFarm = {"Hasty"},
                CashFarm = {"Abyssal"},
            },
            ["Free Spirit Rod"] = {
                LevelFarm = {"Clever"},
            }
        },
    },
    ["Totems"] = {
        ["Enabled"] = true,         -- Enable or disable the totem system
        ["ActivationLevel"] = 300,  -- Level required to activate totems
    
        ["DayTotem"] = "Sundial Totem",    -- Totem used during the day
        ["NightTotem"] = "Aurora Totem",   -- Totem used during the night
    
        ["AutoPurchase"] = true,    -- Enable automatic totem purchasing
        ["PurchaseLimit"] = {       -- Maximum allowed purchases per type
            ["DayTotem"] = 1,
            ["NightTotem"] = 1,
        },
    },	
    ['EnabledFishingZones'] = true,
    ["CastZone"] = {
        ['OnLevel'] = 300,
        ['Ignored_Aurora'] = true, -- skip farming level when aurora is active
        ['Zones'] = {
            "Forsaken Veil - Scylla",
            "Lovestorm Eel",
            "Orcas Pool",
            "The Kraken Pool",
            "Megalodon Default",
            "The Depths - Serpent",
            "Great White Shark",
            "Great Hammerhead Shark",
            "Whale Shark",

            "Animal Pool",
        },
    },
    ["RAM_Config"] = {
        ['Port'] = 7963,
        ['Password'] = "",
        ['Update Interval'] = 5,
        ['Subfix'] = " - ",
        ['Rod Displayed'] = 10,
    },
    ['ShakeMode'] = "Fast", -- Fast, Fix bug
    ["FpsBoost"] = true,
    ["Black_Screen"] = true
}

script_key="RMiLnSJSaWEMvJKVBNAuHXliLYAZiyiD";
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/Muhaha/refs/heads/main/Loader.lua"))()