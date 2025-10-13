if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

local money_zone = CFrame.new(-13887.3965, -11048.6885, 350.285706, 0.948456287, 1.08180259e-07, 0.316907942, -1.06977055e-07, 1, -2.11960565e-08, -0.316907942, -1.37983438e-08, 0.948456287)
local Level_Farm = CFrame.new(1374.36963, -602.399231, 2337.11328, 0.836481154, -9.18514473e-08, -0.547995687, 3.76509632e-08, 1, -1.10141599e-07, 0.547995687, 7.14988104e-08, 0.836481154)
_G.Settings = {
	["DefaultPosition"] = Level_Farm,
	["Speed"] = 1.5,
	["FarmMode"] = "Money", -- Money
	["MinFishingTime"] = 1, -- this will make you fishing faster in ... second (min is 1 fish 1.8 sec because game limited)
	["SellFish"] = {
		["SellDelay"] = 10, -- Seconds
		["Enable"] = true,
		["Method"] = {
			["Event"] = true,
			["Enchant"] = false,
			["Mythical"] = true,
			["Legendary"] = true,
			["Exotic"] = true -- recommend to enable it
		}
	},
	["DailyShop"] = {
        Buy = true,
        Items = {
            "Exalted Relic",
            "Enchant Relic",
            "Aurora Totem"
        }
    },
	['Rod'] = {
		-- Necessary Rods: Rods that are required or essential for the gameplay
		Necessary_Rods = {
			"Reinforced Rod",
			"Midas Rod",
			"Luminescent Oath",

-- HIGHT PRIORITAY FOR UNPURCHASEABLE RODS
		},
	
		-- Custom Rods: Special rods that can be customized after obtained all necessary rods.
		Custom_Rods = {
			"Cerulean Fang Rod",
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
			-- ["Luminescent Oath"] = {
			-- 	LevelFarm = {"Clever"},
			-- 	CashFarm = {"Quantum", "Anomalous", "Chaotic", "Abyssal"},
			-- },
			["Luminescent Oath"] = {
				["Enchant Relic"] = {
					LevelFarm = {"Clever"},
					CashFarm = {"Sea King"},
				},
				["Exalted Relic"] = {
					LevelFarm = {"Sea Overlord"},
					CashFarm = {"Sea Overlord"},
				},
				["Cosmic Relic"] = {
					LevelFarm = {"Wise"},
					CashFarm = {"Sea Prince"},
				},
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
			["Day"] = 1,
			["Night"] = 1,
		},
	},	
	["RAM_Config"] = {
		['Port'] = 7963,
		['Password'] = "",
		['Update Interval'] = 5,
		['Subfix'] = " - ",
		['Rod Displayed'] = 10,
	},
	["FpsBoost"] = true,
	["Black_Screen"] = true
}
