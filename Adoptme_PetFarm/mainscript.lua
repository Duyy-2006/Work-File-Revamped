getgenv().Config = {
        BabyFarm = true, -- Does baby farm
            PetFarm = {
            Enabled = true, -- Enables the Pet Farm
            FarmEggs = true, -- If true, equips eggs to hatch them. If false, equips regular pets
            BuyEggs = true, -- If FarmEggs is true and no eggs in inventory, buy eggs automatically
            EggTypes = {"cracked_egg"}, -- Which eggs to equip ({} = any egg, or {"cracked_egg", "royal_egg"} for specific)
            BuyEggType = "cracked_egg", -- Which egg to buy when BuyEggs is true ("any" or specific egg ID)
            MaxPets = 1, -- How many pets to equip at once (1 = free, 2 = requires Robux gamepass)
            FarmUntilFullGrown = true, -- If true, selects pets that aren't full grown first
            PrioritizeFriendship = false, -- If true, selects pets with higher friendship level first
            SelectiveFarm = true, -- If true, only farm pets in SelectedPetTypes list
            SelectedPetTypes = {"ancient_dragon","alicorn","dragonfly","corgi","robot","swordfish"}, -- Pet IDs to farm when SelectiveFarm is true (e.g., {"dog", "cat"})
        },
        AutoNeon = {
            Enabled = true, -- Enable auto neon/mega fusion
            MakeMega = true, -- Fuse neons into mega neons
            NeonAll = true, -- Neon everything possible
            SelectedPets = {}, -- {} when NeonAll = true, otherwise {"dog", "cat"} etc
            MaxPerType = {}, -- {} = unlimited, {dog = 2, cat = 1} = limits per pet type
        },
        Settings = {
            ShowOverlay = true, -- Show stats overlay (disables 3D rendering)
            ReduceGraphics = true, -- Reduce graphics quality to minimum
            FPSCap = 3, -- FPS cap option (0 = uncapped)
            LureId = "ice_dimension_2025_ice_soup_bait" -- what lure to use for example: "ice_dimension_2025_ice_soup_bait"
        },
        AutoBuy = {
            Enabled = true, -- Automatically buy items from shops
            SelectedItems = {"gifts|winter_2025_angus_box"}, -- Item IDs to buy
            BuyAmounts = {}, -- How many of each item to buy. Example: {5, 10} buys 5 cracked_eggs and 10 sandwiches. Empty {} buys infinite of each item. If there are more items than amounts, remaining items default to infinite.
        },
        AutoOpen = {
            Enabled = false, -- Open gift boxes automatically
            Items = {}, -- Item IDs to auto open (e.g., {"winter_2025_angus_box"})
        },
        AutoPotion = {
            Enabled = true, -- Use age potions on pets to level them up
            SelectedPets = {"ancient_dragon","alicorn","dragonfly","corgi","robot","swordfish"}, -- Pet IDs to use potions on (empty = does nothing)
        },
        AutoRecycle = {
            Enabled = true, -- Toggle auto recycling on/off
            RarityFilter = {
                -- Each rarity maps to a list of versions to recycle
                -- Versions: "regular", "neon", "mega"
                -- If a rarity is not listed or empty, pets of that rarity will NOT be recycled
                -- If a rarity has versions listed, ONLY those versions will be recycled

                common = {"regular","neon","mega"},  -- Recycle all common versions
                uncommon = {"regular","neon","mega"},                    -- Only recycle neon uncommons
                rare = {"regular","neon","mega"},     -- Recycle all rare versions
                ultra_rare = {"mega"}, -- Recycle all ultra rare versions
                legendary = {"neon","mega"},                   -- Only recycle mega legendaries
            },
            AgeFilter = {}, -- Empty = all ages, or specific ages e.g. {1, 2, 3, 4, 5, 6} (1=Newborn, 6=Full Grown)
            ExcludedPets = {}, -- Pet IDs to never recycle e.g. {"dog", "cat", "shadow_dragon"}
        },
        IdleProgression = {
            Enabled = false, -- Put pets in pet pen for idle leveling
            SelectedPets = {"cracked_egg"}, -- Pet IDs to put in pet pen (empty = use all)
            ExcludedPets = {}, -- Pet IDs to never put in pet pen
        },
        Webhook = {
            Enabled = false, -- Send webhook notifications to Discord
            URL = "https://discord.com/api/", -- Discord webhook URL for notifications
            PetUnlock = {
                Enabled = false, -- Send webhook when hatching/unlocking a pet
                URL = "https://discord.com/api/webhooks/", -- Webhook URL for pet unlocks
                FilterRarities = {"legendary", "ultra_rare"}, -- Only send for these rarities
            },
        },
        TaskExclusion = {
            Enabled = false, -- Skip certain farming tasks
            ExcludedTasks = {}, -- Task IDs to skip (e.g., {"buccaneer_band", "summerfest_bonfire"})
        },
    };
getgenv().scriptkey="IqLvuQqjVmdfdazFvMQWLHMzrrJjDnbN"
loadstring(game:HttpGet("https://zekehub.com/scripts/AdoptMe/MassFarm.lua"))()
