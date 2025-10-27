local Players = game:GetService("Players")
local function fetchFriendsSet()
    local ok, result = pcall(function()
        return Players:GetFriendsAsync(game.Players.LocalPlayer.UserId)
    end)
    local set = {}
    if not ok or not result then
        return set
    end

    for _, entry in pairs(result:GetCurrentPage()) do
        if type(entry) == "table" and entry.Id then
            set[entry.Id] = true
        end
    end

    while result.IsFinished and not result.IsFinished do
        for _, entry in pairs(result:GetCurrentPage()) do
            if type(entry) == "table" and entry.Id then
                set[entry.Id] = true
            end
        end
        result:AdvanceToNextPageAsync()
    end

    return set
end

local function getNonFriendPlayers()
    local friendsSet = fetchFriendsSet()
    local nonFriends = {}

    for _, pl in pairs(Players:GetPlayers()) do
        if pl ~= game.Players.LocalPlayer then
            local id = pl.UserId
            if not friendsSet[id]then
                table.insert(nonFriends, pl)
            end
        end
    end

    return nonFriends
end
task.spawn(function()
while true do
    for i,v in pairs(getNonFriendPlayers()) do
    game.Players.LocalPlayer:RequestFriendship(v)
    end
wait(5)
end
end)
