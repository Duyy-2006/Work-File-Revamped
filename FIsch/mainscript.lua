if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
wait(10)

_G.RAM = {
	["Roblox Account Manager"] = {
		["Add Task"] = false,
		["Delay Log"] = 5,
	},
} 
_G.Loader = {
	["Last Version"] = "Assetly-17/10/2025-13:04", 
	["Main Manager"] = {
		["Debug Console"] = true, 
		["Sell Data"] = {
			["Type Sell"] = { 
				["Event Fish"] = true, 
				["Exotic Fish"] = true, 
				["Mythical Fish"] = true, 
				["Legendary Fish"] = true, 
				["Secret Fish"] = true,
			}, 
		}, 
	},  
	["Enchant Manager"] = {
		["Add Task"] = true, 
		["Condition"] = { 
			["Money Data"] = 100000, 
		},
		["Data Type Enchant"] = {
			--["Carrot Rod"] = {"Hasty","Clever",},
			--["Luminescent Oath"] = {"Hasty","Clever"},
			["Midas Rod"] = {"Hasty","Clever"},
			["Great Rod of Oscar"] = {"Clever"},
		},
	}, 
	["Aurora Manager"] = {
		["Aurora Party"] = {
			["Allow Doing"] = false,
			["Client"] = { -- // Allow Multi Client
				"",
			},
		},
		["Aurora Totem"] = {
			["Add Task"] = true, 
			["Condition"] = { 
				["Money Data"] = 5555500, 
			},
		},
		["Sundial Totem"] = {
			["Add Task"] = true, 
			["Condition"] = { 
				["Money Data"] = 5555500, 
			},
		},
	},
	["Lucky Manager"] = {
		["Bait Manager"] = {
			["Req Passive"] = {"LureSpeed"}, -- // "Luck"
			["Auto Equip Best"] = true,
		}, 				
		["Luck Effect"] = {
			["Add Task"] = true,
			["Condition"] = { 
				["Level Data"] = nil, 
				["Money Data"] = 50500, 
			},
		}, 
	}, 
	["Quest Manager"] = { 
		["Rod Of The Forgotten Fang"] = { 
			["Add Task"] = true,
			["Condition"] = { 
				["Level Data"] = 1500, 
				["Money Data"] = 5050000, 
			},
		},
		["Rod Of The Zenith"] = {
			["Add Task"] = true,
			["Condition"] = { 
				["Level Data"] = 1500, 
				["Money Data"] = 10000000, 
			},
		}, 
		["Rod Of The Eternal King"] = { -- // ฟามนาน
			["Add Task"] = false,
			["Condition"] = { 
				["Level Data"] = 1500, 
				["Money Data"] = 500000, 
			},
		},
		["Magma Rod"] = { -- // เฉยๆ
			["Add Task"] = false,
			["Condition"] = {
				["Level Data"] = 1500,
				["Money Data"] = 100000,
			},
		}, 
		["Leviathan's Fang Rod"] = {
			["Add Task"] = true,
			["Condition"] = {
				["Level Data"] = 500,
				["Money Data"] = 1200000,
			},
		},
		["Ruinous Oath"] = { -- // อย่าหาใช้นานชิปหาย
			["Add Task"] = false,
			["Condition"] = {
				["Level Data"] = 1500,
				["Money Data"] = nil,
			},
		},
		["Wicked Fang Rod"] = { 
			["Add Task"] = false,
			["Condition"] = {
				["Level Data"] = 1500,
				["Money Data"] = 3900000,
			},
		},
	}, 
	["Default Manager"] = {
		["Default Buying"] = {
			["Carbon Rod"] = true,
			["Rapid Rod"] = true,
			["Midas Rod"] = true,
			["Carrot Rod"] = false,
			["Kraken Rod"] = false,
			["Luminescent Oath"] = false,
			["Ethereal Prism Rod"] = false,
			["Great Rod of Oscar"] = true,
		}, 
		["Default Equip"] = { 
			"Carbon Rod",
			"Rapid Rod",
			"Midas Rod",
			"Luminescent Oath",
			"Great Rod of Oscar",
		},
	}, 
	["Custom Manager"] = { 
		["Purchase Data"] = { 
			["Rod Data"] = {
				"Poseidon Rod",
				"Firework Rod",
				"Ethereal Prism Rod",
				"Zeus Rod",
				"Treasure Rod",
				"Frog Rod",
				"The Boom Ball",
				"Avalanche Rod",
				"Summit Rod",
				"Lucky Rod",
				"Destiny Rod",
				"Cerulean Fang Rod",
				"Azure Of Lagoon",
				"Arctic Rod",
				"Tempest Rod",
				"Leviathan's Fang Rod",
				"Paper Fan Rod",
				"Abyssal Specter Rod",
				"Aurora Rod",
				"Verdant Shear Rod",
				"Rapid Rod",
				"Fungal Rod",
				"Fortune Rod",
				"Mythical Rod",
				"Magnet Rod",
				"Rainbow Cluster Rod",
				"Scurvy Rod",
				"Nocturnal Rod",
				"Blazebringer Rod",
				"Free Spirit Rod",
				"Plastic Rod",
				"Midas Rod",
				"Reinforced Rod",
				"Depthseeker Rod",
				"Sunken Rod",
				"Great Dreamer Rod",
				"Seraphic Rod",
				"Kings Rod",
				"Crystallized Rod",
				"Great Rod of Oscar",
				"Champions Rod",
				"Challenger's Rod",
				"Carbon Rod",
				"Kraken Rod",
				"Training Rod",
				"Volcanic Rod",
				"Fast Rod",
				"No-Life Rod",
				"Scarlet Spincaster Rod",
				"Trident Rod",
				"Magma Rod",
				"Frostbane Rod",
				"Merchant Rod",
				"Wildflower Rod",
				"Luminescent Oath",
				"Carrot Rod",
				"Phoenix Rod",
				"Steady Rod",
				"Stone Rod",
				"Firefly Rod",
				"Long Rod",
				"Luminescent Oath"
			},
			["Condition"] = { 
				["Level Data"] = 1000,
			},
		}, 
	},
} 
script_key="iITAcWAZWwavNyBVbJcrtmwfgMkHFjOX";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0d072f16b1261c8a4030d22e5265c1f7.lua"))()
