if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end

wait(5)

script_key = "YQrTRFDloJTXoXpwlzptvfphhEDRFJqj"
getgenv().TLfig = {
    AutoFarm  = true,
    Modefarm  = "",
    FpsLock   = { true, 10},
    Webhook   = {
        Enabled = true,
        URL = "",
        Rarity = { Common = false, Uncommon = false, Rare = true, Legendary = true, Godly = true }
    }
}
repeat
    local success, err = pcall(function() 
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7c742b62fa7b1eafb8b5e8b25a07f0ef.lua"))()
        task.wait(20)
    end)
until success
