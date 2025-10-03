--// ==================== Multi-Player Teleport (Synapse-friendly) ====================
--// CONFIG — tweak these to your liking
getgenv().Targets = {"minny_nxy",
    "Hug0Hannah47",
    "MrsAndrewkn0ll2005",
    "Emmajolt2012",
    "MrsGamerKnack2006",
    "NexusJill_Dancer",
    "ArrowFlick21",
    "XxCyberPixelChaosxX2",
    "Z0e_Thunder2014YT",
    "PandaFusionPow3r",
    "XxPaisleySaberxX2023",
    "SamuelHawkLucky20191",
    "L3g3ndCraftPrimal",
    "XxSt3althN3onxX2005",
    "XxHeroSparkOmegaxX20",
    "Cooki3Alpha2008", } -- names or display names (partial ok, case-insensitive)
getgenv().CycleAllMatches = true   -- true = cycle through all matched players, false = only first match
getgenv().CycleDelay       = 30     -- seconds to wait before moving on to the next matched player
getgenv().FollowTarget     = false -- true = keep re-teleporting near current target until it's time to switch
getgenv().FollowInterval   = 30  -- seconds between follow teleports
getgenv().OffsetFromTarget = Vector3.new(0, 3, -3) -- relative offset (above & slightly behind the target)
getgenv().StopKey          = Enum.KeyCode.RightShift -- press to stop the script loop

--// ========= single-instance guard (re-run safe) =========
getgenv()._MultiTP = getgenv()._MultiTP or {}
if getgenv()._MultiTP.stop then
    pcall(getgenv()._MultiTP.stop)
end
local NS = { _stop = false }
function NS.stop() NS._stop = true end
getgenv()._MultiTP.stop = NS.stop

--// ==================== Services & Locals ====================
local Players      = game:GetService("Players")
local RunService   = game:GetService("RunService")
local UserInput    = game:GetService("UserInputService")

local LP           = Players.LocalPlayer
local function sb(...) pcall(rconsoleprint or print, table.concat({...}, "")) end

--// ==================== Utility: Wait for Character/HRP ====================
local function waitForChar(plr, timeout)
    plr = plr or LP
    timeout = timeout or 10
    local t0 = tick()
    local char = plr.Character
    if not char then char = plr.CharacterAdded:Wait() end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    while not hrp and tick() - t0 < timeout do
        hrp = char:FindFirstChild("HumanoidRootPart")
        RunService.Heartbeat:Wait()
    end
    return char, hrp
end

--// ==================== Safe Teleport Helpers ====================
local function computeTargetCFrame(targetHRP)
    local off = typeof(getgenv().OffsetFromTarget) == "Vector3" and getgenv().OffsetFromTarget or Vector3.new(0,3,-3)
    -- place relative to target orientation
    return targetHRP.CFrame * CFrame.new(off)
end

local function pivotOrCFrame(char, cf)
    if not char then return end
    -- ensure PrimaryPart
    if not char.PrimaryPart then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            char.PrimaryPart = hrp
        end
    end
    -- prefer PivotTo when available
    if char.PrimaryPart and char.PivotTo then
        char:PivotTo(cf)
    elseif char.PrimaryPart then
        char.PrimaryPart.CFrame = cf
    end
end

