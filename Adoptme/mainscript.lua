getgenv().Config = {
    BabyFarm = true, -- Farm bucks từ nhiệm vụ chăm baby

    PetFarm = {
        Enabled = true, -- Bật farm pet để hoàn thành pet needs → nhận bucks/ticket
        FarmEggs = false,
        BuyEggs = false,
        EggTypes = {},
        BuyEggType = "any",
        MaxPets = 1,
        FarmUntilFullGrown = true, -- Ưu tiên pet chưa full grown để farm XP liên tục
        PrioritizeFriendship = false,
        SelectiveFarm = false,
        SelectedPetTypes = {},
    },

    AutoNeon = {
        Enabled = false, -- TẮT - không tiêu pet vào neon
        MakeMega = false,
        NeonAll = false,
        SelectedPets = {},
        MaxPerType = {},
    },

    Settings = {
        ShowOverlay = true, -- Theo dõi tiến trình farm
        ReduceGraphics = true, -- Giảm đồ họa để farm AFK mượt
        FPSCap = 2, -- Tiết kiệm tài nguyên máy
        LureId = "ice_dimension_2025_ice_soup_bait"
    },

    AutoBuy = {
        Enabled = false, -- TẮT HOÀN TOÀN - không mua gì hết
        SelectedItems = {},
        BuyAmounts = {},
    },

    AutoOpen = {
        Enabled = false, -- TẮT - không mở gift/box
        Items = {},
    },

    AutoPotion = {
        Enabled = false, -- TẮT - không dùng potion, giữ lại hết
        SelectedPets = {},
    },

    AutoRecycle = {
        Enabled = false, -- TẮT - không xóa pet nào
        RarityFilter = {},
        AgeFilter = {},
        ExcludedPets = {},
    },

    IdleProgression = {
        Enabled = true, -- BẬT - pet tự level trong pen khi idle
        SelectedPets = {},
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
        Enabled = false, -- KHÔNG skip task nào → farm tối đa bucks & ticket
        ExcludedTasks = {},
    },
};
getgenv().scriptkey="IqLvuQqjVmdfdazFvMQWLHMzrrJjDnbN"
loadstring(game:HttpGet("https://zekehub.com/scripts/AdoptMe/Lite.lua"))()