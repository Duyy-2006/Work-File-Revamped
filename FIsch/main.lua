if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
local Second_Sea = game.PlaceId == 72907489978215
local Second_Sea_Loc = CFrame.new(1532.36096, 83.9225464, 2335.48999, -0.407974303, 3.71246642e-08, 0.912993431, 5.38818279e-09, 1, -3.825485e-08, -0.912993431, -1.06876197e-08, -0.407974303)
local First_Sea_Loc = CFrame.new(-13887.3965, -11048.6885, 350.285706, 0.948456287, 1.08180259e-07, 0.316907942, -1.06977055e-07, 1, -2.11960565e-08, -0.316907942, -1.37983438e-08, 0.948456287)

_G.Settings = _G.Settings or {
	["DefaultPosition"] = (Second_Sea and Second_Sea_Loc) or First_Sea_Loc,
	["AfkCheckTime"] = 30, -- Seconds
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
			"Steady Rod", -- First Sea Rod
			"Reinforced Rod",
			"Depthseeker Rod",
			"Kraken Rod",
			"Zeus Rod",
			"Ethereal Prism Rod",

			"Free Spirit Rod",
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
getgenv().Key = "MARU-9HFI-XPU4S-T0E3-TSKJZ-AQ10"
getgenv().id = "935143471243726858"
getgenv().Script_Mode = "Kaitun_Script"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
