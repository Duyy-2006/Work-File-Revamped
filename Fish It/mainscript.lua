if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
wait(5)
setfpscap(10)
_G.RAM =  {
    ["Roblox Account Manager"] = {
        ["Auto Sending"] = false,
        ["Blacklist Rod"] = {"Starter Rod","Luck Rod","Ice Rod","Lucky Rod","Midnight Rod"},
        ["Delay Log"] = 5,
    },
}

_G.Logic =  {
    ["Data"] = {
        ["Ghostfinn Rod"] = {
            ["Allow Doing"] = true,
            ["Doing After"] = {
                ["Level"] = 25, -- // Type ~ [ Requirement Level ]
                ["Rod"] = "Chrome Rod" -- // Type ~ [ Requirement Rod ]
            },
        }, 
        ["Element Rod"] = { 
            ["Allow Doing"] = true,
            ["Doing After"] = {
                ["Level"] = 50, -- // Type ~ [ Requirement Level ]
                ["Rod"] = "Ghostfinn Rod" -- // Type ~ [ Requirement Rod ]
            },
        }, 
        ["Main Location"] = { -- // Type ~ [ CFrame ] Kohana Volcano
           ["Data CFrame"] = CFrame.new(3188.24805, -1302.85486, 1401.64124, 0.776080966, -3.61365338e-08, -0.630633295, -1.63238152e-08, 1, -7.73906734e-08, 0.630633295, 7.03557674e-08, 0.776080966),

        },
    },
}

_G.Config =  {
    ["Version"] = "Rewrite Version | 22/10/2025", 
    ["Fishing"] = {
        ["Selling"] = {
            ["Loop Delay"] = 10,
            ["Auto Sell"] = true,
        },
        ["Favorite"] = {
            ["Allow Doing"] = true,
            ["Favorite Type"] = {"Mythic", "SECRET"},
        },
        ["Disable 3d Render"] = false,
        ["Anti Stuck"] = true,
        ["Perfect Cast"] = true,
    },
    ["Web Hook"] = {
        ["Link Webhook"] = "",
        ["Auto Sending"] = false,
        ["Loop Delay"] = 30,
    },
    ["Bobber"] = { 
        ["Allow Purchase"] = true, 
        ["Allow Equip"] = true,
        ["Bobber List"] = {
            "Midnight Bait",
            "Chroma Bait",
            "Corrupt Bait",
            "Dark Matter Bait",
        },
    },
    ["Fishing Rod"] = { 
        ["Allow Purchase"] = true, 
        ["Allow Equip"] = true,
        ["Rod List"] = {
            "Luck Rod",
            "Ice Rod",
            "Lucky Rod",
            "Ice Rod",
            "Midnight Rod",
            "Steampunk Rod",
            "Chrome Rod",
            "Astral Rod",
            "Ares Rod",
            "Angler Rod",
        },
    },
}
script_key="YvYILBVUliSkoaFSDBbUwpmKnbiTIXUW";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/1c0bde26fd6784a7ad9eae18839833d8.lua"))()
