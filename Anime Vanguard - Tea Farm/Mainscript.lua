-- Chờ game load hoàn toàn
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local targetPlaceId = 18219125606
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Hàm thực hiện dịch chuyển và hạ FPS
local function checkAndTeleport()
    if game.PlaceId ~= targetPlaceId then
        print("Đang dịch chuyển về đúng Place...")
        TeleportService:Teleport(targetPlaceId, player)
    else
        -- Nếu đã ở đúng chỗ, hạ FPS để tiết kiệm tài nguyên (CPU/GPU)
        if setfpscap then
            setfpscap(2)
            print("Đã hạ FPS xuống 2.")
        end
    end
end

-- Chạy kiểm tra ngay lập tức
task.wait(5) -- Đợi một chút sau khi load để đảm bảo ổn định
checkAndTeleport()

-- Vòng lặp kiểm tra định kỳ (đề phòng trường hợp bị lỗi teleport)
while true do
    task.wait(30) -- Kiểm tra mỗi 30 giây là đủ
    if game.PlaceId ~= targetPlaceId then
        checkAndTeleport()
    end
end