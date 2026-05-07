getgenv().Config = {
    Dashboard = {
        Enabled = false,
        SyncConfig = false,
        GroupName = "vps1",
    },
    BabyFarm = true, -- baby need stream song song, ăn cap bucks + giảm idle
    AutoCertificate = true, -- auto dùng Pet Handler Pro Cert nếu drop được
    PetFarm = {
        Enabled = true,
        FarmEggs = true, -- KHÔNG equip egg → bảo toàn slot cho Full Grown pet ở Phase 4
        BuyEggs = false, -- không dùng cơ chế này, đã có AutoBuy bên dưới
        EggTypes = {},
        BuyEggType = "any",
        MaxPets = 1, -- F2P
        FarmUntilFullGrown = true, -- ⚠️ FALSE để Phase 4 farm được Full Grown pet
        PrioritizeFriendship = true, -- ưu tiên pet gần lên level (active ở Phase 4)
        SelectiveFarm = false,
        SelectedPetTypes = {},
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
    AutoPotion = {
        Enabled = false, -- ⚠️ BẮT BUỘC FALSE: không consume potion vừa farm
        SelectedPets = {},
        PotionVersionFilter = {},
    },
    AutoBuy = {
        Enabled = true, -- BẬT: bootstrap stockpile tự động
        SelectedItems = {"cracked_egg","royal_egg","pet_egg"},
        BuyAmounts = {15}, -- mua tổng 6 Cracked Egg → đủ build stockpile, sau đó dừng
    },
    AutoPay = {
        Enabled = false,
        TargetPlayer = {},
        Methods = {},
    },
    AutoOpen = {
        Enabled = true, -- mở box/bait reward để lấy potion bên trong
        Items = {},
    },
    AutoRecycle = {
        Enabled = false, -- BẬT: tránh inventory đầy
        RarityFilter = {
            common = {"regular"}, -- CHỈ recycle Common regular, giữ Neon/Mega
        },
        AgeFilter = {1, 2, 3}, -- CHỈ recycle pet stage thấp, giữ Full Grown để farm
        ExcludedPets = {},
    },
    IdleProgression = {
        Enabled = true, -- pet pen passive: tự hatch egg + grow pet không equip
        SelectedPets = {},
        ExcludedPets = {},
        PriorityOrder = {"regular", "neon", "mega"},
        PenVersionFilter = {},
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
        FPSCap = 10,
        LureId = "ice_dimension_2025_ice_soup_bait", -- Ice Soup Bait free, 12.5%
        TradeInvites = "Friends",
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