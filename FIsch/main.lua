
-- // อ่านหน่อย ถามว่าโดนแบนไหม โดนครับ แต่มีสูตรมาบอก เอาง่าย ๆ ฟามยังไงก้ได้ ให้ไม่รีเกมเกิน สองรอบ คือแบบ ฟามยาวๆแบบรอบเดียวจบแค่นั้น แต่นี้ก็ไม่โดนเตือนแล้ว หากจะนำไอดีไปขายให้ แจ้งด้วยว่าห้ามนำรหัสไปรันสคริปต์ต่อไม่งั้นจะโดนแบน
-- // แค่ตัวใหม่ มันมีระบบที่ให้เราฟามได้เร็วขึ้นมากๆ ประหยัดเวลาไปได้เยอะ

_G.RAM = {
	["Roblox Account Manager"] = {
		["Auto Sending"] = false,
		["Delay Log"] = 5,
	},
}

_G.Loader = {
	["Check Version"] = "Assetlty 3.0",
	["Main Manager"] = {
		["Fishing Location"] = {
			["Main Position"] = CFrame.new(-13627.251, -11039.2109, 327.531891, 0.626239002, -5.55564093e-08, 0.779631138, 2.05973834e-08, 1, 5.47150094e-08, -0.779631138, -1.82063111e-08, 0.626239002), 
			["Second Location"] = { 
				["Condition"] = { 
					["Rod Data"] = "Rapid Rod", 
					["Level Data"] = nil, 
				}, 
				["Second Position"] = CFrame.new(1390.84265, -600.593933, 2328.21313, 0.350875288, 1.68661202e-07, 0.936422169, -9.42693212e-09, 1, -1.76580102e-07, -0.936422169, 5.31300053e-08, 0.350875288), 
			},
		}, 
		["Sell Data"] = {
			["Type Sell"] = { 
				["Event Fish"] = true, 
				["Exotic Fish"] = true, 
				["Mythical Fish"] = true, 
				["Legendary Fish"] = true, 
				["Secret Fish"] = false,
			}, 
		}, 
	},  
	["Enchant Manager"] = {
		["Add Task"] = true, 
		["Condition"] = { 
			["Money Data"] = 100000, 
		},
		["Data Type Enchant"] = {
			["Carrot Rod"] = {"Hasty","Clever",},
			["Luminescent Oath"] = {"Hasty","Clever"},
			["Ethereal Prism Rod"] = {"Clever"},
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
				["Money Data"] = 2555500, 
			},
		},
		["Sundial Totem"] = {
			["Add Task"] = true, 
			["Condition"] = { 
				["Money Data"] = 2555500, 
			},
		},
	},
	["Lucky Manager"] = {
		["Bait Manager"] = {
			["Req Passive"] = {"Luck"}, -- // "LureSpeed"
			["Auto Equip Best"] = true,
			["Crate Manager"] = {
				["Buying Bait Crate"] = true,
				["Condition"] = { 
					["Delay Buying"] = 30, -- // Second
					["Money Data"] = 50000, 
				},
			},
		}, 				
		["Luck Effect"] = {
			["Allow Buying"] = true,
			["Condition"] = { 
				["Money Data"] = 50500, 
			},
		}, 
	}, 
	["Quest Manager"] = { 
		["Rod Of The Forgotten Fang"] = {
			["Add Task"] = true,
			["Condition"] = { 
				["Level Data"] = 1000, 
				["Money Data"] = 5050000, 
			},
		},
		["Rod Of The Zenith"] = {
			["Add Task"] = true,
			["Condition"] = { 
				["Level Data"] = 1000, 
				["Money Data"] = 10000000, 
			},
		}, 
		["Rod Of The Eternal King"] = {
			["Add Task"] = true,
			["Condition"] = { 
				["Level Data"] = 1000, 
				["Money Data"] = 500000, 
			},
		},
		["Magma Rod"] = {
			["Add Task"] = true,
			["Condition"] = {
				["Level Data"] = 1000,
				["Money Data"] = 100000,
			},
		}, 
		["Duskwire"] = {  -- // Added Soon
			["Add Task"] = false,
			["Condition"] = {
				["Level Data"] = 1000,
				["Money Data"] = 7900000,
			},
		}, 
		["Leviathan's Fang Rod"] = {
			["Add Task"] = true,
			["Condition"] = {
				["Level Data"] = 500,
				["Money Data"] = 1200000,
			},
		},
		["Ruinous Oath"] = {  -- // Added Soon
			["Add Task"] = false,
			["Condition"] = {
				["Level Data"] = 1000,
				["Money Data"] = 50000000,
			},
		},
		["Wicked Fang Rod"] = { 
			["Add Task"] = true,
			["Condition"] = {
				["Level Data"] = 1000,
				["Money Data"] = 3900000,
			},
		},
	}, 
	["Default Manager"] = {
		["Default Buying"] = {
			["Carbon Rod"] = false,
			["Rapid Rod"] = true,
			["Carrot Rod"] = true,
			["Kraken Rod"] = false,
			["Luminescent Oath"] = true,
			["Ethereal Prism Rod"] = true,
			["Great Rod of Oscar"] = true,
		}, 
		["Default Equip"] = { 
			"Adventurer's Rod",
			"Rapid Rod",
			"Carrot Rod",
			"Luminescent Oath",
			"Ethereal Prism Rod",
			"Great Rod of Oscar",
		},
	}, 
	["Custom Manager"] = { 
		["Purchase Data"] = { 
			["Rod Data"] = {
				"Firework Rod", "Rod Of The Zenith", "Wicked Fang Rod",
				"Ethereal Prism Rod", "Zeus Rod", "Treasure Rod",
				"Frog Rod", "The Boom Ball", "Avalanche Rod",
				"Summit Rod", "Lucky Rod", 
				"Destiny Rod", "Cerulean Fang Rod", "Azure Of Lagoon",
				"Arctic Rod", "Tempest Rod", "Leviathan's Fang Rod",
				"Heaven's Rod", "Paper Fan Rod", "Abyssal Specter Rod",
				"Aurora Rod", "Verdant Shear Rod",
				"Rapid Rod", "Fungal Rod", "Fortune Rod",
				"Mythical Rod", "Magnet Rod", "Rainbow Cluster Rod",
				"Scurvy Rod", "Nocturnal Rod",
				"Blazebringer Rod", "Free Spirit Rod", "Plastic Rod",
				"Midas Rod", "Reinforced Rod", "Depthseeker Rod",
				"Sunken Rod", "Great Dreamer Rod", "Seraphic Rod",
				"Kings Rod", "Crystallized Rod", "Great Rod of Oscar",
				"Champions Rod", "Challenger's Rod", "Carbon Rod",
				"Kraken Rod", "Training Rod", "Volcanic Rod",
				"Fast Rod", "No-Life Rod", "Scarlet Spincaster Rod",
				"Trident Rod", "Magma Rod", "Frostbane Rod",
				"Merchant Rod", "Wildflower Rod", "Luminescent Oath",
				"Carrot Rod", "Phoenix Rod", "Steady Rod",
				"Stone Rod", "Firefly Rod", "Long Rod",
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