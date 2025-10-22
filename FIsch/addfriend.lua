print("[LZ Client]:IsRun")

local Players = game:GetService("Players")
local client = Players.LocalPlayer

while true do
    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= client and not client:IsFriendsWith(v.UserId) then
            pcall(function()
                client:RequestFriendship(v)
            end)
        end
    end
    task.wait(5) -- repeat every 5 seconds
end
