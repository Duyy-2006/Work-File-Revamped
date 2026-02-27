script_key="NhGjjhuxJywZMJbrDIEHZqHkkYnGSpUa";
setfpscap(5)
getgenv().gardenHorizonsConfig = {
    -- General
    REDEEM_CODE = { "THANKYOU", "DAWNFRUIT", "RELEASE", "DAWN", "GIFT" },
    MAX_PLANTS = 290,
    DESTROY_UNTIL_MIN_PLANTS = 280,
    HARVEST_RIPENESS_STAGE = { "Ripe", "Lush" },
    LIMIT_PLANT_SEED = {},
    DELETE_PLANT_IF_HAVE_MONEY = { ["Carrot"] = 1000000, ["Corn"] = 2000000, ["Onion"] = 50000000, ["Strawberry"] = 50000000, ["Mushroom"] = 100000000 },
    KEEP_SEED_IF_HAVE_MONEY = { ["Carrot"] = 1000000, ["Corn"] = 2000000, ["Onion"] = 50000000, ["Strawberry"] = 50000000, ["Mushroom"] = 100000000 },
    OPEN_PACK = { "Gardener", "Dawn" },
    USE_SPRINKLER = { "Basic", "Turbo", "Super" },

    -- Shop
    BUY_SEED_SHOP = { ["Carrot"] = 100, ["Corn"] = 100, ["Onion"] = 100, ["Strawberry"] = 100, "Mushroom", "Beetroot", "Tomato", "Apple", "Rose", "Wheat", "Banana", "Plum", "Potato", "Cabbage", "Cherry" },
    BUY_GEAR_SHOP = { "Basic Sprinkler", "Turbo Sprinkler", "Super Sprinkler" },

    -- Keep/Favorite
    KEEP_SEEDS = {},
    FAVOURITE_FRUIT_MUTATIONS = {},
    FAVOURITE_FRUIT_VARIANTS = {},
    SKIP_HARVEST_MUTATIONS = {},
    SKIP_HARVEST_VARIANTS = {},
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/678871917bb145467a528afcae0b36b1.lua"))()