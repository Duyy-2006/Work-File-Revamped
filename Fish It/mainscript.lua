script_key="EXEikEPXJKNBRMldzWtzaJIxJmwIjbcY";
setfpscap(5)
getgenv().fishItConfig = {
    ADD_FRIEND = true,
    AUTO_UPDATE_RESTART = true,
    PERFECT_CASTING = true,
    FISHING_LOCATION = { 
        ["Fisherman Island"] = { "Starter Rod", "Luck Rod" },
        ["Tropical Grove"] = { "Lava Rod", "Lucky Rod", "Steampunk Rod", "Astral Rod", "Hazmat Rod", "Ghostfinn Rod", "Element Rod", "Diamond Rod" },
    },

    AUTO_QUEST = {
        -- Coin Quest
        ["Lost Treasure"] = true,
        ["Steve's Lost Coins"] = true,

        -- Rod Quest
        ["Deep Sea Quest"] = true,  -- Start when have Astral or Better Rod
        ["Element Quest"] = true,  -- Start when have Ghostfinn Rod
        ["Diamond Researcher"] = true,  -- Start when have Element Rod

        -- Potion Quest
        ["Steve's Lost Keys"] = true,
    },

    KEEP_FISH_ODDS = 250000,
    KEEP_FISH_NAME = { "Ruby" },
    BUY_FISHING_ROD = { "Lucky Rod", "Steampunk Rod", "Astral Rod" },
    BUY_BAIT = { "Midnight Bait", "Chroma Bait", "Corrupt Bait", "Aether Bait" },
    BUY_TRAVELING_MERCHANT = { "Singularity Bait", "Hazmat Rod" },
    CONSUME_POTION = { "Luck I Potion", "Luck II Potion", "Mutation I Potion" },
    ENCHANT_ROD = { 
        ["Steampunk Rod"] = { "Mutation Hunter I", "Mutation Hunter II", "Gold Digger I", "Glistening I", "Leprechaun I", "Leprechaun II", "Stormhunter I", "Stargazer I", "Empowered I", "XPerienced I", "Prismatic I", "Reeler I", "Big Hunter I" },
        ["Astral Rod"] = { "Leprechaun II" },
        ["Ghostfinn Rod"] = { "Leprechaun II" },
        ["Element Rod"] = { "Leprechaun II" },
    },

    -- Auto Gift
    AUTO_GIFT_USER = {},  -- Username to gift
    GIFT_FISH_ODDS = 250000,
    GIFT_ITEMS = { "Transcended Stone" },  -- Item Names

    -- Webhook
    WEBHOOK_FISH_ODDS = 250000,
    WEBHOOK_URL = "",
    DISCORD_ID = "",
    WEBHOOK_NOTE = "",
    SHOW_PUBLIC_DISCORD_ID = true,
    SHOW_WEBHOOK_USERNAME = true,
    SHOW_WEBHOOK_JOBID = false,
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/db8c893d7f0773653a850f508218b539.lua"))()