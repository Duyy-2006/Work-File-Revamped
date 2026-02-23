getgenv().Config = {
    Dashboard = {
        Enabled = false, -- Giữ dashboard để theo dõi
        GroupName = "vps1",
    },

    BabyFarm = true, -- BẬT farm bucks từ nhiệm vụ baby

    PetFarm = {
        Enabled = true, -- BẬT farm pet needs → bucks & ticket
        FarmEggs = false,
        BuyEggs = false,
        EggTypes = {},
        BuyEggType = "any",
        MaxPets = 1,
        FarmUntilFullGrown = true, -- Ưu tiên pet chưa full grown
        PrioritizeFriendship = false,
        SelectiveFarm = false,
        SelectedPetTypes = {},
    },

    AutoTrade = {
        Enabled = false, -- TẮT - không trade gì
        AutoAcceptTrades = false,
        Usernames = {},
        TradeMode = "all",
        Categories = {},
        Items = {},
        ItemCounts = {},
        PetTypes = {},
        Ages = {},
        AutoLeaveAfterTrades = false,
    },

    AutoNeon = {
        Enabled = false, -- TẮT - không fuse pet
        MakeMega = false,
        NeonAll = false,
        SelectedPets = {},
        MaxPerType = {},
    },

    Settings = {
        AutoShowUI = true, -- TẮT UI để tiết kiệm RAM khi mass farm
        ShowOverlay = true, -- TẮT overlay 
        ReduceGraphics = true, -- BẬT giảm đồ họa tối đa
        FPSCap = 2, -- FPS rất thấp cho mass farm nhiều acc
        LureId = "ice_dimension_2025_ice_soup_bait"
    },

    AutoPotion = {
        Enabled = false, -- TẮT - giữ potion, không dùng
        SelectedPets = {},
    },

    AutoBuy = {
        Enabled = false, -- TẮT - không mua gì
        SelectedItems = {},
        BuyAmounts = {},
    },

    AutoPay = {
        Enabled = false, -- TẮT - không gửi bucks cho ai
        TargetPlayer = "",
    },

    AutoOpen = {
        Enabled = false, -- TẮT - không mở gift/box
        Items = {},
    },

    AutoRecycle = {
        Enabled = false, -- TẮT - không xóa pet
        RarityFilter = {},
        AgeFilter = {},
        ExcludedPets = {},
    },

    IdleProgression = {
        Enabled = true, -- BẬT - pet tự level trong pen
        SelectedPets = {}, -- Để trống = dùng tất cả pet
        ExcludedPets = {},
    },

    Webhook = {
        Enabled = false,
        URL = "https://discord.com/api/",
        PetUnlock = {
            Enabled = false,
            URL = "https://discord.com/api/webhooks/",
            FilterRarities = {"legendary", "ultra_rare"},
        },
    },

    TaskExclusion = {
        Enabled = false, -- Làm tất cả task
        ExcludedTasks = {},
    },
};
getgenv().scriptkey="IqLvuQqjVmdfdazFvMQWLHMzrrJjDnbN"
loadstring(game:HttpGet("https://zekehub.com/scripts/AdoptMe/MassFarm.lua"))()