local function teleportNear(targetPlr)
    if not targetPlr or targetPlr == LP then return false, "bad target" end
    local myChar, myHRP = waitForChar(LP, 10)
    local tgChar, tgHRP = waitForChar(targetPlr, 10)
    if not (myChar and myHRP and tgChar and tgHRP) then
        return false, "missing HRP/char"
    end

    -- Brief noclip while teleporting to avoid collisions
    local noclipConn
    noclipConn = RunService.Stepped:Connect(function()
        pcall(function()
            for _, part in ipairs(myChar:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end)
    end)

    pivotOrCFrame(myChar, computeTargetCFrame(tgHRP))

    task.wait(0.15)
    if noclipConn then noclipConn:Disconnect() end
    return true
end

--// ==================== Name Matching (partial, case-insensitive) ====================
local function matchesTargetList(plr)
    local un = string.lower(plr.Name)
    local dn = string.lower(plr.DisplayName or "")
    for _, needle in ipairs(getgenv().Targets or {}) do
        local n = string.lower(tostring(needle or ""))
        if n ~= "" and (un:find(n, 1, true) or dn:find(n, 1, true)) then
            return true
        end
    end
    return false
end

local function getCurrentMatches()
    local found = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and matchesTargetList(p) then
            table.insert(found, p)
        end
    end
    return found
end

--// ==================== Hotkey to Stop ====================
UserInput.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == (getgenv().StopKey or Enum.KeyCode.RightShift) then
        NS.stop()
        sb("[MultiTP] Stop requested via hotkey.\n")
    end
end)

--// ==================== Main ====================
task.spawn(function()
    sb("[MultiTP] Scanning for targets... (press RightShift to stop)\n")
    -- ensure we have a character first
    waitForChar(LP, 10)

    while not NS._stop do
        local matches = getCurrentMatches()

        if #matches == 0 then
            sb("[MultiTP] No matching players found. Will rescan...\n")
            task.wait(2)
        else
            if getgenv().CycleAllMatches then
                -- cycle through ALL matches
                for _, tgt in ipairs(matches) do
                    if NS._stop then break end
                    if tgt and tgt.Character then
                        local ok, err = teleportNear(tgt)
                        sb(string.format("[MultiTP] TP to %s: %s\n", tostring(tgt.Name), ok and "OK" or ("failed ("..tostring(err)..")")))
                        local deadline = os.clock() + (getgenv().CycleDelay or 5)
                        if getgenv().FollowTarget then
                            while not NS._stop and os.clock() < deadline do
                                if not (tgt.Character and tgt.Character:FindFirstChild("HumanoidRootPart")) then break end
                                teleportNear(tgt)
                                task.wait(getgenv().FollowInterval or 1.25)
                            end
                        else
                            task.wait(getgenv().CycleDelay or 5)
                        end
                    end
                end
            else
                -- only the first match
                local tgt = matches[1]
                if tgt and tgt.Character then
                    local ok, err = teleportNear(tgt)
                    sb(string.format("[MultiTP] TP to %s: %s\n", tostring(tgt.Name), ok and "OK" or ("failed ("..tostring(err)..")")))
                    if getgenv().FollowTarget then
                        while not NS._stop do
                            if not (tgt.Parent and tgt.Character and tgt.Character:FindFirstChild("HumanoidRootPart")) then
                                sb("[MultiTP] Lost target, rescanning...\n")
                                break
                            end
                            teleportNear(tgt)
                            task.wait(getgenv().FollowInterval or 1.25)
                        end
                    else
                        -- one-shot; then idle a bit and rescan
                        task.wait(2)
                    end
                else
                    task.wait(2)
                end
            end
        end
    end

    sb("[MultiTP] Stopped.\n")
end)
--// ================================================================================

--[[  QUICK TIPS
1) Edit getgenv().Targets with display names or usernames (partial ok). Example:
   getgenv().Targets = { "daniel", "ezra", "Nexus" }

2) Modes:
   - CycleAllMatches = true  & FollowTarget = false  => hop between each match every CycleDelay sec
   - CycleAllMatches = true  & FollowTarget = true   => follow each target for CycleDelay sec, then switch
   - CycleAllMatches = false & FollowTarget = false  => one-shot teleport to the first match
   - CycleAllMatches = false & FollowTarget = true   => stick to the first match and keep near them

3) Press RightShift to stop the script loop cleanly (you can change StopKey).
4) If a game has strong anti-teleport, increase FollowInterval and/or OffsetFromTarget.
]]--
