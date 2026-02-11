if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
wait(3)
_G.VanguardSettings = {
    ['ClaimDaily'] = true,
    ['ClaimQuests'] = true,
    ['ClaimAchievement'] = true,
    ['ClaimBattlepass'] = true,
    ['ClaimMileStones'] = false,
    ['RedeemCodes'] = false,
    ['JoinGames'] = true,
    ['Summon'] = {
        ['LockUnits'] = false,
        ['Name'] = {''}
    },
    ['Webhooks'] = {
        ['Enabled'] = true,
        ['Url'] = ''
    }
}
-- Script Here
script_key="fzBRbUpSYXumdyRUZBxmXyiUOcpTUPqR";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6756a57cd51293c409a1f7627cba5572.lua"))()