setfpscap(15)
script_key="peomExdejHELkiXOGIEhBvWHKzJUhoNv";
getgenv().CONFIG = getgenv().CONFIG or {}
getgenv().CONFIG.WEBHOOK_URL = "" -- replace with your webhook url
getgenv().CONFIG.TAG_USER_ID = "" -- replace with your Discord ID
getgenv().CONFIG.WEBHOOK_RARITIES = {
    Secret = true,
    ["Brainrot God"] = false,
    Legendary = false,
    Mythic = false,
    Epic = false,
    Rare = false,
    Common = false
} --select rarity to send webhook
getgenv().CONFIG.PROTECTED_RARITIES = getgenv().CONFIG.PROTECTED_RARITIES or {
    Secret = true,
    ["Brainrot God"] = false
}--Select to protect rarity (for example, if you choose secret, it will not delete the pet secret)
getgenv().CONFIG.DEBUG = true  -- print to console what the script is doing
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7c36bcea219a16a41005699607d681d1.lua"))()