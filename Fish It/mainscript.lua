if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
wait(5)
setfpscap(10)
task.spawn(function()
getgenv().ConfigsKaitun = {
    -- [[ setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)) ]] -- For Copy CFrame
    Settings = {
        ["Perfect Catch"] = 100, -- < String > Style Perfect Catch [ Percent ]
        ["Position Farming"] = {
            ["Main Position"] = CFrame.new(-3733.08569, -135.074417, -1011.08331, -0.994064987, 1.32314657e-08, -0.108788066, 1.63132619e-08, 1, -2.7438448e-08, 0.108788066, -2.90502875e-08, -0.994064987), -- < CFrame > Main Position Fishing / Farm Money
        },
        ["Reducing Cpu Usage"] = {
            ["Black Screen"] = true, -- < Boolean > Auto Open / Close Black Screen
            ["FpsCap"] = 9999, -- < Number > Fps Lock
        },
        ["Favorite Setting"] = {
            "Mythic", 
            "SECRET"
        }
    },
    ["Custom Buying"] = {
        ["Buying Rods"] = {
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
        ["Buying Baits"] = {
            "Midnight Bait",
            "Chroma Bait",
            "Corrupt Bait",
            "Dark Matter Bait",
        },
    },
    ["Doing Quest"] = {
        ["Ghostfinn Rod"] = {
            ["Allow Doing"] = true,
            ["Doing After"] = {
                ["Level"] = 100, -- < Number > Level Needed
                ["Rod"] = "Astral Rod" -- < String > Rod Needed
            },
        },
        ["Element Rod"] = {
            ["Allow Doing"] = true,
            ["Doing After"] = {
                ["Level"] = 200, -- < Number > Level Needed
                ["Rod"] = "Ghostfinn Rod" -- < String > Rod Needed
            },
        },
        ["Aura Boat"] = {
            ["Allow Doing"] = true,
            ["Doing After"] = {
                ["Level"] = 300, -- < Number > Level Needed
                ["Rod"] = "Ghostfinn Rod" -- < String > Rod Needed
            },
        }
    }
}
License = "qdnzuDLdqGisOkLZhdML05nvtOAgYrXP"
loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Normal/refs/heads/main/main.luau"))()
wait(5)
end)

