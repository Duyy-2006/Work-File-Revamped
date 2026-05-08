getgenv().Config = {

    BabyFarm = true, -- Max bucks bằng baby need stream
    AutoCertificate = true, -- Auto dùng Cert nếu drop (tăng cap lên 500)

    PetFarm = {
        Enabled = true, -- Equip pet duy nhất để farm bucks
        FarmEggs = false, -- ⚠️ KHÔNG hatch egg → giữ làm output
        BuyEggs = true, -- Dùng AutoBuy thay
        EggTypes = {},
        BuyEggType = "any",
        MaxPets = 1, -- F2P
        FarmUntilFullGrown = false,
        PrioritizeFriendship = false, -- Không cần ưu tiên friendship (không farm potion)
        SelectiveFarm = false,
        SelectedPetTypes = {},
    },

    AutoBuy = {
        Enabled = true,
        SelectedItems = {
            "royal_egg",        -- Legendary, 1450 bucks
            "endangered_egg",
            "endangered_2026_egg",
            "endangered_egg_2026",   -- Legendary limited, 750 bucks
        },
        BuyAmounts = {300,100,100,100},
    },
    AutoRecycle = {
        Enabled = false, -- BẬT: tránh inventory đầy block AutoBuy
        RarityFilter = {
            common = {"regular"}, -- Xả Common regular (Starter pet sau Full Grown, pet event Common)
            uncommon = {"regular"}, -- Xả Uncommon regular nếu có
            -- KHÔNG recycle rare/ultra_rare/legendary → giữ pet quý nếu có
            -- KHÔNG recycle neon/mega → giữ pet đặc biệt
        },
        AgeFilter = {}, -- Tất cả age (Newborn → Full Grown)
        ExcludedPets = {
            -- Safety net: liệt kê tất cả egg ID để không bao giờ recycle
            "cracked_egg", "pet_egg", "royal_egg", "retired_egg",
            "endangered_egg", "endangered_2026_egg", "endangered_egg_2026",
            "starter_egg", "golden_egg", "diamond_egg", "admin_abuse_egg",
            "aztec_egg", "garden_egg", "moon_egg", "desert_egg", "urban_egg",
            "danger_egg", "japan_egg", "southeast_asia_egg", "woodland_egg",
            "mythic_egg", "ocean_egg", "fossil_egg", "aussie_egg", "farm_egg",
            "jungle_egg", "safari_egg",
            -- Thêm các loại egg event tương lai vào đây nếu Adopt Me update
        },
    },

    AutoOpen = {
        Enabled = false, -- ⚠️ TẮT: tránh mở nhầm box chứa egg
        Items = {},
    },

    IdleProgression = {
        Enabled = false, -- ⚠️ BẮT BUỘC TẮT
        SelectedPets = {},
        ExcludedPets = {},
        PriorityOrder = {},
        PenVersionFilter = {},
    },

    AutoPotion = {
        Enabled = false,
        SelectedPets = {},
        PotionVersionFilter = {},
    },

    AutoTrade = {
        Enabled = false,
        AutoAcceptTrades = false,
        AutoLeaveAfterTrades = false,
        Usernames = {},
        TradeMode = "all",
        Categories = {},
        Items = {},
        ItemCounts = {},
        GlobalPetFilter = { Versions = {}, Ages = {} },
        PetFilters = {},
    },

    AutoNeon = {
        Enabled = false,
        MakeMega = false,
        NeonAll = false,
        SelectedPets = {},
        MaxPerType = {},
    },

    AutoPay = {
        Enabled = false, -- KHÔNG gửi bucks đi (cần bucks để mua egg)
        TargetPlayer = {},
        Methods = {},
    },

    AccountManager = {
        Enabled = false,
        Tool = "",
        Yummy = { Action = "completed", Reason = "Done" },
        FarmSync = {
            Action = "completed",
            FromFolderId = "",
            ToFolderId = "",
            ChangeWithoutReplacement = false,
            ConfigId = nil,
            ApiKey = "",
        },
        Triggers = {
            AfterTradeComplete = false,
            MinBucks = 0,
            MinPotions = 0,
        },
    },

    Settings = {
        AutoShowUI = true,
        ShowOverlay = true,
        ReduceGraphics = true,
        FPSCap = 10, -- Tiết kiệm CPU cho multi-instance
        LureId = "ice_dimension_2025_ice_soup_bait", -- Giữ nguyên (không quan trọng vì không farm potion)
        TradeInvites = "Friends", -- Tránh spam trade
    },

    Webhook = {
        Enabled = false,
        URL = "",
        PetUnlock = {
            Enabled = false,
            URL = "",
            FilterRarities = {"legendary"},
        },
    },

    TaskExclusion = {
        Enabled = false,
        ExcludedTasks = {},
    },
};
getgenv().scriptkey="jAsmhFJspvBgREPTRCHOPMWaKyAULvAE"
loadstring(game:HttpGet("https://zekehub.com/scripts/AdoptMe/MassFarm.lua"))()
