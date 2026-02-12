if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
wait(30)
while(true)
do
    if game.PlaceId ~= 18219125606 then
        game:GetService('TeleportService'):Teleport(18219125606)
    end
    if game.PlaceId == 18219125606 then
        setfpscap(2)
    end
    wait(60)
end
