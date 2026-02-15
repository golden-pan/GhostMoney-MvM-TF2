--GhostMoney by golden pan

local GhostMoney = rawget(_G, "GhostMoney")
if type(GhostMoney) ~= "table" then GhostMoney = {} end
rawset(_G, "GhostMoney", GhostMoney)

GhostMoney.Meta = GhostMoney.Meta or {}
GhostMoney.Meta.version = "2.0-modular-compat"
GhostMoney.Meta.build = "2026-02-12"

GhostMoney.Runtime = {
gp_lastQueueLen = -1,
gp_partyLeaveLastTrigger = 0,
sniperUpgradeCompleted = false,
sniperUpgradeCompletedTime = 0,
teleporterJustUsed = false,
tpStickyArmed = false,
tpStickyServerIP = "",
tpLastAliveState = nil,
tpRespawnRearmPending = false,
tpForceRestoreAwaitRespawn = false,
tpForceModeEnabled = false,
tpHotkeyHoldStart = 0,
tpHotkeyHoldDown = false,
tpHotkeyHoldTriggered = false,
TP_FORCE_HOLD_SECONDS = 1.3,
forceSniperBuyModeEnabled = false,
sniperHotkeyHoldStart = 0,
sniperHotkeyHoldDown = false,
sniperHotkeyHoldTriggered = false,
SNIPER_FORCE_HOLD_SECONDS = 1.3,
forceSniperBuyZoneLatch = false,
forceSniperBuyLastTry = 0,
sniperIgnoreShortToggleUntil = 0,
sniperSkipNextShortToggle = false,
sniperBlockShortToggleOnRelease = false,
sniperReloadAwaitRespawn = false,
sniperReloadRespawnPending = false,
sniperLastAliveState = nil,
gpSniperBuyLoadRearmPending = false,
gpHadSniperBuyActiveOnLoad = false,
gpStickyAutoBuyEnabled = false,
gpStickyForceSniperBuyEnabled = false,
tpToggleSpawnLock = false,
tpNoTeleFallbackActive = false,
tpTeleporterSeenCount = 0,
tpFallbackWaitPopupShown = false,
TP_TELE_STABLE_SCANS = 8,
TP_WAIT_NOTIFY_INTERVAL = 7.0,
TP_STUCK_TIMEOUT = 10.0,
tpFallbackNextWaitNotify = 0,
tpIsWaitingForTeleporter = false,
tpWaitMoveWarnNext = 0,
tpWaitMoveWarnCount = 0,
tpToggleNeedsTrigger = false,
tpIgnoreShortToggleUntil = 0,
tpSkipNextShortToggle = false,
tpLastKnownClassName = nil,
tpLastForceToggleAt = 0,
tpReloadRestoreNormalPending = false,
tpWaitForRoundReload = false,
tpWaitForRoundReloadReason = "",
tpStuckTargetId = nil,
tpStuckLastProgressTime = 0,
tpStuckLastDistance = nil,
tpStuckKillCooldownUntil = 0,
tpUseVerifyActive = false,
tpUseVerifyStart = 0,
tpUseVerifyAnchor = nil,
tpUseVerifyTargetPos = nil,
tpUseVerifyKillCooldownUntil = 0,
}

local __GM_STATE = GhostMoney.Runtime
local __GM_PROXY_KEYS = {
["ALL_OFF_KEY"] = true,
["ALL_OFF_RESTORE_WINDOW"] = true,
["GP_CheckSniperUpgradeDone"] = true,
["GP_IN_BACK"] = true,
["GP_IN_FORWARD"] = true,
["GP_IN_JUMP"] = true,
["GP_IN_LEFT"] = true,
["GP_IN_MOVELEFT"] = true,
["GP_IN_MOVERIGHT"] = true,
["GP_IN_RIGHT"] = true,
["GP_IsSniper"] = true,
["GP_OnSniperUpgradesComplete"] = true,
["GP_PICK_KEYS"] = true,
["GP_RST"] = true,
["GP_RST_CONTEXT_SECONDS"] = true,
["GP_RST_FORCE_LOCK_SECONDS"] = true,
["GP_RST_FORCE_MAX_RETRIES"] = true,
["GP_RST_FORCE_RETRY_DELAY"] = true,
["GP_RST_QUEUE_DELAY"] = true,
["GP_RST_RESTART_COOLDOWN"] = true,
["GP_RST_SNIPER_AFTER_WAVE"] = true,
["GP_RST_VOTE_WINDOW_SECONDS"] = true,
["GP_SPAWN_SCAN_INTERVAL"] = true,
["GP_SPAWN_SIGN_RADIUS"] = true,
["GP_SPAWN_SIGN_SCAN_INTERVAL"] = true,
["IsInSpawnRoom"] = true,
["RELOAD_SPAWN_RADIUS"] = true,
["SNIPER_FORCE_HOLD_SECONDS"] = true,
["TP_FORCE_HOLD_SECONDS"] = true,
["TP_LOCK_FAILSAFE_SECONDS"] = true,
["TP_STUCK_TIMEOUT"] = true,
["TP_TELE_STABLE_SCANS"] = true,
["TP_WAITROUND_REARM_FAILSAFE_SECONDS"] = true,
["TP_WAIT_NOTIFY_INTERVAL"] = true,
["__keyNameCache"] = true,
["allOffRestoreSnapshot"] = true,
["allOffRestoreUntil"] = true,
["cashGenEntryCount"] = true,
["forceSniperBuyLastTry"] = true,
["forceSniperBuyModeEnabled"] = true,
["forceSniperBuyZoneLatch"] = true,
["gpF4LastApplied"] = true,
["gpF4PendingRejoinCycle"] = true,
["gpF4RequireTpForReady"] = true,
["gpHadSniperBuyActiveOnLoad"] = true,
["gpSniperBuyLoadRearmPending"] = true,
["gpSpawnAreaAnchors"] = true,
["gpSpawnAreaAnchorsMap"] = true,
["gpSpawnAreaNextRescan"] = true,
["gpSpawnSignAnchor"] = true,
["gpSpawnSignAnchorMap"] = true,
["gpSpawnSignNextScan"] = true,
["gpStickyAutoBuyEnabled"] = true,
["gpStickyForceSniperBuyEnabled"] = true,
["gp_lastQueueLen"] = true,
["gp_partyKillLastTrigger"] = true,
["gp_partyLeaveLastTrigger"] = true,
["reloadMoveLock"] = true,
["sniperBlockShortToggleOnRelease"] = true,
["sniperHotkeyHoldDown"] = true,
["sniperHotkeyHoldStart"] = true,
["sniperHotkeyHoldTriggered"] = true,
["sniperIgnoreShortToggleUntil"] = true,
["sniperLastAliveState"] = true,
["sniperReloadAwaitRespawn"] = true,
["sniperReloadRespawnPending"] = true,
["sniperSkipNextShortToggle"] = true,
["sniperUpgradeCompleted"] = true,
["sniperUpgradeCompletedTime"] = true,
["teleporterJustUsed"] = true,
["tpFallbackNextWaitNotify"] = true,
["tpFallbackWaitPopupShown"] = true,
["tpForceModeEnabled"] = true,
["tpForceRestoreAwaitRespawn"] = true,
["tpHotkeyHoldDown"] = true,
["tpHotkeyHoldStart"] = true,
["tpHotkeyHoldTriggered"] = true,
["tpIgnoreShortToggleUntil"] = true,
["tpIsWaitingForTeleporter"] = true,
["tpLastAliveState"] = true,
["tpLastForceToggleAt"] = true,
["tpLastKnownClassName"] = true,
["tpNoTeleFallbackActive"] = true,
["tpReloadMoveLockArmedAt"] = true,
["tpReloadRestoreNormalPending"] = true,
["tpRespawnRearmPending"] = true,
["tpSkipNextShortToggle"] = true,
["tpStickyArmed"] = true,
["tpStickyServerIP"] = true,
["tpStuckKillCooldownUntil"] = true,
["tpStuckLastDistance"] = true,
["tpStuckLastProgressTime"] = true,
["tpStuckTargetId"] = true,
["tpTeleporterSeenCount"] = true,
["tpToggleNeedsTrigger"] = true,
["tpToggleSpawnLock"] = true,
["tpToggleSpawnLockArmedAt"] = true,
["tpUseVerifyActive"] = true,
["tpUseVerifyAnchor"] = true,
["tpUseVerifyKillCooldownUntil"] = true,
["tpUseVerifyStart"] = true,
["tpUseVerifyTargetPos"] = true,
["tpWaitForRoundReload"] = true,
["tpWaitForRoundReloadArmedAt"] = true,
["tpWaitForRoundReloadReason"] = true,
["tpWaitMoveWarnCount"] = true,
["tpWaitMoveWarnNext"] = true,
}

GhostMoney.Internal = GhostMoney.Internal or {}
GhostMoney.Internal.proxyKeys = __GM_PROXY_KEYS

local __GM_OLD_MT = getmetatable(_G)
local __GM_OLD_INDEX = __GM_OLD_MT and __GM_OLD_MT.__index or nil
local __GM_OLD_NEWINDEX = __GM_OLD_MT and __GM_OLD_MT.__newindex or nil

for k in pairs(__GM_PROXY_KEYS) do
rawset(_G, k, nil)
end

local function __gm_fallback_index(t, k)
if type(__GM_OLD_INDEX) == "function" then
return __GM_OLD_INDEX(t, k)
elseif type(__GM_OLD_INDEX) == "table" then
return __GM_OLD_INDEX[k]
end
return rawget(t, k)
end

local function __gm_fallback_newindex(t, k, v)
if type(__GM_OLD_NEWINDEX) == "function" then
return __GM_OLD_NEWINDEX(t, k, v)
elseif type(__GM_OLD_NEWINDEX) == "table" then
__GM_OLD_NEWINDEX[k] = v
return
end
rawset(t, k, v)
end

local __GM_NEW_MT = {}
if type(__GM_OLD_MT) == "table" then
for k, v in pairs(__GM_OLD_MT) do
__GM_NEW_MT[k] = v
end
end

__GM_NEW_MT.__index = function(t, k)
if __GM_PROXY_KEYS[k] then
return __GM_STATE[k]
end
return __gm_fallback_index(t, k)
end

__GM_NEW_MT.__newindex = function(t, k, v)
if __GM_PROXY_KEYS[k] then
__GM_STATE[k] = v
return
end
__gm_fallback_newindex(t, k, v)
end

pcall(setmetatable, _G, __GM_NEW_MT)

function GhostMoney.StateGet(key, fallback)
local v = __GM_STATE[key]
if v == nil then return fallback end
return v
end

function GhostMoney.StateSet(key, value)
if __GM_PROXY_KEYS[key] then
__GM_STATE[key] = value
return true
end
return false
end

function GhostMoney.StateSnapshot()
local snap = {}
for k in pairs(__GM_PROXY_KEYS) do
snap[k] = __GM_STATE[k]
end
return snap
end

local __GM_SHUTDOWN_DONE = false
function GhostMoney.Internal.Shutdown()
if __GM_SHUTDOWN_DONE then return end
__GM_SHUTDOWN_DONE = true
pcall(function()
if __GM_OLD_MT ~= nil then
setmetatable(_G, __GM_OLD_MT)
else
setmetatable(_G, nil)
end
end)
for k in pairs(__GM_PROXY_KEYS) do
rawset(_G, k, __GM_STATE[k])
end
end

function GP_CheckSniperUpgradeDone(queueLen) end
function GP_OnSniperUpgradesComplete(reason) end
local GP_CLASS_NAME = {
[1] = "scout",
[2] = "sniper",
[3] = "soldier",
[4] = "demoman",
[5] = "medic",
[6] = "heavy",
[7] = "pyro",
[8] = "spy",
[9] = "engineer",
}
local function GP_GetClassId(me)
if not (me and me.GetPropInt) then return nil end
local ok, cls = pcall(me.GetPropInt, me, "m_iClass")
if not ok or type(cls) ~= "number" then return nil end
return cls
end
function GP_GetCurrentClassName(me)
local cls = GP_GetClassId(me)
if not cls then return nil end
return GP_CLASS_NAME[cls]
end
local config = {
transparentEnabled = false,
hideHotkeysInUI = false,
hideInfoPopups = false,
partyGpKillEnabled = false,
partyGpLeaveEnabled = false,
autoDisconnectEnabled = false,
autoWalkEnabled = false,
autoBuyEnabled = false,
forceSniperBuyEnabled = false,
tpWalkEnabled = false,
forceTpWalkEnabled = false,
tpWalkMoveLockEnabled = true,
tpWalkWhitelistEnabled = false,
firstJoinPickMedic = false,
mvmReadyTpCycleEnabled = true,
instantRespawnEnabled = false,
all_off_key = KEY_X,
watermarkX = 10,
watermarkY = 10,
moneyThreshold = 5500,
changeClassEnabled = false,
targetClass = ""
}
local CFG_DIR = "gp_ghost"
local CFG_NAME = "gp_ghost_settings.cfg"
local function GP_TryMkdir(d)
pcall(function() filesystem.CreateDirectory(d) end)
pcall(function() filesystem.CreateFolder(d) end)
pcall(function() file.CreateDirectory(d) end)
pcall(function() file.CreateFolder(d) end)
pcall(function() file.CreateDir(d) end)
pcall(function() file.CreatePath(d) end)
pcall(function() os.execute('mkdir "' .. d .. '"') end)
pcall(function() os.execute("mkdir " .. d) end)
end
local function GP_CfgPath()
GP_TryMkdir(CFG_DIR)
return CFG_DIR .. "/" .. CFG_NAME
end
local function IsManualMoveInput()
return input.IsButtonDown(KEY_W) or input.IsButtonDown(KEY_A) or input.IsButtonDown(KEY_S) or input.IsButtonDown(KEY_D)
end
function GP_IsTextInputOpen()
if not engine then return false end
local chatOpen = false
local conOpen = false
local menuOpen = false
if engine.IsChatOpen then
local ok, v = pcall(engine.IsChatOpen)
chatOpen = (ok and v == true)
end
if engine.Con_IsVisible then
local ok, v = pcall(engine.Con_IsVisible)
conOpen = (ok and v == true)
end
if engine.IsGameUIVisible then
local ok, v = pcall(engine.IsGameUIVisible)
menuOpen = (ok and v == true)
end
return chatOpen or conOpen or menuOpen
end
function GP_HasMoveIntent(cmd)
if GP_IsTextInputOpen() then return false end
if IsManualMoveInput() then return true end
if not cmd then return false end
local fwd = 0
local side = 0
local up = 0
if cmd.GetForwardMove then
local ok, v = pcall(cmd.GetForwardMove, cmd)
if ok and type(v) == "number" then fwd = v end
end
if cmd.GetSideMove then
local ok, v = pcall(cmd.GetSideMove, cmd)
if ok and type(v) == "number" then side = v end
end
if cmd.GetUpMove then
local ok, v = pcall(cmd.GetUpMove, cmd)
if ok and type(v) == "number" then up = v end
end
return (math.abs(fwd) > 1) or (math.abs(side) > 1) or (math.abs(up) > 1)
end
GP_IN_JUMP = 2
GP_IN_FORWARD = 8
GP_IN_BACK = 16
GP_IN_LEFT = 128
GP_IN_RIGHT = 256
GP_IN_MOVELEFT = 512
GP_IN_MOVERIGHT = 1024
function GP_TP_IsMoveLockActive()
local lockOn = (config and config.tpWalkMoveLockEnabled == true)
local modeOn = (tpForceModeEnabled == true) or (config and config.tpWalkEnabled == true)
if (not lockOn) or (not modeOn) then
return false
end
local now = ((globals and globals.CurTime and globals.CurTime()) or 0)
if (tpClassSwapUnlockUntil or 0) > now then
return false
end
local movingNow = (teleporterConfig and teleporterConfig.autoWalkEnabled == true) and (not teleporterJustUsed)
local waitingNow = (tpIsWaitingForTeleporter == true) or (tpNoTeleFallbackActive == true)
local verifyingNow = (tpUseVerifyActive == true)
return (movingNow or waitingNow or verifyingNow)
end
function GP_TP_ApplyMovementLock(cmd)
if not cmd then return end
pcall(function() cmd:SetForwardMove(0) end)
pcall(function() cmd:SetSideMove(0) end)
pcall(function() if cmd.SetUpMove then cmd:SetUpMove(0) end end)
pcall(function()
if cmd.GetButtons and cmd.SetButtons then
local b = cmd:GetButtons()
if type(b) == "number" then
local bitlib = bit32 or bit
if bitlib and bitlib.band and bitlib.bnot then
local clearMask = GP_IN_JUMP + GP_IN_FORWARD + GP_IN_BACK + GP_IN_LEFT + GP_IN_RIGHT + GP_IN_MOVELEFT + GP_IN_MOVERIGHT
local cleaned = bitlib.band(b, bitlib.bnot(clearMask))
cmd:SetButtons(cleaned)
end
end
end
end)
end
function GP_IsMvM()
local ok, v = pcall(function()
if gamerules then
if gamerules.IsMvM then return gamerules.IsMvM() end
if gamerules.IsMannVsMachine then return gamerules.IsMannVsMachine() end
if gamerules.IsMannVsMachineMode then return gamerules.IsMannVsMachineMode() end
end
return nil
end)
if ok and type(v) == "boolean" then return v end
local proxy = nil
local ok2 = pcall(function()
if entities and entities.FindByClass then
local t = entities.FindByClass("CTFGameRulesProxy")
if t and t[1] then proxy = t[1] end
end
end)
if ok2 and proxy and proxy.GetPropInt then
local ok3, p1 = pcall(function() return proxy:GetPropInt("m_bPlayingMannVsMachine") end)
if ok3 and type(p1) == "number" then
return p1 ~= 0
end
end
local ok4, bots = pcall(function()
if entities and entities.FindByClass then
return entities.FindByClass("CTFBot")
end
return nil
end)
if ok4 and bots and #bots > 0 then
return true
end
return false
end
local function GP_GetWaveNumber_Fallback()
local ok, wn = pcall(function()
if gamerules and gamerules.GetRoundState then
return nil
end
return nil
end)
if ok and type(wn) == "number" then return wn end
return nil
end
__GP_LAST_COLOR = __GP_LAST_COLOR or {255, 255, 255, 255}
function __GP_ForceLastColor()
local r = tonumber(__GP_LAST_COLOR[1]) or 255
local g = tonumber(__GP_LAST_COLOR[2]) or 255
local b = tonumber(__GP_LAST_COLOR[3]) or 255
local a = tonumber(__GP_LAST_COLOR[4]) or 255
if a <= 0 then a = 1 end
if type(_GP_OrigDrawColor) == "function" then
pcall(_GP_OrigDrawColor, r, g, b, a)
else
pcall(draw.Color, r, g, b, a)
end
end
function SafeFilledRect(x1, y1, x2, y2)
local ok = pcall(draw.FilledRect, x1, y1, x2, y2)
if not ok then
__GP_ForceLastColor()
pcall(draw.FilledRect, x1, y1, x2, y2)
end
end

local function SafeText(x, y, s)
local ix, iy = math.floor(x + 0.5), math.floor(y + 0.5)
local ok = pcall(draw.Text, ix, iy, s)
if not ok then
__GP_ForceLastColor()
pcall(draw.Text, ix, iy, s)
end
end
function AddNotification(message, ntype, duration)
if message == "SniperBuy Enabled" or message == "SniperBuy Enabled - Reset state" then
message = "SniperBuy Enabled - Reset state (Death/Respawn as Sniper activates it)"
if duration == nil then duration = 4.0 end
end
if type(message) == "string" then
message = message:gsub("%s+$", "")
message = message:gsub("%.+$", "")
end
UI = UI or {}
UI.notifications = UI.notifications or {}
if config and config.hideInfoPopups == true then return end
if _G.type(message) == "string" and string.find(message, "^Changed class to ") then
local rt = 0
pcall(function()
if globals and globals.RealTime then
rt = globals.RealTime()
elseif globals and globals.CurTime then
rt = globals.CurTime()
end
end)
_G.__gm_lastClassChangedPopupMsg = _G.__gm_lastClassChangedPopupMsg or ""
_G.__gm_lastClassChangedPopupAt = _G.__gm_lastClassChangedPopupAt or -9999
if message == _G.__gm_lastClassChangedPopupMsg and (rt - (_G.__gm_lastClassChangedPopupAt or 0)) < 2.0 then
return
end
_G.__gm_lastClassChangedPopupMsg = message
_G.__gm_lastClassChangedPopupAt = rt
end
if _G.type(CreateNotification) == "function" then
table.insert(UI.notifications, 1, CreateNotification(message, ntype, duration))
if UI.maxNotifications and #UI.notifications > UI.maxNotifications then
table.remove(UI.notifications)
end
else
table.insert(UI.notifications, 1, {
message = tostring(message or ""),
type = ntype,
time = (globals and globals.RealTime and globals.RealTime()) or 0,
alpha = 255,
lifetime = duration
})
if #UI.notifications > 8 then table.remove(UI.notifications) end
end
end
local needToLeaveZone = false
local leaveZoneStartPos = nil
local leaveZoneTime = 0
local hasTriedClassChange = false
local pendingRetry = false
local pendingRetryTargetClass = nil
local pendingRetryTargetUntil = 0
local pendingClassChange = false
local classChangeDidRefund = false
local classChangeRefundTime = 0
local classChangeDidCleanup = false
local classChangeCleanupTime = 0
local classChangeReadyTime = 0
local lastRetryTime = 0
local RETRY_COOLDOWN = 5.0
local THRESHOLD_CLASSCHANGE_DELAY = 0.65
local thresholdNotificationShown = false
local classChangeSwapPopupShown = false
local classChangeUsePreWaveRules = false
local acPostWaveSwapLatched = false
local lastExploitTime = 0
local lastCleanupTime = 0
local cleanupFlashUntil = 0
local lastVaccWarning = false
local autoWalkPaused = false
local autoWalkPauseReason = nil
local lastWavePauseWarning = false
local lastAutoWalkPauseReason = nil
local COOLDOWN_TIME = 0.5
local UPGRADE_DELAY = 0.05
local SNIPER_COOLDOWN_TIME = 0.5
local SNIPER_UPGRADE_DELAY = 0.05
local SNIPER_RETRY_DELAY = 0.18
local SNIPER_TRIGGER_DEBOUNCE = 0.25
local SNIPER_MAX_RETRIES = 30
local sniperUpgradeCooldownUntil = 0
local MEDIC_TRIGGER_DEBOUNCE = 0.08
local MEDIC_MAX_RETRIES = 25
local medicTriggerDebounceUntil = 0
local SEQUENCE_END_COOLDOWN = 1.0
local nextUpgradeTime = 0
local sequenceEndTime = 0
local upgradeQueue = {}
local isExploiting = false
local isUpgradingSniper = false
local lastSniperTriggerTime = 0
local sniperUpgradesComplete = false
local autobuyRunOnceDone = false
local medicThresholdReached = false
local gpPhase = "MEDIC_FARM"
local autobuyDoneAnnounced = false
local respawnExpected = false
local currentServer = nil
local hadLocalPlayer = false
local gpFirstJoinPickMedicPending = false
local gpFirstJoinPickMedicDone = false
local gpFirstJoinPickMedicUntil = 0
local gpFirstJoinPickMedicServer = ""
local gpLoadedWhileConnected = false
do
local _ok, _ip = pcall(function()
return (engine and engine.GetServerIP and engine.GetServerIP()) or ""
end)
if _ok and type(_ip) == "string" and _ip ~= "" then
gpLoadedWhileConnected = true
end
end
local gpSuppressFirstJoinPickMedicOnAttach = gpLoadedWhileConnected
local lastMapName = ""
local lastCurTime = globals.CurTime() or 0
gpF4PendingRejoinCycle = false
gpF4RequireTpForReady = false
gpF4LastApplied = nil
gpF4Wave2FailPauseUntil = gpF4Wave2FailPauseUntil or 0
local gpAutoDisconnectTriggered = false
local function GP_AutoDisconnectTick()
if not (config and config.autoDisconnectEnabled == true) then
gpAutoDisconnectTriggered = false
return
end
local inEnd = false
pcall(function()
if gamecoordinator and gamecoordinator.InEndOfMatch then
inEnd = (gamecoordinator.InEndOfMatch() == true)
end
end)
if not inEnd then
local hasLive = nil
pcall(function()
if gamecoordinator and gamecoordinator.HasLiveMatch then
hasLive = (gamecoordinator.HasLiveMatch() == true)
end
end)
if hasLive == false then
gpAutoDisconnectTriggered = false
end
return
end
if gpAutoDisconnectTriggered then
return
end
gpAutoDisconnectTriggered = true
pcall(function()
if gamecoordinator and gamecoordinator.AbandonMatch then
gamecoordinator.AbandonMatch()
end
end)
pcall(function()
if client and client.Command then
client.Command("disconnect", true)
end
end)
AddNotification("Auto Disconnect triggered - abandoned and disconnected", "info")
end
function GP_F4_IsFeatureEnabled()
return (config and config.mvmReadyTpCycleEnabled == true)
end
function GP_F4_SetGuiAutoReady(enabled, forceWrite)
if not GP_F4_IsFeatureEnabled() then return false end
local want = (enabled and true or false)

local function _f4Normalize(v)
local tv = type(v)
if tv == "boolean" then return v end
if tv == "number" then return (v ~= 0) end
if tv == "string" then
local sv = string.lower(v)
return (sv == "1") or (sv == "true") or (sv == "on") or (sv == "enabled")
end
return false
end

local curMatches = false
do
local okCur, curV = pcall(function()
if gui and gui.GetValue then
return gui.GetValue("mvm auto ready (f4)")
end
return nil
end)
if okCur and curV ~= nil then
curMatches = (_f4Normalize(curV) == want)
end
end

if (not forceWrite) and gpF4LastApplied ~= nil and gpF4LastApplied == want and curMatches then
return true
end

local ok = pcall(function()
if gui and gui.SetValue then
gui.SetValue("mvm auto ready (f4)", want and 1 or 0)
end
end)

if (not ok) then
ok = pcall(function()
if gui and gui.SetValue then
gui.SetValue("mvm auto ready (f4)", want and true or false)
end
end)
end

if ok then
gpF4LastApplied = want
return true
end
return false
end
function GP_F4_IsPreWave1State()
local preWave = false
if GP_IsMvM and GP_IsMvM() then
if GP_HasExplicitPreWave1Proof then
local ok, v = pcall(GP_HasExplicitPreWave1Proof)
preWave = (ok and v == true) or false
end
if not preWave then
local w = (GP_GetWaveNumber and GP_GetWaveNumber()) or nil
if type(w) == "number" and w <= 0 then
preWave = true
end
end
end
return preWave
end
function GP_F4_Sync(reason, forceWrite)
if not GP_F4_IsFeatureEnabled() then return end
if GP_IsMvM and (not GP_IsMvM()) then
GP_F4_SetGuiAutoReady(false, forceWrite)
return
end
local nowRT = GP_RST_Now and GP_RST_Now() or ((globals and globals.RealTime and globals.RealTime()) or 0)
local pauseUntil = (gpF4Wave2FailPauseUntil or 0)
if pauseUntil > 0 then
if nowRT < pauseUntil then
GP_F4_SetGuiAutoReady(false, true)
return
end
gpF4Wave2FailPauseUntil = 0
gpF4PendingRejoinCycle = false
gpF4RequireTpForReady = false
GP_F4_SetGuiAutoReady(true, true)
return
end
local preWave = GP_F4_IsPreWave1State()
local shouldOn = false
if preWave then
shouldOn = (not gpF4RequireTpForReady)
else
shouldOn = true
end
GP_F4_SetGuiAutoReady(shouldOn, forceWrite)
end
function GP_F4_OnDisconnectCycle(reason)
gpF4PendingRejoinCycle = true
gpF4RequireTpForReady = true
if GP_F4_IsFeatureEnabled() then
GP_F4_SetGuiAutoReady(false, true)
end
end
function GP_F4_OnJoinCycle(reason)
if not GP_F4_IsFeatureEnabled() then return end
if gpF4PendingRejoinCycle then
gpF4RequireTpForReady = true
gpF4PendingRejoinCycle = false
GP_F4_SetGuiAutoReady(false, true)
return
end
local preWave = GP_F4_IsPreWave1State()
if preWave then
gpF4RequireTpForReady = true
GP_F4_SetGuiAutoReady(false, true)
else
gpF4RequireTpForReady = false
GP_F4_Sync("join_non_prewave", true)
end
end
function GP_F4_OnTpSuccess()
if not GP_F4_IsFeatureEnabled() then return end
if gpF4RequireTpForReady then
gpF4RequireTpForReady = false
gpF4PendingRejoinCycle = false
GP_F4_Sync("tp_success", true)
else
GP_F4_Sync("tp_success", false)
end
end
function GP_F4_OnFeatureToggle(enabled)
if enabled then
local preWave = GP_F4_IsPreWave1State()
gpF4PendingRejoinCycle = false
gpF4RequireTpForReady = (preWave and true or false)
GP_F4_Sync("feature_enable", true)
AddNotification("Smart AutoF4 Enabled - Pre Wave 1 waits till threshold or teleported", preWave and "warning" or "success", preWave and 4.8 or 3.8)
else
gpF4LastApplied = nil
AddNotification("Smart AutoF4 Disabled", "info", 3.5)
end
end
local function GP_GetConVarString(name)
local ok, v = pcall(function()
if client and type(client.GetConVar) == "function" then
return client.GetConVar(name)
end
return nil
end)
if ok and v ~= nil then return tostring(v) end
ok, v = pcall(function()
if client and type(client.GetConVarString) == "function" then
return client.GetConVarString(name)
end
return nil
end)
if ok and v ~= nil then return tostring(v) end
ok, v = pcall(function()
if convar and type(convar.GetString) == "function" then
return convar.GetString(name)
end
return nil
end)
if ok and v ~= nil then return tostring(v) end
return ""
end
local function GP_GetMissionKey(mapName)
mapName = mapName or (engine.GetMapName() or "")
local pop = GP_GetConVarString("tf_mvm_popfile")
local mission = GP_GetConVarString("tf_mvm_mission")
if pop == "" and mission == "" then
return mapName
end
return mapName .. "|" .. pop .. "|" .. mission
end
local startingSequenceShown = false
cashGenEntryCount = cashGenEntryCount or 0
local autoModeWalkActive = false
local gpDropdown = {
want = nil,
state = nil,
anim = 0,
sliderDragging = false,
lastMouseDown = false,
openedCashThreshold = nil,
openedClassEnabled = nil,
openedClassTarget = nil
}
local shouldGuidePlayer = false
local midpoint = nil
local shouldGuidePlayerBuy = false
local buyMidpoint = nil
local buySpawnAnchor = nil
local medicSpawnAnchor = nil
local SNIPER_BUY_WALK_TIMEOUT = 10.0
local SNIPER_BUY_WALK_KILL_COOLDOWN = 4.0
local sniperBuyWalkStartTime = 0
local sniperBuyWalkKillCooldownUntil = 0
local AUTOBUY_SPAWN_RADIUS = 200
local IsInSpawnRoom
local function DistSqr(a, b)
local dx, dy, dz = a.x - b.x, a.y - b.y, a.z - b.z
return dx*dx + dy*dy + dz*dz
end
RELOAD_SPAWN_RADIUS = 200
gpSpawnAreaAnchors = {}
gpSpawnAreaAnchorsMap = ""
gpSpawnAreaNextRescan = 0
GP_SPAWN_SCAN_INTERVAL = 2.0
GP_SPAWN_SIGN_SCAN_INTERVAL = 1.0
GP_SPAWN_SIGN_RADIUS = 1200
gpSpawnSignAnchor = nil
gpSpawnSignAnchorMap = ""
gpSpawnSignNextScan = 0
function GP_RebuildSpawnAreaAnchors(force)
local now = 0
pcall(function()
if globals and globals.RealTime then now = globals.RealTime()
elseif globals and globals.CurTime then now = globals.CurTime() end
end)
local mapName = ""
pcall(function() mapName = engine.GetMapName() or "" end)
if (not force) and gpSpawnAreaAnchorsMap == mapName and now < (gpSpawnAreaNextRescan or 0) and #gpSpawnAreaAnchors > 0 then
return
end
gpSpawnAreaAnchors = {}
gpSpawnAreaAnchorsMap = mapName
gpSpawnAreaNextRescan = now + GP_SPAWN_SCAN_INTERVAL
local classes = {
"func_respawnroom",
"func_respawnroomvisualizer",
"info_player_teamspawn",
"info_player_spawn",
"CFuncRespawnRoom",
"CFuncRespawnRoomVisualizer",
"CInfoPlayerTeamspawn",
"CInfoPlayerSpawn",
"CTFPlayerStart"
}
for _, cls in ipairs(classes) do
local okList, list = pcall(function()
if entities and entities.FindByClass then
return entities.FindByClass(cls)
end
return nil
end)
if okList and list then
for i = 1, #list do
local ent = list[i]
if ent and ent.GetAbsOrigin then
local okPos, pos = pcall(ent.GetAbsOrigin, ent)
if okPos and pos then
local team = nil
if ent.GetTeamNumber then
pcall(function() team = ent:GetTeamNumber() end)
end
if (not team or team <= 0) and ent.GetPropInt then
pcall(function() team = ent:GetPropInt("m_iTeamNum") end)
end
gpSpawnAreaAnchors[#gpSpawnAreaAnchors + 1] = { pos = pos, team = team }
end
end
end
end
end
if (#gpSpawnAreaAnchors == 0) and entities and entities.GetHighestEntityIndex and entities.GetByIndex then
local highest = entities.GetHighestEntityIndex() or 2048
for i = 0, highest do
local ent = entities.GetByIndex(i)
if ent and ent.GetClass and ent.GetAbsOrigin then
local okClass, className = pcall(ent.GetClass, ent)
if okClass and className then
local c = string.lower(tostring(className))
local looksSpawn = string.find(c, "respawn", 1, true)
or string.find(c, "teamspawn", 1, true)
or string.find(c, "player_spawn", 1, true)
or string.find(c, "playerstart", 1, true)
if looksSpawn then
local okPos, pos = pcall(ent.GetAbsOrigin, ent)
if okPos and pos then
local team = nil
if ent.GetTeamNumber then
pcall(function() team = ent:GetTeamNumber() end)
end
if (not team or team <= 0) and ent.GetPropInt then
pcall(function() team = ent:GetPropInt("m_iTeamNum") end)
end
gpSpawnAreaAnchors[#gpSpawnAreaAnchors + 1] = { pos = pos, team = team }
end
end
end
end
end
end
end
function GP_UpdateSpawnSignAnchor(me, force)
if not me then return gpSpawnSignAnchor end
local now = 0
pcall(function()
if globals and globals.RealTime then now = globals.RealTime()
elseif globals and globals.CurTime then now = globals.CurTime() end
end)
local mapName = ""
pcall(function() mapName = engine.GetMapName() or "" end)
if (not force) and gpSpawnSignAnchor and gpSpawnSignAnchorMap == mapName and now < (gpSpawnSignNextScan or 0) then
return gpSpawnSignAnchor
end
gpSpawnSignAnchor = nil
gpSpawnSignAnchorMap = mapName
gpSpawnSignNextScan = now + GP_SPAWN_SIGN_SCAN_INTERVAL
if not (entities and entities.GetHighestEntityIndex and entities.GetByIndex and models and models.GetModelName) then
return nil
end
local myPos = nil
if me.GetAbsOrigin then
local okMy, posMy = pcall(me.GetAbsOrigin, me)
if okMy then myPos = posMy end
end
local signs = {}
local highest = entities.GetHighestEntityIndex() or 2048
for i = 0, highest do
local ent = entities.GetByIndex(i)
if ent and ent.GetClass and ent.GetModel and ent.GetAbsOrigin then
local okClass, className = pcall(ent.GetClass, ent)
if okClass and className == "CDynamicProp" then
local mdl = nil
pcall(function() mdl = models.GetModelName(ent:GetModel()) end)
if mdl == "models/props_mvm/mvm_upgrade_sign.mdl" then
local okPos, pos = pcall(ent.GetAbsOrigin, ent)
if okPos and pos then
signs[#signs + 1] = pos
end
end
end
end
end
if #signs == 0 then
return nil
end
if myPos and #signs >= 2 then
table.sort(signs, function(a, b) return DistSqr(a, myPos) < DistSqr(b, myPos) end)
local p1 = signs[1]
local p2 = signs[2]
gpSpawnSignAnchor = Vector3((p1.x + p2.x) / 2, (p1.y + p2.y) / 2, (p1.z + p2.z) / 2)
return gpSpawnSignAnchor
end
gpSpawnSignAnchor = signs[1]
return gpSpawnSignAnchor
end
function GP_IsInSpawnRadiusArea(player, radius)
if not player or not player.GetAbsOrigin then return false end
GP_RebuildSpawnAreaAnchors(false)
local okPos, myPos = pcall(player.GetAbsOrigin, player)
if not okPos or not myPos then return false end
local myTeam = nil
if player.GetTeamNumber then
pcall(function() myTeam = player:GetTeamNumber() end)
end
if (not myTeam or myTeam <= 0) and player.GetPropInt then
pcall(function() myTeam = player:GetPropInt("m_iTeamNum") end)
end
local r = radius or RELOAD_SPAWN_RADIUS
local r2 = r * r
if gpSpawnAreaAnchors and #gpSpawnAreaAnchors > 0 then
for i = 1, #gpSpawnAreaAnchors do
local a = gpSpawnAreaAnchors[i]
if a and a.pos then
local t = a.team
local teamOk = (not t) or (t <= 1) or (not myTeam) or (t == myTeam)
if teamOk and DistSqr(myPos, a.pos) <= r2 then
return true
end
end
end
end
local signAnchor = GP_UpdateSpawnSignAnchor(player, false)
if signAnchor then
local signR = GP_SPAWN_SIGN_RADIUS or 1200
if DistSqr(myPos, signAnchor) <= (signR * signR) then
return true
end
end
return false
end
local function IsInSniperBuySpawnArea(player)
if not player then return false end
if IsInSpawnRoom and IsInSpawnRoom(player) then
buySpawnAnchor = player:GetAbsOrigin()
return true
end
if GP_IsInSpawnRadiusArea(player, AUTOBUY_SPAWN_RADIUS) then
if not buySpawnAnchor then
buySpawnAnchor = player:GetAbsOrigin()
end
return true
end
if buySpawnAnchor then
local pos = player:GetAbsOrigin()
return DistSqr(pos, buySpawnAnchor) <= (AUTOBUY_SPAWN_RADIUS * AUTOBUY_SPAWN_RADIUS)
end
return false
end
local function IsInAutoCreditSpawnArea(player)
if not player then return false end
if IsInSpawnRoom and IsInSpawnRoom(player) then
medicSpawnAnchor = player:GetAbsOrigin()
return true
end
if GP_IsInSpawnRadiusArea(player, AUTOBUY_SPAWN_RADIUS) then
if not medicSpawnAnchor then
medicSpawnAnchor = player:GetAbsOrigin()
end
return true
end
if medicSpawnAnchor then
local pos = player:GetAbsOrigin()
return DistSqr(pos, medicSpawnAnchor) <= (AUTOBUY_SPAWN_RADIUS * AUTOBUY_SPAWN_RADIUS)
end
return false
end
local function GP_OnThresholdReached(me, currentTime, inZone, pauseAutoWalk)
if thresholdNotificationShown then return true end
thresholdNotificationShown = true
medicThresholdReached = true
gpPhase = "SNIPER_BUY"
AddNotification("Money threshold ($" .. tostring(config.moneyThreshold) .. ") reached!", "warning")
if GP_F4_IsFeatureEnabled and GP_F4_IsFeatureEnabled() and GP_F4_IsPreWave1State and GP_F4_IsPreWave1State() then
gpF4RequireTpForReady = false
gpF4PendingRejoinCycle = false
GP_F4_Sync("threshold_reached", true)
end
shouldGuidePlayerBuy = false
buyMidpoint = nil
if pauseAutoWalk then
autoWalkPaused = true
autoWalkPauseReason = "threshold"
autoModeWalkActive = false
end
if config.changeClassEnabled and (not hasTriedClassChange) then
pendingClassChange = true
classChangeUsePreWaveRules = false
if GP_HasExplicitPreWave1Proof and GP_HasExplicitPreWave1Proof() then
classChangeUsePreWaveRules = true
end
classChangeSwapPopupShown = false
classChangeDidRefund = false
classChangeRefundTime = 0
classChangeDidCleanup = false
classChangeCleanupTime = 0
classChangeReadyTime = (currentTime or 0) + THRESHOLD_CLASSCHANGE_DELAY
AddNotification(inZone and "Threshold reached in station - preparing swap" or "Preparing class change", "info")
end
return true
end
local pendingAutoWalkEnableAlerts = false
local pendingAutoWalkEnableUntil = 0
local AUTO_WALK_ALERT_WINDOW = 3.0
local lastToggleTime = 0
local suppressToggleUntil = 0
local TOGGLE_COOLDOWN = 0.2
local WALK_KEY = KEY_L
local CLEAN_KEY = KEY_K
local AUTO_KEY = KEY_J
local TP_KEY = KEY_O
ALL_OFF_KEY = KEY_X
ALL_OFF_RESTORE_WINDOW = 60.0
allOffRestoreSnapshot = nil
allOffRestoreUntil = 0
local TELEPORTER_AUTOWALK_DELAY = 1.0
local TP_TELE_STOP_DISTANCE = 67
local TP_TELE_WAIT_STOP_DISTANCE = 67
local TP_ENDPOINT_TELE_RADIUS = 650
local TP_TELE_USE_VERIFY_SECONDS = 10.0
local TP_TELE_USE_SUCCESS_DISTANCE = 180
local TP_TELE_VERIFY_TARGET_LEAVE_DISTANCE = 120
local tpLastReachedTeleporterAt = 0
local teleporterConfig = {
scanEnabled = true,
maxScanDistance = 10000,
showOnlyFriendly = true,
autoWalkEnabled = false,
walkSpeed = 450
}
reloadMoveLock = true
tpReloadMoveLockArmedAt = (globals and globals.CurTime and globals.CurTime()) or 0
tpToggleSpawnLockArmedAt = 0
tpWaitForRoundReloadArmedAt = 0
TP_LOCK_FAILSAFE_SECONDS = TP_LOCK_FAILSAFE_SECONDS or 6.0
TP_WAITROUND_REARM_FAILSAFE_SECONDS = TP_WAITROUND_REARM_FAILSAFE_SECONDS or 12.0
function GP_ArmReloadMoveLock()
reloadMoveLock = true
tpReloadMoveLockArmedAt = (globals and globals.CurTime and globals.CurTime()) or 0
gpSpawnAreaAnchors = {}
gpSpawnAreaAnchorsMap = ""
gpSpawnAreaNextRescan = 0
gpSpawnSignAnchor = nil
gpSpawnSignAnchorMap = ""
gpSpawnSignNextScan = 0
shouldGuidePlayer = false
midpoint = nil
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
teleporterConfig.autoWalkEnabled = false
end
local function GP_IsReloadMoveUnlocked(me)
if not me or not me.IsAlive or (not me:IsAlive()) then
return false
end
if not reloadMoveLock then
tpReloadMoveLockArmedAt = 0
return true
end
local now = (globals and globals.CurTime and globals.CurTime()) or 0
if (tpReloadMoveLockArmedAt or 0) <= 0 then
tpReloadMoveLockArmedAt = now
end
local inSpawn = false
if IsInSpawnRoom then
local okSpawn, vSpawn = pcall(IsInSpawnRoom, me)
inSpawn = (okSpawn and vSpawn == true)
end
local inZone = false
if me.GetPropInt then
local okZone, vZone = pcall(me.GetPropInt, me, "m_bInUpgradeZone")
inZone = (okZone and vZone == 1)
end
local inSpawnRadius = false
local okRadius, vRadius = pcall(GP_IsInSpawnRadiusArea, me, RELOAD_SPAWN_RADIUS)
inSpawnRadius = (okRadius and vRadius == true)
if inSpawn or inZone or inSpawnRadius then
reloadMoveLock = false
tpReloadMoveLockArmedAt = 0
return true
end
if (now - (tpReloadMoveLockArmedAt or now)) >= (TP_LOCK_FAILSAFE_SECONDS or 6.0) then
reloadMoveLock = false
tpReloadMoveLockArmedAt = 0
return true
end
return false
end
function GP_TP_IsSpawnContextNow(me)
if not me then return false end
local inSpawn = false
if IsInSpawnRoom then
local okSpawn, vSpawn = pcall(IsInSpawnRoom, me)
inSpawn = (okSpawn and vSpawn == true)
end
local inZone = false
if me.GetPropInt then
local okZone, vZone = pcall(me.GetPropInt, me, "m_bInUpgradeZone")
inZone = (okZone and vZone == 1)
end
local inSpawnRadius = false
local okRadius, vRadius = pcall(GP_IsInSpawnRadiusArea, me, RELOAD_SPAWN_RADIUS)
inSpawnRadius = (okRadius and vRadius == true)
return (inSpawn or inZone or inSpawnRadius)
end
function GP_TP_ArmSpawnToggleLock()
tpToggleSpawnLock = true
tpToggleSpawnLockArmedAt = (globals and globals.CurTime and globals.CurTime()) or 0
teleporterConfig.autoWalkEnabled = false
end
function GP_TP_IsToggleSpawnUnlocked(me)
if not tpToggleSpawnLock then
tpToggleSpawnLockArmedAt = 0
return true
end
local now = (globals and globals.CurTime and globals.CurTime()) or 0
if (tpToggleSpawnLockArmedAt or 0) <= 0 then
tpToggleSpawnLockArmedAt = now
end
if GP_TP_IsSpawnContextNow(me) then
tpToggleSpawnLock = false
tpToggleSpawnLockArmedAt = 0
return true
end
local alive = false
if me and me.IsAlive then
local okAlive, vAlive = pcall(me.IsAlive, me)
alive = (okAlive and vAlive == true)
end
if alive and (now - (tpToggleSpawnLockArmedAt or now)) >= (TP_LOCK_FAILSAFE_SECONDS or 6.0) then
tpToggleSpawnLock = false
tpToggleSpawnLockArmedAt = 0
return true
end
return false
end
local hasScannedTeleporter = false
local foundTeleporters = {}
local tpPathSelected = false
local tpCurrentPathIndex = nil
local tpCurrentPathWaypointIndex = 1
local tpUsingPredefinedPath = false
local tpLOSDetectedTime = 0
local tpLOSDelay = 1.0
local teleporterManuallyDisabled = false
local teleporterScanInterval = 0.20
local nextTeleporterScanTime = 0
local lastTpClassWarnTime = 0
local mapPaths = {
["maps/mvm_mannhattan.bsp"] = {
{
{x = 246.57, y = 2350.02, z = -159.97},
{x = 426.71, y = 2343.59, z = -159.97},
{x = 465.11, y = 2201.82, z = -159.97},
{x = 465.23, y = 2199.62, z = -159.97},
{x = 465.34, y = 2197.45, z = -159.97},
{x = 462.59, y = 2047.58, z = -159.97},
{x = 282.40, y = 2033.19, z = -147.94},
{x = 279.63, y = 2033.27, z = -147.94},
{x = 128.87, y = 2038.56, z = -159.97},
{x = 127.16, y = 2038.62, z = -159.97},
{x = -12.44, y = 1890.93, z = -159.97}
},
{
{x = -337.60, y = 2379.35, z = -159.97},
{x = -510.33, y = 2372.52, z = -159.97},
{x = -519.99, y = 2208.79, z = -159.97},
{x = -519.95, y = 2207.23, z = -159.97},
{x = -519.90, y = 2205.39, z = -159.97},
{x = -513.53, y = 2039.08, z = -159.97},
{x = -340.88, y = 2030.59, z = -159.97},
{x = -134.46, y = 2018.24, z = -159.97},
{x = -132.56, y = 2018.22, z = -159.97},
{x = -130.88, y = 2018.20, z = -159.97},
{x = -15.76, y = 1814.91, z = -159.97}
}
},
["maps/mvm_rottenburg.bsp"] = {
{
{x = -1174.54, y = 2397.37, z = -127.97},
{x = -760.03, y = 2161.80, z = -127.97},
{x = -1127.16, y = 1730.38, z = -169.79},
{x = -1084.47, y = 1275.69, z = -170.00}
},
{
{x = -1507.05, y = 669.63, z = -167.97},
{x = -1530.55, y = 1126.37, z = -169.98},
{x = -1084.47, y = 1275.69, z = -170.00}
}
}
}
local KEY_NAME_MAP = {
a=KEY_A,b=KEY_B,c=KEY_C,d=KEY_D,e=KEY_E,f=KEY_F,g=KEY_G,h=KEY_H,i=KEY_I,j=KEY_J,
k=KEY_K,l=KEY_L,m=KEY_M,n=KEY_N,o=KEY_O,p=KEY_P,q=KEY_Q,r=KEY_R,s=KEY_S,t=KEY_T,
u=KEY_U,v=KEY_V,w=KEY_W,x=KEY_X,y=KEY_Y,z=KEY_Z,
space=KEY_SPACE, shift=KEY_LSHIFT, ctrl=KEY_LCONTROL, alt=KEY_LALT
}
local KEY_CODE_TO_NAME = {}
for name, code in pairs(KEY_NAME_MAP) do
if type(code) == "number" then
KEY_CODE_TO_NAME[code] = name
end
end
local function KeyLabel(code)
local name = KEY_CODE_TO_NAME[code]
if not name then
return tostring(code)
end
if name == "space" then return "SPACE" end
if name == "shift" then return "SHIFT" end
if name == "ctrl" then return "CTRL" end
if name == "alt" then return "ALT" end
return string.upper(name)
end
local function SaveConfig(filename, config)
local file = io.open(filename, "w")
if not file then return false end
for key, value in pairs(config) do
file:write(tostring(key) .. "=" .. tostring(value) .. "\n")
end
file:close()
return true
end
local function LoadConfig(filename)
local file = io.open(filename, "r")
if not file then return nil end
local config = {}
for line in file:lines() do
local key, value = line:match("^(.-)=(.+)$")
if key and value then
if value == "true" then value = true
elseif value == "false" then value = false
elseif tonumber(value) then value = tonumber(value)
end
config[key] = value
end
end
file:close()
return config
end
local loadedConfig = LoadConfig(GP_CfgPath())
local gpHadActiveTogglesOnLoad = false
if loadedConfig then
gpHadActiveTogglesOnLoad =
(loadedConfig.autoWalkEnabled == true)
or (loadedConfig.autoBuyEnabled == true)
or (loadedConfig.forceSniperBuyEnabled == true)
or (loadedConfig.tpWalkEnabled == true)
or (loadedConfig.forceTpWalkEnabled == true)
gpHadSniperBuyActiveOnLoad =
(loadedConfig.autoBuyEnabled == true)
gpSniperBuyLoadRearmPending = gpHadSniperBuyActiveOnLoad
for k, v in pairs(loadedConfig) do
config[k] = v
end
if type(config.walk_key)=="number" then WALK_KEY=config.walk_key end
if type(config.clean_key)=="number" then CLEAN_KEY=config.clean_key end
if type(config.auto_key)=="number" then AUTO_KEY=config.auto_key end
if type(config.tp_key)=="number" then TP_KEY=config.tp_key end
if type(config.all_off_key)=="number" then ALL_OFF_KEY=config.all_off_key end
tpForceModeEnabled = (config.forceTpWalkEnabled == true)
forceSniperBuyModeEnabled = (config.forceSniperBuyEnabled == true)
if tpForceModeEnabled then
config.tpWalkEnabled = false
tpStickyArmed = true
tpForceRestoreAwaitRespawn = true
tpRespawnRearmPending = false
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
end
if (not tpForceModeEnabled) and (config.tpWalkEnabled == true) then
tpReloadRestoreNormalPending = true
tpToggleNeedsTrigger = true
tpRespawnRearmPending = false
tpToggleSpawnLock = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
tpLastReachedTeleporterAt = 0
teleporterManuallyDisabled = false
end
end
if config.forceTpWalkEnabled == nil then config.forceTpWalkEnabled = false end
if tpForceModeEnabled == nil then tpForceModeEnabled = false end
if config.forceSniperBuyEnabled == nil then config.forceSniperBuyEnabled = false end
if forceSniperBuyModeEnabled == nil then forceSniperBuyModeEnabled = false end
if config.hideHotkeysInUI == nil then config.hideHotkeysInUI = false end
if config.hideInfoPopups == nil then config.hideInfoPopups = false end
if config.partyGpKillEnabled == nil then config.partyGpKillEnabled = false end
if config.partyGpLeaveEnabled == nil then config.partyGpLeaveEnabled = false end
if config.autoDisconnectEnabled == nil then config.autoDisconnectEnabled = false end
if config.tpWalkMoveLockEnabled == nil then config.tpWalkMoveLockEnabled = true end
if config.tpWalkWhitelistEnabled == nil then config.tpWalkWhitelistEnabled = false end
if config.firstJoinPickMedic == nil then config.firstJoinPickMedic = false end
if config.mvmReadyTpCycleEnabled == nil then config.mvmReadyTpCycleEnabled = true end
if config.instantRespawnEnabled == nil then config.instantRespawnEnabled = false end
if type(ALL_OFF_KEY) ~= "number" then ALL_OFF_KEY = KEY_X end
if type(config.all_off_key) ~= "number" then config.all_off_key = ALL_OFF_KEY end
if tpForceModeEnabled then
tpStickyArmed = true
end
gpStickyAutoBuyEnabled = (config.autoBuyEnabled == true)
gpStickyForceSniperBuyEnabled = (forceSniperBuyModeEnabled == true) or (config.forceSniperBuyEnabled == true)
local UI = {
mainFont = draw.CreateFont("Verdana", 16, 400),
colors = {
background = {15, 15, 15, 240},
accent = {65, 185, 255},
success = {50, 205, 50},
warning = {255, 165, 0},
error = {255, 64, 64},
text = {255, 255, 255},
textDim = {180, 180, 180}
},
notifications = {},
maxNotifications = 15,
notificationLifetime = 3,
notificationHeight = 28,
notificationSpacing = 2
}
local _gp_noTransparent = false
local function GP_UIAlpha(a)
a = a or 255
if _gp_noTransparent then
return a
end
if config.transparentEnabled then
return math.max(0, math.floor(a * 0.42))
end
return a
end
local function GP_GoldBarAlpha()
return config.transparentEnabled and 107 or 255
end
local _gp_uiTimeLast = 0
local _gp_uiTimeOffset = 0
local function GP_Time()
local raw = 0
if globals.RealTime then
local ok, t = pcall(globals.RealTime)
if ok and t then raw = t end
elseif globals.CurTime then
local ok, t = pcall(globals.CurTime)
if ok and t then raw = t end
end
if raw < _gp_uiTimeLast then
_gp_uiTimeOffset = _gp_uiTimeOffset + (_gp_uiTimeLast - raw)
end
_gp_uiTimeLast = raw
return raw + _gp_uiTimeOffset
end
local function ClampByte(v)
v = tonumber(v) or 0
if v ~= v then return 0 end
v = math.floor(v + 0.5)
if v < 0 then return 0 end
if v > 255 then return 255 end
return v
end
_GP_OrigDrawColor = draw.Color
local function UI_Color(r,g,b,a)
r = ClampByte(r)
g = ClampByte(g)
b = ClampByte(b)
a = ClampByte(GP_UIAlpha(a))
if a <= 0 then a = 1 end
__GP_LAST_COLOR[1], __GP_LAST_COLOR[2], __GP_LAST_COLOR[3], __GP_LAST_COLOR[4] = r, g, b, a
if type(_GP_OrigDrawColor) == "function" then
_GP_OrigDrawColor(r,g,b,a)
else
draw.Color(r,g,b,a)
end
end
local function GP_Color(r,g,b,a) UI_Color(r,g,b,a) end
local function CreateNotification(message, ntype, duration)
local colors = {
success = UI.colors.success,
warning = UI.colors.warning,
error = UI.colors.error,
info = UI.colors.accent
}
return {
message = message,
type = ntype or "info",
color = colors[ntype] or colors.info,
time = GP_Time(),
lifetime = duration,
alpha = 0,
targetAlpha = 255,
y = nil,
offsetY = 0,
slideY = 0
}
end
local function GP_Clamp(x, a, b)
if x < a then return a end
if x > b then return b end
return x
end
local function GP_EaseOutCubic(t)
t = GP_Clamp(t, 0, 1)
local u = 1 - t
return 1 - (u*u*u)
end
local function GP_EaseInCubic(t)
t = GP_Clamp(t, 0, 1)
return t*t*t
end
local function GP_FrameDT()
if globals and globals.FrameTime then
local ok, v = pcall(globals.FrameTime)
if ok and type(v) == "number" and v > 0 and v < 0.2 then return v end
end
return 1/60
end
local function GP_ShouldAllowNotification(message)
if not message or message == "" then return false end
message = tostring(message)
message = message:gsub("%s+$", "")
message = message:gsub("%.+$", "")
local messageLower = string.lower(message)
if string.find(messageLower, "hotkey set", 1, true) then return true end
if config and config.hideInfoPopups == true then
return false
end
if message == "Sequence already in progress!" then return false end
if message == "Sequence interrupted!" then return false end
if message == "Waiting before class change" then return false end
if message == "Preparing class change" then return false end
if message == "Moving out of upgrade zone" then return false end
if message == "Equip Vaccinator (secondary) first!" then return false end
if message == "SniperBuy: reached upgrade station" then return false end
if message == "SniperBuy: walking to upgrade station" then return false end
if message == "SniperBuy: buying Sniper upgrades" then return false end
if message == "Lost sight of upgrade station!" then return false end
if message == "Stopped guidance - reached zone or started exploit" then return false end
if string.find(message, "Found upgrade station at:", 1, true) then return false end
if string.find(message, "Transparent ", 1, true) then return true end
if string.find(message, "Auto Mode ", 1, true) then return true end
if string.find(message, "Auto Walk ", 1, true) then return true end
if string.find(message, "Auto Walk:", 1, true) then return true end
if string.find(message, "Started cleanup", 1, true) then return true end
if string.find(message, "Toggles restored", 1, true) then return true end
if string.find(message, "Force TpWalk ", 1, true) then return true end
if string.find(message, "TpWalk Enabled", 1, true) then return true end
if string.find(message, "Use Force TpWalk to bypass class restrictions", 1, true) then return true end
if string.find(message, "TpWalk Disabled", 1, true) then return true end
if string.find(message, "AutoCredit Enabled", 1, true) then return true end
if string.find(message, "AutoCredit only works before Wave 1 starts and with 600+ starting credits", 1, true) then return true end
if string.find(message, "Vaccinator not equipped for AutoCredit", 1, true) then return true end
if string.find(message, "Select Medic with Vaccinator for AutoCredit", 1, true) then
local suppress = false
local rt = 0
pcall(function()
if globals and globals.RealTime then
rt = globals.RealTime()
elseif globals and globals.CurTime then
rt = globals.CurTime()
end
end)
local lastMsg = tostring(_G.__gm_lastClassChangedPopupMsg or "")
local lastAt = tonumber(_G.__gm_lastClassChangedPopupAt or -9999) or -9999
if (rt - lastAt) < 12.0 and string.find(lastMsg, "Changed class to ", 1, true) then
suppress = true
end
if not suppress then
local lp = nil
pcall(function()
if entities and entities.GetLocalPlayer then
lp = entities.GetLocalPlayer()
end
end)
if lp then
local curClass = nil
pcall(function() curClass = GP_GetCurrentClassName(lp) end)
local t = config and config.targetClass or nil
if type(curClass) == "string" and type(t) == "string" then
local c = string.lower(curClass)
local tc = string.lower(t)
if tc ~= "" and tc ~= "off" and tc ~= "none" and tc ~= "medic" and c == tc then
suppress = true
end
end
end
end
return (not suppress)
end
if string.find(message, "AutoCredit Disabled", 1, true) then return true end
if string.find(message, "Target class set to ", 1, true) then return true end
if string.find(message, "Auto class change disabled", 1, true) then return true end
if string.find(message, "Force SniperBuy ", 1, true) then return true end
if message == "Sniper upgrades completed!" then return true end
if string.find(message, "SniperBuy run complete", 1, true) then return true end
if string.find(message, "SniperBuy Enabled", 1, true) then return true end
if string.find(message, "SniperBuy Disabled", 1, true) then return true end
if string.find(message, "waiting till teleporter is placed", 1, true) then return true end
if string.find(message, "waiting for teleporter", 1, true) then return true end
if string.find(message, "Waiting for teleporter", 1, true) then return true end
if string.find(message, "searching for teleporter", 1, true) then return true end
if string.find(message, "still waiting for teleporter", 1, true) then return true end
if string.find(message, "Still waiting for teleporter", 1, true) then return true end
if string.find(message, "don't walk away", 1, true) then return true end
if string.find(message, "Don't walk away", 1, true) then return true end
if string.find(message, "pending re-arm", 1, true) then return true end
if string.find(message, "re-armed", 1, true) then return true end
if string.find(message, "detected stuck", 1, true) then return true end
if string.find(message, "Loaded GhostMoney by golden pan!", 1, true) then return true end
if string.find(message, "Detected active toggles - some states reset", 1, true) then return true end
if string.find(message, "Hide Info Pop ups Disabled", 1, true) then return true end
if string.find(message, "Hide Hotkeys in UI ", 1, true) then return true end
if string.find(message, "Party gp_kill command ", 1, true) then return true end
if string.find(message, "Party gp_leave command ", 1, true) then return true end
if string.find(message, "Auto Disconnect ", 1, true) then return true end
if string.find(message, "Party gp_leave received", 1, true) then return true end
if string.find(message, "Lock TpWalking ", 1, true) then return true end
if string.find(message, "TpWalk Whitelist ", 1, true) then return true end
if string.find(message, "First Join Medic ", 1, true) then return true end
if string.find(message, "First Join Medic:", 1, true) then return true end
if string.find(message, "Smart AutoF4 ", 1, true) then return true end
if string.find(message, "Instant Respawn ", 1, true) then return true end
if string.find(message, "Generating cash", 1, true) then return true end
if string.find(message, "Restart/Fail detected - Reset state", 1, true) then return true end
if string.find(message, "Map fail/restart detected - reset state", 1, true) then return true end
if isExploiting or (config and (config.autoWalkEnabled)) then
if string.find(message, "Started sequence", 1, true) then return true end
if string.find(message, "Generating cash", 1, true) then return true end
if string.find(message, "Money threshold", 1, true) then return true end
if string.find(message, "Changed class", 1, true) then return true end
if string.find(message, "Alert:", 1, true) then return true end
return false
end
return true
end
function AddNotification(message, ntype, duration)
if message == "SniperBuy Enabled" or message == "SniperBuy Enabled - Reset state" then
message = "SniperBuy Enabled - Reset state (Death/Respawn as Sniper activates it)"
if duration == nil then duration = 4.0 end
end
if type(message) == "string" then
message = message:gsub("%s+$", "")
message = message:gsub("%.+$", "")
end
do
local msg = tostring(message or "")
local isThresholdReachedPopup =
string.find(msg, "Money threshold ($", 1, true) and
string.find(msg, ") reached!", 1, true)
if isThresholdReachedPopup then
_G.__gm_moneyThresholdReachedPopupShownOnce = _G.__gm_moneyThresholdReachedPopupShownOnce or false
if _G.__gm_moneyThresholdReachedPopupShownOnce then
return
end
_G.__gm_moneyThresholdReachedPopupShownOnce = true
end
end
UI.notifications = UI.notifications or {}
if not GP_ShouldAllowNotification(message) then return end
table.insert(UI.notifications, 1, CreateNotification(message, ntype, duration))
if #UI.notifications > UI.maxNotifications then
table.remove(UI.notifications)
end
end
local function DrawRect(x, y, w, h, color)
local r, g, b, a = 255, 255, 255, 255
if type(color) == "table" then
r = tonumber(color[1]) or r
g = tonumber(color[2]) or g
b = tonumber(color[3]) or b
a = tonumber(color[4]) or a
end
local x1 = math.floor(x)
local y1 = math.floor(y)
local x2 = math.floor(x + w)
local y2 = math.floor(y + h)
UI_Color(r, g, b, a)
local ok = pcall(draw.FilledRect, x1, y1, x2, y2)
if not ok then
if _GP_OrigDrawColor then
local fr = ClampByte(r)
local fg = ClampByte(g)
local fb = ClampByte(b)
local fa = ClampByte(GP_UIAlpha(a))
if fa <= 0 then fa = 1 end
pcall(_GP_OrigDrawColor, fr, fg, fb, fa)
end
pcall(draw.FilledRect, x1, y1, x2, y2)
end
end
local function DrawNotification(notif, x, y)
if notif.alpha <= 1 then return end
draw.SetFont(UI.mainFont)
local messageWidth, messageHeight = draw.GetTextSize(notif.message)
local barW = 3
local pad = 10
local width = math.floor(barW + pad + messageWidth + pad)
local height = math.floor(UI.notificationHeight)
local age = GP_Time() - (notif.time or GP_Time())
local inDur = UI.notificationInDur or 0.22
local outDur = UI.notificationOutDur or 0.28
local life = tonumber(notif.lifetime) or UI.notificationLifetime
local minLife = (inDur + outDur + 0.05)
if life < minLife then life = minLife end
local progress = 1 - (age / life)
if progress < 0 then progress = 0 elseif progress > 1 then progress = 1 end
local alpha = math.floor((notif.alpha or 0) + 0.5)
local bgA = math.floor(178 * (alpha / 255) + 0.5)
if bgA < 1 then bgA = 1 end
DrawRect(
math.floor(x),
math.floor(y),
width,
height,
{0, 0, 0, bgA}
)
local gp = GP_UI and GP_UI.colors and GP_UI.colors.gold or {255, 215, 0, 255}
DrawRect(
math.floor(x),
math.floor(y),
barW,
height,
{gp[1], gp[2], gp[3], alpha}
)
UI_Color(UI.colors.text[1], UI.colors.text[2], UI.colors.text[3], alpha)
local textY = math.floor(y + (height - messageHeight) / 2)
SafeText(math.floor(x + barW + pad), textY, notif.message)
if progress > 0 then
DrawRect(
math.floor(x + 1),
math.floor(y + height - 2),
math.floor((width - 2) * progress),
2,
{gp[1], gp[2], gp[3], math.floor(alpha * 0.7)}
)
end
end
local function ResetRuntimeState(reason)
if reason ~= nil and reason ~= "" and reason ~= "SniperBuy Enabled - Reset state" then
AddNotification(reason, "info")
end
isExploiting = false
upgradeQueue = {}
isUpgradingSniper = false
sniperUpgradeCooldownUntil = 0
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
respawnExpected = false
sequenceEndTime = 0
nextUpgradeTime = 0
shouldGuidePlayer = false
thresholdNotificationShown = false
hasTriedClassChange = false
pendingClassChange = false
classChangeUsePreWaveRules = false
pendingRetry = false
classChangeDidRefund = false
classChangeRefundTime = 0
classChangeDidCleanup = false
classChangeCleanupTime = 0
classChangeReadyTime = 0
lastExploitTime = 0
lastCleanupTime = 0
cleanupFlashUntil = 0
suppressToggleUntil = 0
allOffRestoreSnapshot = nil
allOffRestoreUntil = 0
if misc then
misc.waitKey = false
misc.waitKeyArmed = false
misc.waitWhich = nil
misc.waitKeyStartFrame = 0
misc.acPrevInUpgradeZone = nil
misc.acWarnPrevClassName = nil
misc.acWarnPrevHasVacc = nil
misc.acWarnPrevClassSelected = nil
misc.instantRespawnWasAlive = false
misc.instantRespawnAlreadyRequested = false
misc.instantRespawnRetryAt = 0
misc.instantRespawnRetryDone = false
misc.instantRespawnRetryCount = 0
end
sniperHotkeyHoldDown = false
sniperHotkeyHoldStart = 0
sniperHotkeyHoldTriggered = false
sniperBlockShortToggleOnRelease = false
sniperIgnoreShortToggleUntil = 0
sniperSkipNextShortToggle = false
tpHotkeyHoldDown = false
tpHotkeyHoldStart = 0
tpHotkeyHoldTriggered = false
tpIgnoreShortToggleUntil = 0
tpSkipNextShortToggle = false
tpLastForceToggleAt = 0
medicTriggerDebounceUntil = 0
lastSniperTriggerTime = 0
autoWalkEnabled = config.autoWalkEnabled
autoWalkPaused = false
autoWalkPauseReason = nil
pendingAutoWalkEnableAlerts = false
pendingAutoWalkEnableUntil = 0
lastAutoWalkPauseReason = nil
lastToggleTime = 0
lastVaccWarning = false
startingSequenceShown = false
cashGenEntryCount = 0
medicThresholdReached = false
gpPhase = "MEDIC_FARM"
autobuyRunOnceDone = false
sniperUpgradesComplete = false
needToLeaveZone = false
leaveZoneStartPos = nil
leaveZoneTime = 0
pendingRetry = false
if GP_RST then
GP_RST.medicCycleHardResetPending = false
GP_RST.medicCycleHardResetSince = 0
GP_RST.medicCycleSwapLockUntil = 0
end
teleporterConfig.autoWalkEnabled = false
hasScannedTeleporter = false
foundTeleporters = {}
tpPathSelected = false
tpCurrentPathIndex = nil
tpCurrentPathWaypointIndex = 1
tpUsingPredefinedPath = false
tpLOSDetectedTime = 0
nextTeleporterScanTime = 0
tpNoTeleFallbackActive = false
tpTeleporterSeenCount = 0
tpFallbackWaitPopupShown = false
tpFallbackNextWaitNotify = 0
tpIsWaitingForTeleporter = false
tpWaitMoveWarnNext = 0
tpWaitMoveWarnCount = 0
tpStuckTargetId = nil
tpStuckLastProgressTime = 0
tpStuckLastDistance = nil
tpStuckKillCooldownUntil = 0
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
tpToggleSpawnLock = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
end
local function HardReset(reason)
local r = reason or "hard_reset"
local __acHardServerTransition = (r == "Loading/Disconnected - Reset state") or (r == "Joined game - Reset state") or (r == "New server/state detected")
if __acHardServerTransition then
acPostWaveSwapLatched = false
end
if __acHardServerTransition and misc then
misc.acWarnSeenNoMedic = false
misc.acWarnSeenNoVacc = false
misc.acWarnPrevClassName = nil
misc.acWarnPrevHasVacc = nil
misc.acWarnPrevClassSelected = nil
misc.acStartedOnce = false
end
if r == "SniperBuy Enabled - Reset state" then
sniperReloadAwaitRespawn = false
sniperReloadRespawnPending = false
sniperLastAliveState = nil
end
local serverIPNow = (engine and engine.GetServerIP and engine.GetServerIP()) or ""
if serverIPNow == "" then
serverIPNow = currentServer or ""
end
local stickyMismatch = (serverIPNow ~= "" and tpStickyServerIP ~= "" and serverIPNow ~= tpStickyServerIP)
local preserveTpSticky = tpStickyArmed
and ((r == "Loading/Disconnected - Reset state") or (r == "Joined game - Reset state") or (tpForceModeEnabled and r == "SniperBuy Enabled - Reset state"))
and (not stickyMismatch)
sniperUpgradesComplete = false
isUpgradingSniper = false
sniperUpgradeCooldownUntil = 0
autobuyRunOnceDone = false
autobuyDoneAnnounced = false
shouldGuidePlayerBuy = false
shouldGuidePlayer = false
sniperBuyWalkStartTime = 0
sniperBuyWalkKillCooldownUntil = 0
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
teleporterJustUsed = false
tpLastReachedTeleporterAt = 0
teleporterManuallyDisabled = false
teleporterConfig.autoWalkEnabled = false
hasScannedTeleporter = false
foundTeleporters = {}
tpPathSelected = false
tpCurrentPathIndex = nil
tpCurrentPathWaypointIndex = 1
tpUsingPredefinedPath = false
tpLOSDetectedTime = 0
nextTeleporterScanTime = 0
tpNoTeleFallbackActive = false
tpRespawnRearmPending = false
tpForceRestoreAwaitRespawn = false
tpToggleNeedsTrigger = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
tpLastAliveState = nil
tpFallbackNextWaitNotify = 0
tpStuckTargetId = nil
tpStuckLastProgressTime = 0
tpStuckLastDistance = nil
tpStuckKillCooldownUntil = 0
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
ResetRuntimeState(r)
if preserveTpSticky then
local keepSniperBuyPending = (config.autoBuyEnabled == true) and (not forceSniperBuyModeEnabled)
if keepSniperBuyPending then
sniperUpgradesComplete = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
autobuyRunOnceDone = false
autobuyDoneAnnounced = false
gpPhase = "SNIPER_BUY"
else
sniperUpgradesComplete = true
sniperUpgradeCompleted = true
sniperUpgradeCompletedTime = globals.CurTime() or 0
autobuyRunOnceDone = true
gpPhase = "DONE"
end
teleporterJustUsed = false
tpLastReachedTeleporterAt = 0
teleporterManuallyDisabled = false
GP_TP_ResetPathState()
else
tpStickyArmed = false
tpStickyServerIP = ""
if r == "New server/state detected" then
tpForceModeEnabled = false
config.forceTpWalkEnabled = false
SaveConfig(GP_CfgPath(), config)
end
end
GP_ArmReloadMoveLock()
if GP_RST_Reset then pcall(GP_RST_Reset, "hard_reset") end
end
local function GP_ClearFirstJoinPickMedicWindow()
gpFirstJoinPickMedicPending = false
gpFirstJoinPickMedicUntil = 0
end
local function GP_ArmFirstJoinPickMedicWindow()
gpFirstJoinPickMedicDone = false
local now = (globals and globals.CurTime and globals.CurTime()) or 0
if config and config.firstJoinPickMedic and config.autoWalkEnabled then
gpFirstJoinPickMedicPending = true
gpFirstJoinPickMedicUntil = now + 30.0
else
gpFirstJoinPickMedicPending = false
gpFirstJoinPickMedicUntil = 0
end
local ip = (engine and engine.GetServerIP and engine.GetServerIP()) or ""
if ip == "" then ip = currentServer or "" end
gpFirstJoinPickMedicServer = ip
end
local function CheckServerChange()
local serverIP = engine.GetServerIP() or ""
local me = entities.GetLocalPlayer()
local hasMe = (me ~= nil)
if hasMe then
if (config and config.autoBuyEnabled == true) then
gpStickyAutoBuyEnabled = true
elseif (config and config.autoBuyEnabled ~= true)
and (gpStickyAutoBuyEnabled == true)
and (not forceSniperBuyModeEnabled)
and (not (config and config.forceSniperBuyEnabled == true)) then
config.autoBuyEnabled = true
if GP_EnableSniperBuyRuntime then
GP_EnableSniperBuyRuntime(((GP_TP_IsTraversalActive and GP_TP_IsTraversalActive()) and true or false))
end
SaveConfig(GP_CfgPath(), config)
end
if (forceSniperBuyModeEnabled == true) or (config and config.forceSniperBuyEnabled == true) then
gpStickyForceSniperBuyEnabled = true
end
end
local keepAutoBuy = ((config and config.autoBuyEnabled == true) or (gpStickyAutoBuyEnabled == true))
local keepForceSniper = ((forceSniperBuyModeEnabled == true) or (config and config.forceSniperBuyEnabled == true) or (gpStickyForceSniperBuyEnabled == true))
if not hasMe then
if hadLocalPlayer then
hadLocalPlayer = false
currentServer = serverIP
HardReset("Loading/Disconnected - Reset state")
gpAutoDisconnectTriggered = false
GP_F4_OnDisconnectCycle("disconnect")
GP_ClearFirstJoinPickMedicWindow()
if keepForceSniper then
forceSniperBuyModeEnabled = true
config.forceSniperBuyEnabled = true
else
forceSniperBuyModeEnabled = false
config.forceSniperBuyEnabled = false
end
if keepAutoBuy then
config.autoBuyEnabled = true
end
gpStickyAutoBuyEnabled = (config.autoBuyEnabled == true)
gpStickyForceSniperBuyEnabled = (forceSniperBuyModeEnabled == true) or (config.forceSniperBuyEnabled == true)
SaveConfig(GP_CfgPath(), config)
end
return
end
if not hadLocalPlayer then
hadLocalPlayer = true
currentServer = serverIP
HardReset("Joined game - Reset state")
gpAutoDisconnectTriggered = false
if gpSuppressFirstJoinPickMedicOnAttach then
gpSuppressFirstJoinPickMedicOnAttach = false
GP_ClearFirstJoinPickMedicWindow()
gpFirstJoinPickMedicDone = true
else
GP_ArmFirstJoinPickMedicWindow()
end
GP_F4_OnJoinCycle("join")
if keepForceSniper then
forceSniperBuyModeEnabled = true
config.forceSniperBuyEnabled = true
else
forceSniperBuyModeEnabled = false
config.forceSniperBuyEnabled = false
end
if keepAutoBuy then
config.autoBuyEnabled = true
end
gpStickyAutoBuyEnabled = (config.autoBuyEnabled == true)
gpStickyForceSniperBuyEnabled = (forceSniperBuyModeEnabled == true) or (config.forceSniperBuyEnabled == true)
if config and (config.forceTpWalkEnabled == true) then
if GP_SetTpForceEnabled then
GP_SetTpForceEnabled(true, false)
else
tpForceModeEnabled = true
config.forceTpWalkEnabled = true
config.tpWalkEnabled = false
end
tpForceRestoreAwaitRespawn = true
tpRespawnRearmPending = false
teleporterConfig.autoWalkEnabled = false
teleporterManuallyDisabled = false
tpToggleSpawnLock = false
tpStickyArmed = true
end
if tpReloadRestoreNormalPending and config and (config.tpWalkEnabled == true) and (not tpForceModeEnabled) then
tpForceRestoreAwaitRespawn = false
tpToggleNeedsTrigger = true
tpRespawnRearmPending = false
tpToggleSpawnLock = false
tpStickyArmed = true
teleporterManuallyDisabled = false
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
tpLastAliveState = nil
if GP_TP_ResetPathState then GP_TP_ResetPathState() end
if GP_TP_ResetStuckTracker then GP_TP_ResetStuckTracker() end
local _lp = (entities and entities.GetLocalPlayer and entities.GetLocalPlayer()) or nil
local _cls = GP_GetCurrentClassName(_lp)
if _lp and _lp.IsAlive and (not _lp:IsAlive()) and _cls == "sniper" then
tpRespawnRearmPending = true
end
tpReloadRestoreNormalPending = false
end
if gpSniperBuyLoadRearmPending and (config and config.autoBuyEnabled and (not forceSniperBuyModeEnabled)) then
sniperReloadAwaitRespawn = true
sniperReloadRespawnPending = false
sniperLastAliveState = nil
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
isUpgradingSniper = false
upgradeQueue = {}
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
else
sniperReloadAwaitRespawn = false
sniperReloadRespawnPending = false
sniperLastAliveState = nil
end
gpSniperBuyLoadRearmPending = false
if config and (config.autoWalkEnabled == true) then
GP_SetAutoCreditEnabled(true, false)
end
do
local nowJoin = (globals and globals.CurTime and globals.CurTime()) or 0
if pendingRetryTargetClass and (pendingRetryTargetClass ~= "") and ((pendingRetryTargetUntil or 0) >= nowJoin) then
pendingRetry = true
else
pendingRetryTargetClass = nil
pendingRetryTargetUntil = 0
end
end
SaveConfig(GP_CfgPath(), config)
return
end
if currentServer ~= serverIP then
if (currentServer == nil or currentServer == "") and (serverIP ~= "") then
currentServer = serverIP
return
end
currentServer = serverIP
HardReset("New server/state detected")
gpAutoDisconnectTriggered = false
GP_F4_OnDisconnectCycle("new_server")
GP_ArmFirstJoinPickMedicWindow()
if keepForceSniper then
forceSniperBuyModeEnabled = true
config.forceSniperBuyEnabled = true
else
forceSniperBuyModeEnabled = false
config.forceSniperBuyEnabled = false
end
if keepAutoBuy then
config.autoBuyEnabled = true
end
gpStickyAutoBuyEnabled = (config.autoBuyEnabled == true)
gpStickyForceSniperBuyEnabled = (forceSniperBuyModeEnabled == true) or (config.forceSniperBuyEnabled == true)
SaveConfig(GP_CfgPath(), config)
return
end
end

local function IsGameInputAllowed()
return not engine.Con_IsVisible()
and not engine.IsGameUIVisible()
and not engine.IsChatOpen()
end
local function GP_ShouldSniperBuyArmImmediately()
local preWave = (GP_HasExplicitPreWave1Proof and GP_HasExplicitPreWave1Proof()) or false
if not preWave then return false end
return (config and config.autoWalkEnabled)
or thresholdNotificationShown
or pendingClassChange
or needToLeaveZone
end
local function IsUIInputAllowed()
return not engine.Con_IsVisible()
end
local gp_curRewindLastHandled = 0
local function GP_HandleCurTimeRewind(currentTime)
if type(currentTime) ~= "number" then return end
local prev = lastCurTime or currentTime
local delta = prev - currentTime
local rt = 0
pcall(function()
if globals and globals.RealTime then
rt = globals.RealTime()
elseif globals and globals.CurTime then
rt = globals.CurTime()
end
end)
local bigRewind = (delta > 0.50)
local mapLikeRewind = (prev > 20 and currentTime < 5 and delta > 0.05)
local lastHandled = gp_curRewindLastHandled or 0
local cooldownOk = ((rt - lastHandled) >= 2.0)
if (bigRewind or mapLikeRewind) and cooldownOk then
suppressToggleUntil = 0
lastToggleTime = 0
lastCleanupTime = 0
cleanupFlashUntil = 0
if misc then
misc.waitKey = false
misc.waitKeyArmed = false
misc.waitWhich = nil
misc.waitKeyStartFrame = 0
misc.instantRespawnWasAlive = false
misc.instantRespawnAlreadyRequested = false
misc.instantRespawnRetryAt = 0
misc.instantRespawnRetryDone = false
misc.instantRespawnRetryCount = 0
end
sniperHotkeyHoldDown = false
sniperHotkeyHoldStart = 0
sniperHotkeyHoldTriggered = false
sniperBlockShortToggleOnRelease = false
sniperIgnoreShortToggleUntil = 0
sniperSkipNextShortToggle = false
tpHotkeyHoldDown = false
tpHotkeyHoldStart = 0
tpHotkeyHoldTriggered = false
tpIgnoreShortToggleUntil = 0
tpSkipNextShortToggle = false
tpLastForceToggleAt = 0
if GP_RST_Reset then
pcall(GP_RST_Reset, "curtime_rewind")
end
gp_curRewindLastHandled = rt
end
lastCurTime = currentTime
end
local function IsMoneyThresholdReached()
local me = entities.GetLocalPlayer()
if not me then return false end
local currency = me:GetPropInt("m_nCurrency")
if not currency then return false end
return currency >= config.moneyThreshold
end
local function IsMvMWaveActive()
if not GP_IsMvM() then return false end
local roundState = GP_GetRoundState()
return roundState == 4
end
local function onStringCmd(cmd)
local command = cmd:Get()
local args = {}
for word in string.gmatch(command:lower(), "%S+") do
table.insert(args, word)
end
if args[1] == "gp_gm_cash" then
local threshold = tonumber(args[2])
if threshold then
if threshold > 0 then
config.moneyThreshold = threshold
SaveConfig(GP_CfgPath(), config)
if gpDropdown and gpDropdown.state ~= "cash" and gpDropdown.lastCashNotified ~= config.moneyThreshold then
gpDropdown.lastCashNotified = config.moneyThreshold
AddNotification("Money threshold set to $" .. tostring(config.moneyThreshold), "success")
end
AddNotification("Money threshold set to $" .. threshold, "success")
else
AddNotification("Threshold must be greater than 0", "error")
end
else
AddNotification("Invalid threshold value", "error")
end
cmd:Set("")
return false
elseif args[1] == "gp_gm_class" then
local validClasses = {
["scout"] = true,
["soldier"] = true,
["pyro"] = true,
["demoman"] = true,
["heavy"] = true,
["engineer"] = true,
["medic"] = true,
["sniper"] = true,
["spy"] = true
}
if args[2] == "off" then
config.changeClassEnabled = false
SaveConfig(GP_CfgPath(), config)
AddNotification("Auto class change disabled", "success")
elseif validClasses[args[2]] then
config.changeClassEnabled = true
config.targetClass = args[2]
SaveConfig(GP_CfgPath(), config)
AddNotification("Target class set to " .. tostring(args[2]) .. " after threshold", "success")
else
AddNotification("Invalid class name", "error")
end
cmd:Set("")
return false
end
end
callbacks.Register("SendStringCmd", "threshold_command", onStringCmd)
local function ComputeMove(userCmd, a, b)
local diff = (b - a)
if diff:Length() == 0 then return Vector3(0, 0, 0) end
local x = diff.x
local y = diff.y
local vSilent = Vector3(x, y, 0)
local ang = vSilent:Angles()
local cPitch, cYaw = userCmd:GetViewAngles()
local yaw = math.rad(ang.y - cYaw)
local pitch = math.rad(ang.x - cPitch)
local move = Vector3(math.cos(yaw) * 450, -math.sin(yaw) * 450, -math.cos(pitch) * 450)
return move
end
local function WalkTo(userCmd, me, destination)
if IsManualMoveInput() then return end
local myPos = me:GetAbsOrigin()
local result = ComputeMove(userCmd, myPos, destination)
userCmd:SetForwardMove(result.x)
userCmd:SetSideMove(result.y)
end
function GP_TP_ResetPathState()
tpPathSelected = false
tpCurrentPathIndex = nil
tpCurrentPathWaypointIndex = 1
tpUsingPredefinedPath = false
tpLOSDetectedTime = 0
foundTeleporters = {}
hasScannedTeleporter = false
nextTeleporterScanTime = 0
tpNoTeleFallbackActive = false
tpTeleporterSeenCount = 0
tpFallbackWaitPopupShown = false
tpFallbackNextWaitNotify = 0
tpIsWaitingForTeleporter = false
tpWaitMoveWarnNext = 0
tpWaitMoveWarnCount = 0
tpStuckTargetId = nil
tpStuckLastProgressTime = 0
tpStuckLastDistance = nil
tpStuckKillCooldownUntil = 0
tpUseVerifyActive = false
tpUseVerifyStart = 0
tpUseVerifyAnchor = nil
tpUseVerifyTargetPos = nil
end
function GP_SetTpWalkEnabled(enabled, notify)
config.tpWalkEnabled = (enabled and true or false)
tpReloadRestoreNormalPending = false
if config.tpWalkEnabled then
if tpForceModeEnabled then
tpForceModeEnabled = false
config.forceTpWalkEnabled = false
end
teleporterManuallyDisabled = false
teleporterJustUsed = false
tpPathSelected = false
tpCurrentPathIndex = nil
tpCurrentPathWaypointIndex = 1
tpUsingPredefinedPath = false
tpLOSDetectedTime = 0
hasScannedTeleporter = false
foundTeleporters = {}
nextTeleporterScanTime = 0
tpRespawnRearmPending = false
tpStickyArmed = false
tpStickyServerIP = ""
tpToggleSpawnLock = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
tpToggleNeedsTrigger = true
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
teleporterConfig.autoWalkEnabled = false
local _lp = (entities and entities.GetLocalPlayer and entities.GetLocalPlayer()) or nil
local canArmImmediately = false
if _lp and _lp.IsAlive and _lp:IsAlive() then
local okSpawnCtx, inSpawnCtx = pcall(GP_TP_IsSpawnContextNow, _lp)
if okSpawnCtx and inSpawnCtx == true then
canArmImmediately = true
end
end
if _lp and _lp.IsAlive and (not _lp:IsAlive()) then
tpRespawnRearmPending = true
elseif canArmImmediately then
tpForceRestoreAwaitRespawn = false
tpRespawnRearmPending = false
tpToggleSpawnLock = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
sniperUpgradeCompleted = true
sniperUpgradeCompletedTime = (globals.CurTime() or 0) - (TELEPORTER_AUTOWALK_DELAY or 1.0)
teleporterManuallyDisabled = false
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
end
GP_TP_ResetPathState()
GP_TP_ResetStuckTracker()
else
teleporterManuallyDisabled = true
teleporterConfig.autoWalkEnabled = false
hasScannedTeleporter = false
foundTeleporters = {}
tpPathSelected = false
tpCurrentPathIndex = nil
tpCurrentPathWaypointIndex = 1
tpUsingPredefinedPath = false
tpLOSDetectedTime = 0
nextTeleporterScanTime = 0
tpStickyArmed = false
tpStickyServerIP = ""
tpRespawnRearmPending = false
tpToggleSpawnLock = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
tpFallbackNextWaitNotify = 0
tpToggleNeedsTrigger = false
GP_TP_ResetStuckTracker()
tpForceModeEnabled = false
config.forceTpWalkEnabled = false
end
SaveConfig(GP_CfgPath(), config)
if notify then
if config.tpWalkEnabled then
local _lp = (entities and entities.GetLocalPlayer and entities.GetLocalPlayer()) or nil
local _cls = GP_GetCurrentClassName(_lp)
if _cls ~= "sniper" then
AddNotification("Use Force TpWalk to bypass class restrictions", "info", 5.0)
end
AddNotification("TpWalk Enabled (Death/Respawn as Sniper or SniperBuy activates it)", "info", 4.0)
else
AddNotification("TpWalk Disabled", "info")
end
end
end
function GP_SetTpForceEnabled(enabled, notify)
local wantEnable = (enabled and true or false)
tpForceModeEnabled = wantEnable
config.forceTpWalkEnabled = tpForceModeEnabled
tpLastForceToggleAt = globals.CurTime() or 0
tpIgnoreShortToggleUntil = (globals.CurTime() or 0) + 1.20
tpSkipNextShortToggle = true
if tpForceModeEnabled then
config.tpWalkEnabled = false
tpToggleNeedsTrigger = false
teleporterManuallyDisabled = false
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
tpRespawnRearmPending = false
tpForceRestoreAwaitRespawn = true
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
sniperUpgradeCompleted = true
sniperUpgradeCompletedTime = globals.CurTime() or 0
tpStickyArmed = true
local ip = (engine and engine.GetServerIP and engine.GetServerIP()) or ""
if ip == "" then ip = currentServer or "" end
tpStickyServerIP = ip
GP_TP_ArmSpawnToggleLock()
GP_TP_ResetPathState()
GP_TP_ResetStuckTracker()
local _lp = (entities and entities.GetLocalPlayer and entities.GetLocalPlayer()) or nil
if _lp and _lp.IsAlive and (not _lp:IsAlive()) then
tpRespawnRearmPending = true
end
else
GP_SetTpWalkEnabled(false, false)
tpToggleNeedsTrigger = false
teleporterManuallyDisabled = true
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
GP_TP_StopUseVerify()
tpRespawnRearmPending = false
tpForceRestoreAwaitRespawn = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
tpToggleSpawnLock = false
tpStickyArmed = false
tpStickyServerIP = ""
config.tpWalkEnabled = false
config.forceTpWalkEnabled = false
tpForceModeEnabled = false
if not sniperUpgradesComplete then
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
end
GP_TP_ResetPathState()
GP_TP_ResetStuckTracker()
end
SaveConfig(GP_CfgPath(), config)
if notify then
if tpForceModeEnabled then
AddNotification("Force TpWalk Enabled", "warning")
AddNotification("Force TpWalk waits for death/respawn (all classes)", "warning", 4.0)
else
AddNotification("Force TpWalk Disabled", "info")
end
end
return true
end
function GP_SetForceSniperBuyEnabled(enabled, notify)
local wantEnabled = (enabled and true or false)
if wantEnabled then
if config.autoBuyEnabled then
config.autoBuyEnabled = false
end
sniperReloadAwaitRespawn = false
sniperReloadRespawnPending = false
sniperLastAliveState = nil
end
forceSniperBuyModeEnabled = wantEnabled
config.forceSniperBuyEnabled = forceSniperBuyModeEnabled
if wantEnabled then
gpStickyAutoBuyEnabled = false
end
gpStickyForceSniperBuyEnabled = forceSniperBuyModeEnabled
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
if not wantEnabled then
sniperSkipNextShortToggle = true
sniperBlockShortToggleOnRelease = true
local now = (globals and globals.CurTime and globals.CurTime()) or 0
sniperIgnoreShortToggleUntil = now + 0.90
end
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
SaveConfig(GP_CfgPath(), config)
if notify then
if forceSniperBuyModeEnabled then
AddNotification("Force SniperBuy Enabled - station only (no autowalk)", "warning")
else
AddNotification("Force SniperBuy Disabled", "info")
end
end
return true
end
local function GP_TP_GetDistance(pos1, pos2)
local dx = (pos2.x - pos1.x)
local dy = (pos2.y - pos1.y)
local dz = (pos2.z - pos1.z)
return math.sqrt(dx*dx + dy*dy + dz*dz)
end
function GP_TP_StopUseVerify()
tpUseVerifyActive = false
tpUseVerifyStart = 0
tpUseVerifyAnchor = nil
tpUseVerifyTargetPos = nil
end
function GP_TP_StartUseVerify(me, telePos, now)
if not me then return end
local p = me:GetAbsOrigin()
if not p then return end
tpUseVerifyActive = true
tpUseVerifyStart = now or ((globals and globals.CurTime and globals.CurTime()) or 0)
tpUseVerifyAnchor = Vector3(p.x, p.y, p.z)
if telePos then
tpUseVerifyTargetPos = Vector3(telePos.x, telePos.y, telePos.z)
else
tpUseVerifyTargetPos = nil
end
end
function GP_TP_TickUseVerify(me, now)
if not tpUseVerifyActive then return end
local anyTpModeOn = ((tpForceModeEnabled == true) or ((config and config.tpWalkEnabled) == true))
if not anyTpModeOn then
GP_TP_StopUseVerify()
return
end
if not me or (not me:IsAlive()) then
GP_TP_StopUseVerify()
return
end
now = now or ((globals and globals.CurTime and globals.CurTime()) or 0)
if (tpUseVerifyKillCooldownUntil or 0) > now then
return
end
if not tpUseVerifyAnchor then
GP_TP_StopUseVerify()
return
end
local curPos = me:GetAbsOrigin()
if not curPos then
GP_TP_StopUseVerify()
return
end
local movedDist = GP_TP_GetDistance(curPos, tpUseVerifyAnchor)
if movedDist >= (TP_TELE_USE_SUCCESS_DISTANCE or 180) then
local farFromEntrance = true
if tpUseVerifyTargetPos then
local dTarget = GP_TP_GetDistance(curPos, tpUseVerifyTargetPos)
farFromEntrance = (dTarget >= (TP_TELE_VERIFY_TARGET_LEAVE_DISTANCE or 120))
end
if farFromEntrance then
GP_TP_StopUseVerify()
GP_F4_OnTpSuccess()
return
end
end
if (now - (tpUseVerifyStart or now)) >= (TP_TELE_USE_VERIFY_SECONDS or 10.0) then
GP_TP_StopUseVerify()
tpUseVerifyKillCooldownUntil = now + 4.0
AddNotification("TpWalk: teleporter not used in time - suiciding", "warning")
pcall(function()
if client and client.Command then
client.Command("kill", true)
end
end)
end
end
function GP_TP_ResetStuckTracker()
tpStuckTargetId = nil
tpStuckLastProgressTime = 0
tpStuckLastDistance = nil
end
function GP_TP_BuildTargetId(teleEntry)
if not teleEntry then return "none" end
local ent = teleEntry.entity
if ent and ent.GetIndex then
local ok, idx = pcall(function() return ent:GetIndex() end)
if ok and type(idx) == "number" then
return "e:" .. tostring(idx)
end
end
local p = teleEntry.pos
if p then
return string.format("p:%d:%d:%d", math.floor(p.x + 0.5), math.floor(p.y + 0.5), math.floor(p.z + 0.5))
end
return "unknown"
end
function GP_TP_CheckAndHandleStuck(me, teleEntry, dist, currentTime)
if not me or not teleEntry or type(dist) ~= "number" then
GP_TP_ResetStuckTracker()
return false
end
if (tpStuckKillCooldownUntil or 0) > currentTime then
return false
end
local targetId = GP_TP_BuildTargetId(teleEntry)
if targetId ~= tpStuckTargetId then
tpStuckTargetId = targetId
tpStuckLastProgressTime = currentTime
tpStuckLastDistance = dist
return false
end
local lastDist = tpStuckLastDistance
if type(lastDist) ~= "number" then
tpStuckLastDistance = dist
tpStuckLastProgressTime = currentTime
return false
end
if dist < (lastDist - 16) then
tpStuckLastDistance = dist
tpStuckLastProgressTime = currentTime
return false
end
if dist < lastDist then
tpStuckLastDistance = dist
end
if (currentTime - (tpStuckLastProgressTime or currentTime)) >= (TP_STUCK_TIMEOUT or 10.0) then
AddNotification("TpWalk: detected stuck - suiciding", "warning")
pcall(function()
if client and client.Command then
client.Command("kill", true)
end
end)
tpStuckKillCooldownUntil = currentTime + 4.0
GP_TP_ResetStuckTracker()
return true
end
return false
end
function GP_TP_CheckAndHandleWaypointStuck(me, waypointPos, currentTime, mapName, pathIndex, waypointIndex)
if not me or not waypointPos then
GP_TP_ResetStuckTracker()
return false
end
if (tpStuckKillCooldownUntil or 0) > currentTime then
return false
end
local myPos = me:GetAbsOrigin()
local dist = GP_TP_GetDistance(myPos, waypointPos)
local targetId = "wp:" .. tostring(mapName or "?") .. ":" .. tostring(pathIndex or 0) .. ":" .. tostring(waypointIndex or 0)
if targetId ~= tpStuckTargetId then
tpStuckTargetId = targetId
tpStuckLastProgressTime = currentTime
tpStuckLastDistance = dist
return false
end
local lastDist = tpStuckLastDistance
if type(lastDist) ~= "number" then
tpStuckLastDistance = dist
tpStuckLastProgressTime = currentTime
return false
end
if dist <= 120 then
tpStuckLastDistance = dist
tpStuckLastProgressTime = currentTime
return false
end
if dist < (lastDist - 12) then
tpStuckLastDistance = dist
tpStuckLastProgressTime = currentTime
return false
end
if dist < lastDist then
tpStuckLastDistance = dist
end
if (currentTime - (tpStuckLastProgressTime or currentTime)) >= (TP_STUCK_TIMEOUT or 10.0) then
AddNotification("TpWalk: path stuck at waypoint - suiciding", "warning")
pcall(function()
if client and client.Command then
client.Command("kill", true)
end
end)
tpStuckKillCooldownUntil = currentTime + 4.0
GP_TP_ResetStuckTracker()
return true
end
return false
end
local function GP_TP_NormalizeMapName(rawName)
local name = tostring(rawName or "")
if name == "" then return "" end
name = string.lower(name)
name = string.gsub(name, "\\", "/")
if string.find(name, "mvm_mannhattan", 1, true) or string.find(name, "mvm_manhattan", 1, true) then
return "maps/mvm_mannhattan.bsp"
end
if string.find(name, "mvm_rottenburg", 1, true) then
return "maps/mvm_rottenburg.bsp"
end
if not string.find(name, "/", 1, true) then
name = "maps/" .. name
end
if not string.find(name, ".bsp", 1, true) then
name = name .. ".bsp"
end
return name
end
local function GP_TP_GetCurrentMap()
local raw = ""
if engine and engine.GetMapName then
raw = engine.GetMapName() or ""
end
return GP_TP_NormalizeMapName(raw)
end
local function GP_TP_ChooseBestPath(playerPos, mapName)
local paths = mapPaths[mapName]
if not paths then return nil end
local closestPathIndex = nil
local closestDistance = math.huge
for i, path in ipairs(paths) do
local first = path[1]
if first then
local firstWaypoint = Vector3(first.x, first.y, first.z)
local distance = GP_TP_GetDistance(playerPos, firstWaypoint)
if distance < closestDistance then
closestDistance = distance
closestPathIndex = i
end
end
end
return closestPathIndex
end
local function GP_TP_GetCurrentPathWaypoint()
if not tpCurrentPathIndex then return nil end
local mapName = GP_TP_GetCurrentMap()
local paths = mapPaths[mapName]
if not paths or not paths[tpCurrentPathIndex] then return nil end
local path = paths[tpCurrentPathIndex]
if tpCurrentPathWaypointIndex > #path then return nil end
local wp = path[tpCurrentPathWaypointIndex]
if not wp then return nil end
return Vector3(wp.x, wp.y, wp.z)
end
local function GP_TP_HasLineOfSight(fromPos, toPos)
if not (engine and engine.TraceLine) then return false end
local startPos = fromPos + Vector3(0, 0, 64)
local endPos = toPos + Vector3(0, 0, 32)
local ok, trace = pcall(engine.TraceLine, startPos, endPos, MASK_SHOT_HULL)
if not ok or not trace then return false end
local frac = trace.fraction or trace.Fraction
if type(frac) ~= "number" then return false end
return frac >= 0.98
end
local function GP_TP_ComputeMove(userCmd, fromPos, toPos)
local diff = toPos - fromPos
if diff:Length() == 0 then return 0, 0 end
local ang = Vector3(diff.x, diff.y, 0):Angles()
local _, cYaw, _ = userCmd:GetViewAngles()
local yaw = math.rad(ang.y - cYaw)
local forwardMove = math.cos(yaw) * teleporterConfig.walkSpeed
local sideMove = -math.sin(yaw) * teleporterConfig.walkSpeed
return forwardMove, sideMove
end
local function GP_TP_WalkToTeleporter(userCmd, me, targetPos)
if (not sniperUpgradeCompleted) and (not tpForceModeEnabled) then return end
local lockConfigured = (config and config.tpWalkMoveLockEnabled == true)
local manualInput = IsManualMoveInput()
if (not lockConfigured) and manualInput then
return
end
if lockConfigured and manualInput then
GP_TP_ApplyMovementLock(userCmd)
end
local myPos = me:GetAbsOrigin()
local mapName = GP_TP_GetCurrentMap()
local hasPredefinedPaths = mapPaths[mapName] ~= nil
local hasLOS = GP_TP_HasLineOfSight(myPos, targetPos)
local currentTime = globals.CurTime()
if hasLOS and tpUsingPredefinedPath then
if tpLOSDetectedTime == 0 then
tpLOSDetectedTime = currentTime
end
if currentTime - tpLOSDetectedTime >= tpLOSDelay then
tpUsingPredefinedPath = false
tpLOSDetectedTime = 0
end
elseif not hasLOS then
tpLOSDetectedTime = 0
end
if hasPredefinedPaths and (not tpPathSelected) and (not hasLOS) then
tpCurrentPathIndex = GP_TP_ChooseBestPath(myPos, mapName)
if tpCurrentPathIndex then
tpCurrentPathWaypointIndex = 1
tpUsingPredefinedPath = true
tpPathSelected = true
end
elseif (not hasPredefinedPaths) and (not tpPathSelected) then
tpPathSelected = true
elseif hasLOS and (not tpPathSelected) then
tpPathSelected = true
end
if tpUsingPredefinedPath and (not hasLOS) then
local pathWaypoint = GP_TP_GetCurrentPathWaypoint()
if pathWaypoint then
local waypointDistance = GP_TP_GetDistance(myPos, pathWaypoint)
if waypointDistance < 100 then
tpCurrentPathWaypointIndex = tpCurrentPathWaypointIndex + 1
local nextWaypoint = GP_TP_GetCurrentPathWaypoint()
if nextWaypoint then
pathWaypoint = nextWaypoint
else
tpUsingPredefinedPath = false
end
end
if tpUsingPredefinedPath and pathWaypoint then
if GP_TP_CheckAndHandleWaypointStuck(me, pathWaypoint, currentTime, mapName, tpCurrentPathIndex, tpCurrentPathWaypointIndex) then
return
end
local fm, sm = GP_TP_ComputeMove(userCmd, myPos, pathWaypoint)
userCmd:SetForwardMove(fm)
userCmd:SetSideMove(sm)
return
end
end
end
local fm, sm = GP_TP_ComputeMove(userCmd, myPos, targetPos)
userCmd:SetForwardMove(fm)
userCmd:SetSideMove(sm)
end
function GP_TP_HandleWaitingPopups(userCmd)
tpIsWaitingForTeleporter = true
local now = globals.CurTime() or 0
if not tpFallbackWaitPopupShown then
AddNotification("Waiting for teleporter - don't walk away", "warning")
tpFallbackWaitPopupShown = true
tpFallbackNextWaitNotify = now + (TP_WAIT_NOTIFY_INTERVAL or 7.0)
end
if GP_TP_IsMoveLockActive() then
GP_TP_ApplyMovementLock(userCmd)
tpWaitMoveWarnNext = 0
tpWaitMoveWarnCount = 0
else
if GP_IsTextInputOpen() then
tpWaitMoveWarnNext = 0
elseif GP_HasMoveIntent(userCmd) then
if now >= (tpWaitMoveWarnNext or 0) then
tpWaitMoveWarnCount = (tpWaitMoveWarnCount or 0) + 1
if (tpWaitMoveWarnCount % 2) == 0 then
AddNotification("Don't walk away - still waiting for teleporter", "warning")
end
tpWaitMoveWarnNext = now + 0.85
end
else
tpWaitMoveWarnNext = 0
tpWaitMoveWarnCount = 0
end
end
if now >= (tpFallbackNextWaitNotify or 0) then
AddNotification("Still waiting for teleporter", "info")
tpFallbackNextWaitNotify = now + (TP_WAIT_NOTIFY_INTERVAL or 7.0)
end
end
function GP_TP_WalkFallbackPath(userCmd, me)
if not me then return false end
local lockConfigured = (config and config.tpWalkMoveLockEnabled == true)
local manualInput = IsManualMoveInput()
if (not lockConfigured) and manualInput then
return true
end
if lockConfigured and manualInput then
GP_TP_ApplyMovementLock(userCmd)
end
local myPos = me:GetAbsOrigin()
local mapName = GP_TP_GetCurrentMap()
local paths = mapPaths[mapName]
if not paths then
GP_TP_ResetStuckTracker()
GP_TP_HandleWaitingPopups(userCmd)
return true
end
if (not tpPathSelected) or (not tpCurrentPathIndex) then
tpCurrentPathIndex = GP_TP_ChooseBestPath(myPos, mapName)
tpCurrentPathWaypointIndex = 1
tpUsingPredefinedPath = (tpCurrentPathIndex ~= nil)
tpPathSelected = true
end
if not tpCurrentPathIndex then
GP_TP_ResetStuckTracker()
GP_TP_HandleWaitingPopups(userCmd)
return true
end
local pathWaypoint = GP_TP_GetCurrentPathWaypoint()
if not pathWaypoint then
GP_TP_ResetStuckTracker()
GP_TP_HandleWaitingPopups(userCmd)
return true
end
local waypointDistance = GP_TP_GetDistance(myPos, pathWaypoint)
if waypointDistance < 100 then
tpCurrentPathWaypointIndex = tpCurrentPathWaypointIndex + 1
local nextWaypoint = GP_TP_GetCurrentPathWaypoint()
if nextWaypoint then
pathWaypoint = nextWaypoint
else
GP_TP_ResetStuckTracker()
GP_TP_HandleWaitingPopups(userCmd)
return true
end
end
tpIsWaitingForTeleporter = false
tpWaitMoveWarnNext = 0
tpWaitMoveWarnCount = 0
tpFallbackWaitPopupShown = false
tpFallbackNextWaitNotify = 0
local now = globals.CurTime() or 0
if GP_TP_CheckAndHandleWaypointStuck(me, pathWaypoint, now, mapName, tpCurrentPathIndex, tpCurrentPathWaypointIndex) then
return true
end
local fm, sm = GP_TP_ComputeMove(userCmd, myPos, pathWaypoint)
userCmd:SetForwardMove(fm)
userCmd:SetSideMove(sm)
return true
end
local function GP_TP_IsUsableTeleporter(entity)
if not entity or not entity.GetPropInt then return true end
local function P(name)
local ok, v = pcall(function() return entity:GetPropInt(name) end)
if ok and type(v) == "number" then return v end
return nil
end
local placing = P("m_bPlacing")
if placing == 1 then return false end
local building = P("m_bBuilding")
if building == 1 then return false end
local carried = P("m_bCarried")
if carried == 1 then return false end
local disabled = P("m_bDisabled")
if disabled == 1 then return false end
local health = P("m_iHealth")
if type(health) == "number" and health <= 0 then return false end
local state = P("m_iState")
if type(state) == "number" and state <= 0 then
return false
end
return true
end

function GP_TP_GetBuilderForWhitelist(entity)
if not entity then return nil end
local okEnt, bEnt = pcall(function() return entity:GetPropEntity("m_hBuilder") end)
if okEnt and bEnt then return bEnt end
local okH, h = pcall(function() return entity:GetPropInt("m_hBuilder") end)
if okH and h and entities and entities.GetByHandle then
local okB, bByHandle = pcall(function() return entities.GetByHandle(h) end)
if okB and bByHandle then return bByHandle end
end
return nil
end

function GP_TP_GetPlayerPriorityAny(arg)
if not playerlist or not playerlist.GetPriority then return nil end
local ok, v = pcall(function() return playerlist.GetPriority(arg) end)
if ok then return v end
local ok2, v2 = pcall(function() return playerlist.GetPriority(playerlist, arg) end)
if ok2 then return v2 end
return nil
end

function GP_TP_IsBuilderWhitelisted(builder)
if not builder then return false end
local pri = GP_TP_GetPlayerPriorityAny(builder)
if type(pri) == "number" then return pri > 0 end
if type(pri) == "boolean" then return pri end
if type(pri) == "string" then
local s = string.lower(pri)
if s == "friend" or s == "high" or s == "true" or s == "1" or s == "2" then return true end
end
local okIdx, idx = pcall(function() return builder:GetIndex() end)
if okIdx and idx then
local priIdx = GP_TP_GetPlayerPriorityAny(idx)
if type(priIdx) == "number" then return priIdx > 0 end
if type(priIdx) == "boolean" then return priIdx end
end
return false
end

function GP_TP_TeleporterPassesWhitelist(entity)
if not (config and config.tpWalkWhitelistEnabled == true) then return true end
local builder = GP_TP_GetBuilderForWhitelist(entity)
if not builder then return false end
return GP_TP_IsBuilderWhitelisted(builder)
end

local function GP_TP_ScanForTeleporters(me)
if not me then return end
if not teleporterConfig.scanEnabled then return end

local myPos = me:GetAbsOrigin()
if not myPos then
foundTeleporters = {}
hasScannedTeleporter = true
return
end

local myTeam = (me.GetTeamNumber and me:GetTeamNumber()) or -1
local candidates = {}
local maxDist = teleporterConfig.maxScanDistance or 10000
local maxDist2 = maxDist * maxDist

local function consider(entity, className)
if not (entity and entity.GetAbsOrigin) then return end
local pos = entity:GetAbsOrigin()
if not pos then return end

local dx, dy, dz = pos.x - myPos.x, pos.y - myPos.y, pos.z - myPos.z
local d2 = dx * dx + dy * dy + dz * dz
if d2 > maxDist2 then return end

local mode = -1
if entity.GetPropInt then
local okMode, m = pcall(entity.GetPropInt, entity, "m_iObjectMode")
if okMode and type(m) == "number" then mode = m end
end

local team = (entity.GetTeamNumber and entity:GetTeamNumber()) or -1
if teleporterConfig.showOnlyFriendly and team ~= myTeam then return end

local isEntrance = (className == "CObjectTeleporterEntrance") or (mode == 0)
if not isEntrance then return end
if not GP_TP_IsUsableTeleporter(entity) then return end
if not GP_TP_TeleporterPassesWhitelist(entity) then return end

candidates[#candidates + 1] = {
entity = entity,
pos = pos,
distance2 = d2,
distance = math.sqrt(d2),
team = team,
mode = mode
}
end

local scannedByClass = false
if entities and entities.FindByClass then
local classNames = {
"CObjectTeleporterEntrance",
"CObjectTeleporter",
"CObjectTeleporterExit"
}
for ci = 1, #classNames do
local cls = classNames[ci]
local list = entities.FindByClass(cls)
if list and #list > 0 then
scannedByClass = true
for i = 1, #list do
consider(list[i], cls)
end
end
end
end

if (not scannedByClass) or (#candidates == 0) then
local highest = (entities.GetHighestEntityIndex and entities.GetHighestEntityIndex()) or 2048
for i = 0, highest do
local entity = entities.GetByIndex(i)
if entity and entity.GetClass and entity.GetAbsOrigin then
local class = entity:GetClass()
if class == "CObjectTeleporter" or class == "CObjectTeleporterEntrance" or class == "CObjectTeleporterExit" then
consider(entity, class)
end
end
end
end

table.sort(candidates, function(a, b)
return (a.distance2 or math.huge) < (b.distance2 or math.huge)
end)

foundTeleporters = candidates
hasScannedTeleporter = true
end
GP_OnSniperUpgradesComplete = function(reason)
sniperUpgradeCompleted = true
local nowComplete = (globals and globals.CurTime and globals.CurTime()) or 0
sniperUpgradeCompletedTime = nowComplete
teleporterJustUsed = false
tpLastReachedTeleporterAt = 0
teleporterConfig.autoWalkEnabled = false
teleporterManuallyDisabled = false
tpStickyArmed = true
local ip = (engine and engine.GetServerIP and engine.GetServerIP()) or ""
if ip == "" then ip = currentServer or "" end
tpStickyServerIP = ip
if (not tpForceModeEnabled) and (config and config.tpWalkEnabled) then
tpToggleNeedsTrigger = false
end
GP_TP_ResetPathState()
if config and config.tpWalkEnabled then
end
end
GP_CheckSniperUpgradeDone = function(queueLen)
if isUpgradingSniper and queueLen == 0 and not sniperUpgradeCompleted then
GP_OnSniperUpgradesComplete("queue_empty")
end
end
local gpUpgradeMidCache = nil
local gpUpgradeMidCacheUntil = 0
local gpUpgradeMidCacheMap = ""
local GP_UPGRADE_SCAN_INTERVAL = 0.5
local function FindUpgradeStations(me)
if not (me and me.GetAbsOrigin) then return nil end
local now = 0
if globals and globals.RealTime then
now = globals.RealTime()
elseif globals and globals.CurTime then
now = globals.CurTime()
end
local mapName = ""
if engine and engine.GetMapName then
mapName = engine.GetMapName() or ""
end
if (mapName == gpUpgradeMidCacheMap) and (now < (gpUpgradeMidCacheUntil or 0)) then
return gpUpgradeMidCache
end
local myPos = me:GetAbsOrigin()
if not myPos then return nil end
if not (entities and entities.GetByIndex and entities.GetHighestEntityIndex and models and models.GetModelName) then
return nil
end
local signPositions = {}
local highest = entities.GetHighestEntityIndex() or 2048
for i = 0, highest do
local entity = entities.GetByIndex(i)
if entity and entity.GetClass and entity.GetModel and entity.GetAbsOrigin then
if entity:GetClass() == "CDynamicProp" then
local modelName = models.GetModelName(entity:GetModel())
if modelName == "models/props_mvm/mvm_upgrade_sign.mdl" then
local pos = entity:GetAbsOrigin()
if pos then
local dx, dy, dz = pos.x - myPos.x, pos.y - myPos.y, pos.z - myPos.z
local d2 = dx*dx + dy*dy + dz*dz
if d2 < (5000 * 5000) then
signPositions[#signPositions + 1] = pos
end
end
end
end
end
end
local result = nil
if #signPositions >= 2 then
local nearestIdx = nil
local nearestD2 = math.huge
for i = 1, #signPositions do
local p = signPositions[i]
local dx, dy, dz = p.x - myPos.x, p.y - myPos.y, p.z - myPos.z
local d2 = dx*dx + dy*dy + dz*dz
if d2 < nearestD2 then
nearestD2 = d2
nearestIdx = i
end
end
if nearestIdx then
local pos1 = signPositions[nearestIdx]
local pos2 = nil
local pairD2 = math.huge
for i = 1, #signPositions do
if i ~= nearestIdx then
local p = signPositions[i]
local dx, dy, dz = p.x - pos1.x, p.y - pos1.y, p.z - pos1.z
local d2 = dx*dx + dy*dy + dz*dz
if d2 < pairD2 then
pairD2 = d2
pos2 = p
end
end
end
if pos2 then
result = Vector3(
(pos1.x + pos2.x) / 2,
(pos1.y + pos2.y) / 2,
(pos1.z + pos2.z) / 2
)
end
end
end
gpUpgradeMidCache = result
gpUpgradeMidCacheMap = mapName
gpUpgradeMidCacheUntil = now + GP_UPGRADE_SCAN_INTERVAL
return result
end
local function SendMvMUpgrade(itemslot, upgrade, count)
local kv = string.format([["MVM_Upgrade" { "Upgrade" { "itemslot" "%d" "Upgrade" "%s" "count" "%d" } }]],
itemslot, upgrade, count)
return engine.SendKeyValues(kv)
end
local function ForceCleanup()
autoWalkPaused = false
autoWalkPauseReason = nil
lastWavePauseWarning = false
engine.SendKeyValues('"MVM_UpgradesDone" { "num_upgrades" "0" }')
isExploiting = false
isUpgradingSniper = false
upgradeQueue = {}
respawnExpected = false
teleporterConfig.autoWalkEnabled = false
hasScannedTeleporter = false
foundTeleporters = {}
tpPathSelected = false
tpCurrentPathIndex = nil
tpCurrentPathWaypointIndex = 1
tpUsingPredefinedPath = false
tpLOSDetectedTime = 0
nextTeleporterScanTime = 0
end

function GP_TP_IsTraversalActive()
return ((teleporterConfig and teleporterConfig.autoWalkEnabled == true)
or (tpIsWaitingForTeleporter == true)
or (tpNoTeleFallbackActive == true)
or (tpUseVerifyActive == true))
end

function GP_DisableSniperBuyRuntime(preserveTpTraversal)
local preserve = (preserveTpTraversal == true)
pcall(function()
if engine and engine.SendKeyValues then
engine.SendKeyValues('"MVM_UpgradesDone" { "num_upgrades" "0" }')
end
end)
isExploiting = false
isUpgradingSniper = false
upgradeQueue = {}
respawnExpected = false
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
sniperBuyWalkStartTime = 0
sniperReloadAwaitRespawn = false
sniperReloadRespawnPending = false
sniperLastAliveState = nil
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
sniperUpgradeCooldownUntil = 0
sniperUpgradesComplete = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
autobuyRunOnceDone = false
autobuyDoneAnnounced = false
sniperBuyWalkStartTime = 0
sniperBuyWalkKillCooldownUntil = 0
if not preserve then
ForceCleanup()
end
end
local function ProcessExploitQueue()
local currentTime = globals.CurTime()
local qlen = upgradeQueue and #upgradeQueue or 0
GP_CheckSniperUpgradeDone(qlen)
if sequenceEndTime > 0 and currentTime < sequenceEndTime then return end
sequenceEndTime = 0
if #upgradeQueue == 0 then
if isExploiting then
engine.SendKeyValues('"MVM_UpgradesDone" { "num_upgrades" "0" }')
AddNotification("Sequence completed!", "success")
isExploiting = false
respawnExpected = true
shouldGuidePlayer = false
local endCooldown = SEQUENCE_END_COOLDOWN
if config and config.autoWalkEnabled then
endCooldown = 0
end
sequenceEndTime = currentTime + endCooldown
nextUpgradeTime = currentTime + endCooldown
upgradeQueue = {{type = "cleanup"}}
end
if isUpgradingSniper then
engine.SendKeyValues('"MVM_UpgradesDone" { "num_upgrades" "0" }')
AddNotification("Sniper upgrades completed!", "success")
isUpgradingSniper = false
sniperUpgradesComplete = true
GP_OnSniperUpgradesComplete("queue_done")
autobuyRunOnceDone = true
gpPhase = "DONE"
sniperUpgradeCooldownUntil = currentTime + SNIPER_COOLDOWN_TIME
sequenceEndTime = currentTime + SEQUENCE_END_COOLDOWN
nextUpgradeTime = currentTime + SEQUENCE_END_COOLDOWN
end
return
end
local currentAction = upgradeQueue[1]
if currentAction.type == "respec" then
respawnExpected = true
end
if currentTime < nextUpgradeTime then
return
end
local action = table.remove(upgradeQueue, 1)
if action.type == "cleanup" then
ForceCleanup()
return
end
local ok = true
if action.type == "begin" then
ok = engine.SendKeyValues('"MVM_UpgradesBegin" {}')
elseif action.type == "upgrade" then
ok = SendMvMUpgrade(action.slot, action.id, action.count)
elseif action.type == "respec" then
ok = engine.SendKeyValues('"MVM_Respec" {}')
elseif action.type == "end" then
ok = engine.SendKeyValues('"MVM_UpgradesDone" { "num_upgrades" "' .. action.count .. '" }')
end
if not ok then
if isUpgradingSniper then
action._retries = (action._retries or 0) + 1
if action._retries <= SNIPER_MAX_RETRIES then
table.insert(upgradeQueue, 1, action)
nextUpgradeTime = currentTime + SNIPER_RETRY_DELAY
return
else
AddNotification("SniperBuy: Sniper upgrades stalled - restarting sequence", "warning")
ForceCleanup()
sniperUpgradesComplete = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
teleporterJustUsed = false
tpLastReachedTeleporterAt = 0
teleporterManuallyDisabled = false
sniperUpgradeCooldownUntil = currentTime + 0.25
return
end
elseif isExploiting then
action._retries = (action._retries or 0) + 1
if action._retries <= MEDIC_MAX_RETRIES then
table.insert(upgradeQueue, 1, action)
nextUpgradeTime = currentTime
return
else
AddNotification("SniperBuy: Medic sequence stalled - forcing cleanup", "warning")
ForceCleanup()
return
end
end
end
nextUpgradeTime = currentTime + (isUpgradingSniper and SNIPER_UPGRADE_DELAY or UPGRADE_DELAY)
end
local function HasVaccinator(player)
if not player then return false end
local secondaryWeapon = player:GetEntityForLoadoutSlot(LOADOUT_POSITION_SECONDARY)
if not secondaryWeapon then return false end
local weaponId = secondaryWeapon:GetPropInt("m_iItemDefinitionIndex")
return weaponId == 998
end

local function GP_ResetSniperBuyProgressState()
isUpgradingSniper = false
upgradeQueue = {}
sniperUpgradesComplete = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
autobuyRunOnceDone = false
autobuyDoneAnnounced = false
sniperUpgradeCooldownUntil = 0
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
sniperBuyWalkStartTime = 0
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
end

function GP_EnableSniperBuyRuntime(preserveTpTraversal)
local preserve = (preserveTpTraversal == true)
if not preserve then
HardReset("SniperBuy Enabled - Reset state")
else
if teleporterConfig and teleporterConfig.autoWalkEnabled then
teleporterJustUsed = false
end
end
GP_ResetSniperBuyProgressState()
local me = nil
pcall(function()
if entities and entities.GetLocalPlayer then
me = entities.GetLocalPlayer()
end
end)
local aliveNow = nil
if me and me.IsAlive then
aliveNow = (me:IsAlive() == true)
end
sniperReloadAwaitRespawn = true
if aliveNow == nil then
sniperReloadRespawnPending = false
sniperLastAliveState = nil
elseif aliveNow then
sniperReloadRespawnPending = false
sniperLastAliveState = true
else
sniperReloadRespawnPending = true
sniperLastAliveState = false
end
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
end

function GP_SetAutoCreditEnabled(enabled, notify)
local wantEnable = (enabled and true or false)
local me = entities.GetLocalPlayer()
local wasEnabled = (config and config.autoWalkEnabled == true)
config.autoWalkEnabled = wantEnable
if wantEnable then
local rs = GP_GetRoundState()
local wave = GP_GetWaveNumber()
local preWave = ((GP_HasExplicitPreWave1Proof and GP_HasExplicitPreWave1Proof()) or false)
if not wasEnabled then
hasTriedClassChange = false
pendingClassChange = false
classChangeUsePreWaveRules = false
pendingRetry = false
pendingRetryTargetClass = nil
pendingRetryTargetUntil = 0
classChangeDidRefund = false
classChangeRefundTime = 0
classChangeDidCleanup = false
classChangeCleanupTime = 0
classChangeReadyTime = 0
needToLeaveZone = false
leaveZoneStartPos = nil
leaveZoneTime = 0
end
autoWalkPaused = false
autoWalkPauseReason = nil
shouldGuidePlayer = false
midpoint = nil
autoModeWalkActive = false
pendingAutoWalkEnableAlerts = false
pendingAutoWalkEnableUntil = 0
lastAutoWalkPauseReason = nil
if not preWave then
autoWalkPaused = true
autoWalkPauseReason = "after_wave1"
shouldGuidePlayer = false
midpoint = nil
pendingAutoWalkEnableAlerts = false
lastAutoWalkPauseReason = "after_wave1"
if notify then
AddNotification("AutoCredit only works before Wave 1 starts and with 600+ starting credits", "warning", 4.0)
end
else
local enableReason = nil
if me then
if not IsMedic(me) then
enableReason = "not_medic"
elseif not HasVaccinator(me) then
enableReason = "no_vacc"
end
lastAutoWalkPauseReason = enableReason
else
pendingAutoWalkEnableAlerts = true
pendingAutoWalkEnableUntil = (globals.CurTime() or 0) + AUTO_WALK_ALERT_WINDOW
lastAutoWalkPauseReason = nil
end
end
if notify then AddNotification("AutoCredit Enabled - Reset state", "info") end
else
autoWalkPaused = false
autoWalkPauseReason = nil
shouldGuidePlayer = false
midpoint = nil
lastAutoWalkPauseReason = nil
thresholdNotificationShown = false
medicThresholdReached = false
hasTriedClassChange = false
pendingClassChange = false
classChangeUsePreWaveRules = false
pendingRetry = false
pendingRetryTargetClass = nil
pendingRetryTargetUntil = 0
classChangeDidRefund = false
classChangeRefundTime = 0
classChangeDidCleanup = false
classChangeCleanupTime = 0
classChangeReadyTime = 0
needToLeaveZone = false
leaveZoneStartPos = nil
leaveZoneTime = 0
if notify then AddNotification("AutoCredit Disabled", "info") end
end
lastVaccWarning = false
lastWavePauseWarning = false
thresholdNotificationShown = false
SaveConfig(GP_CfgPath(), config)
return true
end
function GP_CaptureActiveToggleSnapshot()
return {
autoWalkEnabled = (config and config.autoWalkEnabled == true),
autoBuyEnabled = (config and config.autoBuyEnabled == true),
forceSniperBuyEnabled = (forceSniperBuyModeEnabled == true) or (config and config.forceSniperBuyEnabled == true),
tpWalkEnabled = (config and config.tpWalkEnabled == true),
forceTpWalkEnabled = (tpForceModeEnabled == true) or (config and config.forceTpWalkEnabled == true),
}
end
function GP_SnapshotHasAnyActive(snapshot)
if type(snapshot) ~= "table" then return false end
return (snapshot.autoWalkEnabled == true)
or (snapshot.autoBuyEnabled == true)
or (snapshot.forceSniperBuyEnabled == true)
or (snapshot.tpWalkEnabled == true)
or (snapshot.forceTpWalkEnabled == true)
end
function GP_DisableAllActiveToggles(notify)
local hadAny = false
if config.autoWalkEnabled then
hadAny = true
GP_SetAutoCreditEnabled(false, false)
end
if forceSniperBuyModeEnabled or config.forceSniperBuyEnabled then
hadAny = true
GP_SetForceSniperBuyEnabled(false, false)
end
if config.autoBuyEnabled or gpStickyAutoBuyEnabled then
hadAny = true
config.autoBuyEnabled = false
gpStickyAutoBuyEnabled = false
gpStickyForceSniperBuyEnabled = false
GP_DisableSniperBuyRuntime()
ForceCleanup()
end
if tpForceModeEnabled or config.forceTpWalkEnabled then
hadAny = true
GP_SetTpForceEnabled(false, false)
end
if config.tpWalkEnabled then
hadAny = true
GP_SetTpWalkEnabled(false, false)
end
sniperHotkeyHoldDown = false
sniperHotkeyHoldStart = 0
sniperHotkeyHoldTriggered = false
sniperBlockShortToggleOnRelease = false
sniperIgnoreShortToggleUntil = 0
sniperSkipNextShortToggle = false
tpHotkeyHoldDown = false
tpHotkeyHoldStart = 0
tpHotkeyHoldTriggered = false
tpIgnoreShortToggleUntil = 0
tpSkipNextShortToggle = false
SaveConfig(GP_CfgPath(), config)
if notify then
if hadAny then
AddNotification("All active toggles disabled", "info")
else
AddNotification("No active toggles to disable", "info")
end
end
return hadAny
end
function GP_RestoreActiveToggleSnapshot(snapshot, notify)
if type(snapshot) ~= "table" then
if notify then
AddNotification("No previous toggle state to restore", "info")
end
return false
end
local hadAny = GP_SnapshotHasAnyActive(snapshot)
GP_DisableAllActiveToggles(false)
if snapshot.autoWalkEnabled then
GP_SetAutoCreditEnabled(true, false)
end
if snapshot.forceSniperBuyEnabled then
GP_SetForceSniperBuyEnabled(true, false)
elseif snapshot.autoBuyEnabled then
if forceSniperBuyModeEnabled then
GP_SetForceSniperBuyEnabled(false, false)
end
config.autoBuyEnabled = true
GP_EnableSniperBuyRuntime(((GP_TP_IsTraversalActive and GP_TP_IsTraversalActive()) and true or false))
SaveConfig(GP_CfgPath(), config)
end
if snapshot.forceTpWalkEnabled then
GP_SetTpForceEnabled(true, false)
elseif snapshot.tpWalkEnabled then
GP_SetTpWalkEnabled(true, false)
end
if notify then
if hadAny then
AddNotification("Toggles restored", "success")
else
AddNotification("Previous state had no active toggles", "info")
end
end
return hadAny
end
local GP_IsSniper
function TriggerSniperUpgrades()
local currentTime = globals.CurTime()
if (currentTime - (lastSniperTriggerTime or 0)) < (SNIPER_TRIGGER_DEBOUNCE or 0.25) then
return
end
lastSniperTriggerTime = currentTime
if currentTime < sniperUpgradeCooldownUntil then ; return end
if (not isUpgradingSniper) and upgradeQueue and (#upgradeQueue > 0) and (not sniperUpgradesComplete) then
isUpgradingSniper = true
end
if isUpgradingSniper or sniperUpgradesComplete or (upgradeQueue and #upgradeQueue > 0) then
local qlen = (#upgradeQueue or 0)
local head = upgradeQueue and upgradeQueue[1]
return
end
if isExploiting then ; return end
local me = entities.GetLocalPlayer()
if not me or (not me:IsAlive()) then ; return end
if not (GP_IsSniper and GP_IsSniper(me)) then ; return end
if me:GetPropInt('m_bInUpgradeZone') ~= 1 then ; return end
isUpgradingSniper = true
sniperUpgradesComplete = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
teleporterJustUsed = false
tpLastReachedTeleporterAt = 0
teleporterConfig.autoWalkEnabled = false
teleporterManuallyDisabled = false
nextUpgradeTime = currentTime
upgradeQueue = {
{type = "begin"},
{type = "upgrade", slot = 0, id = "62", count = 10},
{type = "upgrade", slot = 0, id = "40", count = 10},
{type = "upgrade", slot = 0, id = "35.1", count = 10},
{type = "upgrade", slot = 0, id = "-0.9", count = 10},
{type = "upgrade", slot = 0, id = "17", count = 10},
{type = "upgrade", slot = 0, id = "12", count = 10},
{type = "upgrade", slot = 0, id = "59", count = 10},
{type = "end", count = 70}
}
nextUpgradeTime = currentTime + SNIPER_UPGRADE_DELAY
end
IsInSpawnRoom = function(player)
if not player then return false end
function tryGetInt(...)
local ok, v = pcall(player.GetPropInt, player, ...)
if not ok then return nil end
if type(v) == "number" then return v end
if type(v) == "boolean" then return v and 1 or 0 end
if type(v) == "string" then
local n = tonumber(v)
if n ~= nil then return n end
end
return nil
end
local v = tryGetInt('m_Shared.m_bInRespawnRoom')
if v ~= nil then return v == 1 end
v = tryGetInt('m_Shared', 'm_bInRespawnRoom')
if v ~= nil then return v == 1 end
v = tryGetInt('m_bInRespawnRoom')
if v ~= nil then return v == 1 end
v = tryGetInt('m_Shared.m_bInSpawnRoom')
if v ~= nil then return v == 1 end
v = tryGetInt('m_Shared', 'm_bInSpawnRoom')
if v ~= nil then return v == 1 end
return false
end
function TriggerMoneyExploit()
local currentTime = globals.CurTime()
if currentTime < (medicTriggerDebounceUntil or 0) then
return
end
medicTriggerDebounceUntil = currentTime + MEDIC_TRIGGER_DEBOUNCE
if isExploiting then
return
end
local exploitCooldown = COOLDOWN_TIME or 0.5
if config and config.autoWalkEnabled then
exploitCooldown = math.min(exploitCooldown, 0.05)
end
if currentTime - lastExploitTime < exploitCooldown then return end
if sequenceEndTime > 0 and currentTime < sequenceEndTime then return end
if IsMvMWaveActive() then
shouldGuidePlayer = false
if config.changeClassEnabled and not hasTriedClassChange and currentTime - lastRetryTime > RETRY_COOLDOWN then
local meRetry = entities.GetLocalPlayer()
local retryTarget = GP_GetPostWaveStationSwapTarget(meRetry)
if retryTarget and retryTarget ~= "" then
AddNotification("Wave active - Reconnecting to change class", "warning")
pendingRetry = true
pendingRetryTargetClass = retryTarget
pendingRetryTargetUntil = currentTime + 90.0
lastRetryTime = currentTime
hasTriedClassChange = true
client.Command("retry", true)
end
end
return
end
local gpMedicHardResetPendingNow = (GP_RST and GP_RST.medicCycleHardResetPending == true)
if IsMoneyThresholdReached() and (not gpMedicHardResetPendingNow) then
local me = entities.GetLocalPlayer()
local inZone = false
if me and me.GetPropInt then
inZone = (me:GetPropInt('m_bInUpgradeZone') == 1)
end
GP_OnThresholdReached(me, currentTime, inZone, false)
return
end
local me = entities.GetLocalPlayer()
if not me then
AddNotification("Local player not found!", "error")
return
end
if me:GetPropInt('m_bInUpgradeZone') ~= 1 then
AddNotification("Must be in upgrade zone!", "error")
return
end
if not me:IsAlive() then
AddNotification("Must be alive to use!", "error")
return
end
if not IsMedic(me) then
AddNotification("Must be Medic for this sequence!", "error")
return
end
if not HasVaccinator(me) then
AddNotification("Equip Vaccinator (secondary) first!", "error")
return
end
lastExploitTime = currentTime
isExploiting = true
if GP_RST then
GP_RST.medicCycleHardResetPending = false
GP_RST.medicCycleHardResetSince = 0
GP_RST.medicCycleSwapLockUntil = GP_RST_Now() + 12.0
end
if misc then misc.acStartedOnce = true end
startingSequenceShown = true
cashGenEntryCount = (cashGenEntryCount or 0) + 1
if cashGenEntryCount == 1 or (cashGenEntryCount % 4 == 0) then
AddNotification("Generating cash", "success")
end
upgradeQueue = {
{type = "begin"},
{type = "upgrade", slot = 1, id = 19, count = 2},
{type = "upgrade", slot = 1, id = 19, count = -2},
{type = "upgrade", slot = 1, id = 19, count = 2},
{type = "respec"},
{type = "end", count = 2}
}
nextUpgradeTime = currentTime + UPGRADE_DELAY
end
function __GM_PART2__()
local watermarkX = config.watermarkX
local watermarkY = config.watermarkY
local isDragging = false
local dragOffsetX, dragOffsetY = 0, 0
local uiClampSavedAt = 0
function ClampUIPos(screenW, screenH, boxW, boxH)
local x, y = watermarkX, watermarkY
if x < 0 then x = 0 end
if y < 0 then y = 0 end
if x + boxW > screenW then x = screenW - boxW end
if y + boxH > screenH then y = screenH - boxH end
if x < 0 then x = 0 end
if y < 0 then y = 0 end
local changed = (x ~= watermarkX) or (y ~= watermarkY)
watermarkX, watermarkY = x, y
return changed
end
local GP_UI = {
font = draw.CreateFont("Tahoma", 16, 600),
font2 = draw.CreateFont("Verdana", 15, 400),
colors = {
gold = {255, 215, 0, 255},
background = {15, 15, 15, 230},
text = {255, 255, 255, 255},
textDim = {180, 180, 180, 255},
barBg = {40, 35, 20, 255},
barFill = {255, 215, 0, 255}
}
}
GP_PICK_KEYS = GP_PICK_KEYS or {}
if #GP_PICK_KEYS == 0 then
local tmp = {}
for name, code in pairs(_G) do
if type(name) == "string" and type(code) == "number" and name:match("^KEY_") then
if not name:match("MOUSE") and not name:match("MWHEEL") and not name:match("BUTTON") and not name:match("LBUTTON") and not name:match("RBUTTON") and not name:match("MBUTTON") then
if not name:match("SHIFT") and not name:match("CONTROL") and not name:match("^KEY_LALT$") and not name:match("^KEY_RALT$") then
if name ~= "KEY_ESCAPE" then
tmp[#tmp + 1] = code
end
end
end
end
end
table.sort(tmp)
local last = nil
for i = 1, #tmp do
local c = tmp[i]
if c ~= last then
GP_PICK_KEYS[#GP_PICK_KEYS + 1] = c
last = c
end
end
end
__keyNameCache = __keyNameCache or {}
function GP_KeyName(code)
if type(code) ~= "number" then return "?" end
if __keyNameCache[code] then return __keyNameCache[code] end
for name, c in pairs(_G) do
if c == code and type(name) == "string" and name:match("^KEY_") then
local s = name:gsub("^KEY_", "")
__keyNameCache[code] = s
return s
end
end
__keyNameCache[code] = tostring(code)
return __keyNameCache[code]
end
local misc = {
want = false,
anim = 0.0,
open = false,
armed = false,
lastRDown = false,
openedAt = 0,
openFrame = 0,
debounceFrames = 0,
category = nil,
waitKey = false,
waitKeyArmed = false,
waitWhich = nil,
waitKeyStartFrame = 0,
keyPrev = {},
acWarnPrevClassName = nil,
acWarnPrevHasVacc = nil,
acWarnPrevClassSelected = nil,
acWarnSeenNoMedic = false,
acWarnSeenNoVacc = false,
acStartedOnce = false,
instantRespawnWasAlive = false,
instantRespawnAlreadyRequested = false,
instantRespawnSuspendUntil = 0,
instantRespawnHardLockUntil = 0,
instantRespawnRetryAt = 0,
instantRespawnRetryDone = false,
instantRespawnRetryCount = 0,
}
function GP_KeyPressedBind(code)
if type(code) ~= "number" then return false end
local down = input.IsButtonDown(code)
local was = misc.keyPrev[code] or false
misc.keyPrev[code] = down
return down and not was
end
function GP_TryCaptureHotkey()
if not misc.waitKey then return end
if not IsUIInputAllowed() then return end
if input.IsButtonDown(KEY_ESCAPE) then
misc.waitKey = false
misc.waitKeyArmed = false
misc.waitWhich = nil
misc.waitKeyStartFrame = 0
misc.keyPrev = {}
return
end
if not misc.waitKeyArmed then
local fc = globals.FrameCount() or 0
local startFc = misc.waitKeyStartFrame or 0
if startFc ~= 0 and (fc - startFc) > 6 then
if (not input.IsButtonDown(MOUSE_LEFT)) and (not input.IsButtonDown(MOUSE_RIGHT)) then
misc.waitKeyArmed = true
misc.keyPrev = {}
else
return
end
else
return
end
end
for i = 1, #GP_PICK_KEYS do
local k = GP_PICK_KEYS[i]
if GP_KeyPressedBind(k) then
if misc.waitWhich == "walk" then
WALK_KEY = k
config.walk_key = k
elseif misc.waitWhich == "clean" then
CLEAN_KEY = k
config.clean_key = k
elseif misc.waitWhich == "tp" then
TP_KEY = k
config.tp_key = k
elseif misc.waitWhich == "alloff" then
ALL_OFF_KEY = k
config.all_off_key = k
else
AUTO_KEY = k
config.auto_key = k
end
SaveConfig(GP_CfgPath(), config)
AddNotification("Hotkey set: " .. GP_KeyName(k), "info")
local _rt = (globals.CurTime and globals.CurTime()) or (globals.RealTime and globals.RealTime()) or 0
suppressToggleUntil = _rt + 0.35
lastToggleTime = _rt
misc.keyPrev = misc.keyPrev or {}
misc.keyPrev[k] = true
misc.waitKey = false
misc.waitKeyArmed = false
misc.waitWhich = nil
misc.waitKeyStartFrame = 0
misc.keyPrev = {}
break
end
end
end
local __hotkeyPrev = {}
function GP_KeyPressedHK(code)
if type(code) ~= "number" then return false end
local down = input.IsButtonDown(code)
local was = __hotkeyPrev[code] or false
__hotkeyPrev[code] = down
return down and not was
end

function GP_InstantRespawnNow()
local t = 0
pcall(function()
if globals and globals.RealTime then
t = globals.RealTime()
elseif globals and globals.CurTime then
t = globals.CurTime()
end
end)
if type(t) ~= "number" then t = 0 end
return t
end

function GP_InstantRespawnSendRequest()
local kv = [[ "MVM_Revive_Response" { "accepted" "1" } ]]
pcall(function()
if engine and engine.SendKeyValues then
engine.SendKeyValues(kv)
end
end)
end

function GP_InstantRespawnSuspend(seconds, reason)
if not misc then return end
local dur = tonumber(seconds) or 0
if dur <= 0 then return end
local now = GP_InstantRespawnNow()
local untilT = now + dur
if untilT > (misc.instantRespawnSuspendUntil or 0) then
misc.instantRespawnSuspendUntil = untilT
end
if untilT > (misc.instantRespawnHardLockUntil or 0) then
misc.instantRespawnHardLockUntil = untilT
end
misc.instantRespawnAlreadyRequested = false
misc.instantRespawnRetryAt = 0
misc.instantRespawnRetryDone = false
misc.instantRespawnRetryCount = 0
misc.instantRespawnWasAlive = false
end

function GP_HandleInstantRespawn(me)
if not (config and config.instantRespawnEnabled == true) then
if misc then
misc.instantRespawnWasAlive = false
misc.instantRespawnAlreadyRequested = false
misc.instantRespawnSuspendUntil = 0
misc.instantRespawnHardLockUntil = 0
misc.instantRespawnRetryAt = 0
misc.instantRespawnRetryDone = false
misc.instantRespawnRetryCount = 0
end
return
end
if not me then return end
local alive = (me:IsAlive() == true)
local now = GP_InstantRespawnNow()
local lockUntil = math.max((misc.instantRespawnSuspendUntil or 0), (misc.instantRespawnHardLockUntil or 0))
local rstLockActive = false
if GP_RST then
local rstNow = (GP_RST_Now and GP_RST_Now()) or now
local k = tostring(GP_RST.kind or "")
if rstNow < (GP_RST.detectGlobalUntil or 0) then
rstLockActive = true
elseif (k == "vote" or k == "fail") and (rstNow < (GP_RST.contextUntil or 0)) then
rstLockActive = true
elseif ((GP_RST.queueAt or 0) > rstNow) then
rstLockActive = true
end
end
if (now < lockUntil) or rstLockActive then
misc.instantRespawnWasAlive = alive
misc.instantRespawnAlreadyRequested = false
misc.instantRespawnRetryAt = 0
misc.instantRespawnRetryDone = false
misc.instantRespawnRetryCount = 0
return
end
if misc.instantRespawnWasAlive and (not alive) then
misc.instantRespawnAlreadyRequested = false
misc.instantRespawnRetryAt = 0
misc.instantRespawnRetryDone = false
misc.instantRespawnRetryCount = 0
end
if not alive then
if not misc.instantRespawnAlreadyRequested then
GP_InstantRespawnSendRequest()
misc.instantRespawnAlreadyRequested = true
misc.instantRespawnRetryAt = now + 0.5
misc.instantRespawnRetryDone = false
misc.instantRespawnRetryCount = 0
elseif ((misc.instantRespawnRetryAt or 0) > 0) and (now >= (misc.instantRespawnRetryAt or 0)) and (misc.instantRespawnRetryDone ~= true) then
local rc = tonumber(misc.instantRespawnRetryCount) or 0
if rc == 0 then
GP_InstantRespawnSendRequest()
misc.instantRespawnRetryCount = 1
misc.instantRespawnRetryAt = now + 0.5
elseif rc == 1 then
GP_InstantRespawnSendRequest()
misc.instantRespawnRetryCount = 2
misc.instantRespawnRetryAt = now + 1.0
elseif rc == 2 then
GP_InstantRespawnSendRequest()
misc.instantRespawnRetryCount = 3
misc.instantRespawnRetryAt = now + 2.0
misc.instantRespawnRetryDone = true
else
misc.instantRespawnRetryDone = true
misc.instantRespawnRetryAt = 0
end
end
else
misc.instantRespawnAlreadyRequested = false
misc.instantRespawnRetryAt = 0
misc.instantRespawnRetryDone = false
misc.instantRespawnRetryCount = 0
end
misc.instantRespawnWasAlive = alive
end

GP_TP_AIMBOT_CTL = GP_TP_AIMBOT_CTL or {
suppressed = false,
restorePending = false,
restoreAt = 0,
snapshot = nil,
lastSuppressedAt = 0,
}

GP_TP_AIMBOT_KEYS = GP_TP_AIMBOT_KEYS or {
"lbot.aim.enable",
"lbot.master",
"rbot.aim.enable",
"rbot.master",
"ragebot.enable",
"aimbot",
"aim bot",
}

function GP_TP_AimbotValueIsEnabled(v)
local tv = type(v)
if tv == "boolean" then return v end
if tv == "number" then return v ~= 0 end
if tv == "string" then
local sv = string.lower(v)
return (sv == "1") or (sv == "true") or (sv == "on") or (sv == "enabled")
end
return false
end

function GP_TP_AimbotReadSnapshot()
if not (gui and gui.GetValue) then return nil end
local snap = { keys = {}, anyEnabled = false }
for i = 1, #GP_TP_AIMBOT_KEYS do
local k = GP_TP_AIMBOT_KEYS[i]
local ok, v = pcall(gui.GetValue, k)
if ok and v ~= nil then
local rec = { key = k, value = v, vtype = type(v) }
if GP_TP_AimbotValueIsEnabled(v) then
rec.wasEnabled = true
snap.anyEnabled = true
else
rec.wasEnabled = false
end
table.insert(snap.keys, rec)
end
end
if #snap.keys <= 0 then
return nil
end
return snap
end

function GP_TP_AimbotDisableFromSnapshot(snap)
if not (snap and snap.keys and gui and gui.SetValue) then return end
for i = 1, #snap.keys do
local rec = snap.keys[i]
if rec and rec.wasEnabled then
if rec.vtype == "boolean" then
pcall(gui.SetValue, rec.key, false)
else
pcall(gui.SetValue, rec.key, 0)
end
end
end
end

function GP_TP_AimbotRestoreFromSnapshot(snap)
if not (snap and snap.keys and gui and gui.SetValue) then return end
for i = 1, #snap.keys do
local rec = snap.keys[i]
if rec then
pcall(gui.SetValue, rec.key, rec.value)
end
end
end

function GP_TP_AimbotForceEnable(snap)
if not (gui and gui.SetValue) then return end
local seen = {}
if snap and snap.keys then
for i = 1, #snap.keys do
local rec = snap.keys[i]
if rec and rec.key then
seen[rec.key] = true
if rec.vtype == "boolean" then
pcall(gui.SetValue, rec.key, true)
else
local okNum = pcall(gui.SetValue, rec.key, 1)
if not okNum then pcall(gui.SetValue, rec.key, true) end
end
end
end
end
for i = 1, #GP_TP_AIMBOT_KEYS do
local k = GP_TP_AIMBOT_KEYS[i]
if k and (not seen[k]) then
local okBool = pcall(gui.SetValue, k, true)
if not okBool then pcall(gui.SetValue, k, 1) end
end
end
end

function GP_TP_HandleAimbotSuppression(now)
if not (gui and gui.GetValue and gui.SetValue) then return end
now = now or ((globals and globals.CurTime and globals.CurTime()) or 0)
local tpModeOn = (tpForceModeEnabled == true) or ((config and config.tpWalkEnabled) == true)
local lockConfigured = tpModeOn and ((config and config.tpWalkMoveLockEnabled) == true)

function GP_TP_GetSuppressStates(ts)
local autoWalking = (((teleporterConfig and teleporterConfig.autoWalkEnabled) == true) and (not teleporterJustUsed))
local movingRaw = autoWalking
or (tpIsWaitingForTeleporter == true)
or (tpNoTeleFallbackActive == true)
or (tpUseVerifyActive == true)

local pending = (tpRespawnRearmPending == true)
or (tpWaitForRoundReload == true)

local reachedAt = (tpLastReachedTeleporterAt or 0)
local reachedAgo = -1
if reachedAt > 0 then reachedAgo = (ts - reachedAt) end
if reachedAgo >= 1.0 and (not autoWalking) then
movingRaw = false
pending = false
end

return movingRaw, pending, reachedAgo, autoWalking
end

local movingToTp, pendingRearm, reachedAgo, autoWalkingNow = GP_TP_GetSuppressStates(now)
local shouldSuppress = lockConfigured and (movingToTp or pendingRearm)

if lockConfigured and GP_TP_AIMBOT_CTL.suppressed then
local suppressedFor = now - (GP_TP_AIMBOT_CTL.lastSuppressedAt or now)
if (not autoWalkingNow) and ((reachedAgo >= 1.0) or (suppressedFor >= 5.0)) then
shouldSuppress = false
movingToTp = false
pendingRearm = false
end
end

if shouldSuppress then
GP_TP_AIMBOT_CTL.restorePending = false
GP_TP_AIMBOT_CTL.restoreAt = 0
GP_TP_AIMBOT_CTL.lastSuppressedAt = now
if not GP_TP_AIMBOT_CTL.suppressed then
GP_TP_AIMBOT_CTL.suppressed = true
GP_TP_AIMBOT_CTL.snapshot = GP_TP_AimbotReadSnapshot()
if GP_TP_AIMBOT_CTL.snapshot and GP_TP_AIMBOT_CTL.snapshot.anyEnabled then
GP_TP_AimbotDisableFromSnapshot(GP_TP_AIMBOT_CTL.snapshot)
end
elseif GP_TP_AIMBOT_CTL.snapshot and GP_TP_AIMBOT_CTL.snapshot.anyEnabled then
GP_TP_AimbotDisableFromSnapshot(GP_TP_AIMBOT_CTL.snapshot)
end
return
end

if GP_TP_AIMBOT_CTL.suppressed then
GP_TP_AIMBOT_CTL.suppressed = false
local baseRestore = now + 1.0
local reachRestore = (tpLastReachedTeleporterAt or 0) + 1.0
if reachRestore > baseRestore then baseRestore = reachRestore end
GP_TP_AIMBOT_CTL.restorePending = true
GP_TP_AIMBOT_CTL.restoreAt = baseRestore
end

if GP_TP_AIMBOT_CTL.restorePending and now >= (GP_TP_AIMBOT_CTL.restoreAt or 0) then
local stillMoving, stillPending, stillReachedAgo, stillAutoWalking = GP_TP_GetSuppressStates(now)
local stillSuppress = lockConfigured and (stillMoving or stillPending)
if (not stillAutoWalking) and (stillReachedAgo >= 1.0) then
stillSuppress = false
end
if (not stillSuppress) then
GP_TP_AimbotForceEnable(GP_TP_AIMBOT_CTL.snapshot)
GP_TP_AIMBOT_CTL.restorePending = false
GP_TP_AIMBOT_CTL.restoreAt = 0
GP_TP_AIMBOT_CTL.snapshot = nil
elseif now >= ((GP_TP_AIMBOT_CTL.restoreAt or 0) + 2.5) then
GP_TP_AimbotForceEnable(GP_TP_AIMBOT_CTL.snapshot)
GP_TP_AIMBOT_CTL.restorePending = false
GP_TP_AIMBOT_CTL.restoreAt = 0
GP_TP_AIMBOT_CTL.snapshot = nil
end
end
end

function GP_TP_AimbotRestoreOnUnload()
if GP_TP_AIMBOT_CTL.snapshot and (GP_TP_AIMBOT_CTL.suppressed or GP_TP_AIMBOT_CTL.restorePending) and GP_TP_AIMBOT_CTL.snapshot.anyEnabled then
GP_TP_AimbotRestoreFromSnapshot(GP_TP_AIMBOT_CTL.snapshot)
end
GP_TP_AIMBOT_CTL.suppressed = false
GP_TP_AIMBOT_CTL.restorePending = false
GP_TP_AIMBOT_CTL.restoreAt = 0
GP_TP_AIMBOT_CTL.snapshot = nil
GP_TP_AIMBOT_CTL.lastSuppressedAt = 0
end
function GP_DrawMiscButton(x, y, w, h, label, accent, mx, my, active, alphaMul)
alphaMul = alphaMul or 1
if alphaMul < 0 then alphaMul = 0 elseif alphaMul > 1 then alphaMul = 1 end
function AM(a) return math.floor((a or 255) * alphaMul + 0.5) end
local hover = (mx >= x and mx <= x + w and my >= y and my <= y + h)
local base = {150,150,150,255}
local col = (hover or active) and accent or base
GP_Color(25,25,25, AM(235))
SafeFilledRect(x, y, x+w, y+h)
GP_Color(col[1],col[2],col[3], AM(col[4]))
SafeFilledRect(x, y, x+w, y+2)
GP_Color(col[1],col[2],col[3], AM(col[4]))
SafeFilledRect(x, y+h-2, x+w, y+h)
draw.SetFont(GP_UI.font)
local maxTextW = math.max(0, (w or 0) - 20)
local labelDraw = label or ""
do
local tw0 = draw.GetTextSize(labelDraw)
local guard = 0
while tw0 > maxTextW and #labelDraw > 0 and guard < 128 do
labelDraw = labelDraw:sub(1, #labelDraw - 1)
tw0 = draw.GetTextSize(labelDraw)
guard = guard + 1
end
end
local th = select(2, draw.GetTextSize(labelDraw))
local tx = math.floor(x + 10)
local ty = math.floor(y + h/2 - th/2)
GP_Color(col[1],col[2],col[3], AM(col[4]))
SafeText(tx, ty, labelDraw)
return hover
end
function GP_MiscResetKeyBindState()
misc.waitKey = false
misc.waitKeyArmed = false
misc.waitWhich = nil
misc.waitKeyStartFrame = 0
misc.keyPrev = {}
end
function GP_MiscCloseMenuState()
misc.want = false
misc.category = nil
GP_MiscResetKeyBindState()
end
function GP_MiscSubItemCount(cat)
if cat == "toggles" then return 5 end
if cat == "misc" then return 11 end
if cat == "hotkeys" then return 5 end
return 0
end
function GP_MiscComputePanels(anchorX, anchorY, barHeight, screenWidth, screenHeight, animValue)
local mw, bh, gap, padding, barT = 220, 24, 6, 10, 2
local mainItems = 3
local mh = barT*2 + padding*2 + mainItems*bh + (mainItems-1)*gap
local px = anchorX
local py = anchorY + barHeight + 4
local attachBelow = true
if (py + mh) > screenHeight then
attachBelow = false
py = anchorY - mh - 6
end
if px < 0 then px = 0 end
if (px + mw) > screenWidth then px = math.max(0, screenWidth - mw) end
if py < 0 then py = 0 end
if (py + mh) > screenHeight then py = math.max(0, screenHeight - mh) end
local a = animValue or (misc.anim or 0)
local offset = (1 - a) * 8
if not attachBelow then offset = -offset end
local pyDraw = py + math.floor(offset + 0.5)
local cat = misc.category
local subItems = GP_MiscSubItemCount(cat)
local hasSub = subItems > 0
local sw, sh, sx, sy = 0, 0, 0, 0
if hasSub then
sw = 300
sh = barT*2 + padding*2 + subItems*bh + (subItems-1)*gap
sx = px + mw + 8
if (sx + sw) > screenWidth then
sx = px - sw - 8
end
if sx < 0 then sx = 0 end
if (sx + sw) > screenWidth then sx = math.max(0, screenWidth - sw) end
sy = pyDraw
if sy < 0 then sy = 0 end
if (sy + sh) > screenHeight then sy = math.max(0, screenHeight - sh) end
end
return px, pyDraw, mw, mh, attachBelow, sw, sh, sx, sy, hasSub, bh, gap, padding, barT
end
function GP_MiscIsMouseOver(anchorX, anchorY, barHeight, screenWidth, screenHeight, mx, my)
if (misc.anim or 0) <= 0 then return false end
local px, pyDraw, mw, mh, _, sw, sh, sx, sy, hasSub =
GP_MiscComputePanels(anchorX, anchorY, barHeight, screenWidth, screenHeight, misc.anim)
local inMain = (mx >= px and mx <= (px + mw) and my >= pyDraw and my <= (pyDraw + mh))
if inMain then return true end
if hasSub then
local inSub = (mx >= sx and mx <= (sx + sw) and my >= sy and my <= (sy + sh))
if inSub then return true end
end
return false
end
function GP_DrawRightClickMenu(anchorX, anchorY, barHeight, screenWidth, screenHeight, mx, my, rPressedAny)
if (misc.anim or 0) <= 0 then return end
local _gp_prevNoTrans = _gp_noTransparent
_gp_noTransparent = true
local aMul = (misc.anim or 0)
if misc.debounceFrames and misc.debounceFrames > 0 then
misc.debounceFrames = misc.debounceFrames - 1
end
local px, pyDraw, mw, mh, attachBelow, sw, sh, sx, sy, hasSub, bh, gap, padding, barT =
GP_MiscComputePanels(anchorX, anchorY, barHeight, screenWidth, screenHeight, aMul)
local lDownMenu = input.IsButtonDown(MOUSE_LEFT)
local lPressedMenu = lDownMenu and not (misc.lastLDown or false)
misc.lastLDown = lDownMenu
local fc = (globals.FrameCount and globals.FrameCount() or 0)
local justOpened = (misc.openFrame ~= 0) and ((fc - misc.openFrame) < 6)
local inMain = (mx >= px and mx <= (px + mw) and my >= pyDraw and my <= (pyDraw + mh))
local inSub = hasSub and (mx >= sx and mx <= (sx + sw) and my >= sy and my <= (sy + sh)) or false
local inMenu = inMain or inSub
if (not misc.waitKey) then
if (not justOpened) and rPressedAny and (not inMenu) then
GP_MiscCloseMenuState()
elseif (not justOpened) and lPressedMenu and (not inMenu) then
GP_MiscCloseMenuState()
end
end
local accent = GP_UI.colors.gold
local forceAccent = {255, 140, 0, 255}
GP_Color(GP_UI.colors.background[1], GP_UI.colors.background[2], GP_UI.colors.background[3], math.floor((245 * aMul) + 0.5))
SafeFilledRect(px, pyDraw, px+mw, pyDraw+mh)
if attachBelow then
GP_Color(accent[1], accent[2], accent[3], math.floor((255 * aMul) + 0.5))
SafeFilledRect(px, pyDraw, px+mw, pyDraw+barT)
end
GP_Color(accent[1], accent[2], accent[3], math.floor((255 * aMul) + 0.5))
SafeFilledRect(px, pyDraw+mh-barT, px+mw, pyDraw+mh)
local bx = px + padding
local by = pyDraw + barT + padding
local cToggles = GP_DrawMiscButton(bx, by, mw-padding*2, bh, "Toggles", accent, mx, my, misc.category == "toggles", aMul)
by = by + bh + gap
local cMisc = GP_DrawMiscButton(bx, by, mw-padding*2, bh, "Misc", accent, mx, my, misc.category == "misc", aMul)
by = by + bh + gap
local cHotkeys = GP_DrawMiscButton(bx, by, mw-padding*2, bh, "Hotkeys", accent, mx, my, misc.category == "hotkeys", aMul)
if not misc.armed then
if not input.IsButtonDown(MOUSE_LEFT) then
misc.armed = true
end
end
local lPressed = lPressedMenu
if misc.armed and lPressed then
if (misc.debounceFrames or 0) > 0 then
else
if cToggles then
if misc.category == "toggles" then
misc.category = nil
else
misc.category = "toggles"
end
GP_MiscResetKeyBindState()
misc.debounceFrames = 6
elseif cMisc then
if misc.category == "misc" then
misc.category = nil
else
misc.category = "misc"
end
GP_MiscResetKeyBindState()
misc.debounceFrames = 6
elseif cHotkeys then
if misc.category == "hotkeys" then
misc.category = nil
else
misc.category = "hotkeys"
end
GP_MiscResetKeyBindState()
misc.debounceFrames = 6
end
end
end
if hasSub then
GP_Color(GP_UI.colors.background[1], GP_UI.colors.background[2], GP_UI.colors.background[3], math.floor((245 * aMul) + 0.5))
SafeFilledRect(sx, sy, sx+sw, sy+sh)
GP_Color(accent[1], accent[2], accent[3], math.floor((255 * aMul) + 0.5))
SafeFilledRect(sx, sy, sx+sw, sy+barT)
GP_Color(accent[1], accent[2], accent[3], math.floor((255 * aMul) + 0.5))
SafeFilledRect(sx, sy+sh-barT, sx+sw, sy+sh)
local sbx = sx + padding
local sby = sy + barT + padding
local swi = sw - padding*2
if misc.category == "toggles" then
local t1 = GP_DrawMiscButton(sbx, sby, swi, bh, "AutoCredit: " .. (config.autoWalkEnabled and "ON" or "OFF"), accent, mx, my, config.autoWalkEnabled, aMul)
sby = sby + bh + gap
local t2 = GP_DrawMiscButton(sbx, sby, swi, bh, "SniperBuy: " .. (config.autoBuyEnabled and "ON" or "OFF"), accent, mx, my, config.autoBuyEnabled, aMul)
sby = sby + bh + gap
local t3 = GP_DrawMiscButton(sbx, sby, swi, bh, "Force SniperBuy: " .. (forceSniperBuyModeEnabled and "ON" or "OFF"), forceAccent, mx, my, forceSniperBuyModeEnabled, aMul)
sby = sby + bh + gap
local t4 = GP_DrawMiscButton(sbx, sby, swi, bh, "TpWalk: " .. (config.tpWalkEnabled and "ON" or "OFF"), accent, mx, my, config.tpWalkEnabled, aMul)
sby = sby + bh + gap
local t5 = GP_DrawMiscButton(sbx, sby, swi, bh, "Force TpWalk: " .. (tpForceModeEnabled and "ON" or "OFF"), forceAccent, mx, my, tpForceModeEnabled, aMul)
if misc.armed and lPressed and ((misc.debounceFrames or 0) <= 0) then
if t1 then
GP_SetAutoCreditEnabled((not config.autoWalkEnabled), true)
elseif t2 then
local nextEnabled = (not config.autoBuyEnabled)
if nextEnabled and forceSniperBuyModeEnabled then
GP_SetForceSniperBuyEnabled(false, false)
end
config.autoBuyEnabled = nextEnabled
gpStickyAutoBuyEnabled = (config.autoBuyEnabled == true)
if config.autoBuyEnabled then
GP_EnableSniperBuyRuntime(((GP_TP_IsTraversalActive and GP_TP_IsTraversalActive()) and true or false))
AddNotification("SniperBuy Enabled - Reset state (Death/Respawn as Sniper activates it)", "warning", 4.0)
else
GP_DisableSniperBuyRuntime(GP_TP_IsTraversalActive())
AddNotification("SniperBuy Disabled", "info")
end
SaveConfig(GP_CfgPath(), config)
elseif t3 then
GP_SetForceSniperBuyEnabled((not forceSniperBuyModeEnabled), true)
elseif t4 then
GP_SetTpWalkEnabled((not config.tpWalkEnabled), true)
elseif t5 then
GP_SetTpForceEnabled((not tpForceModeEnabled), true)
end
end
elseif misc.category == "misc" then
local m1 = GP_DrawMiscButton(sbx, sby, swi, bh, (config.transparentEnabled and "Transparent: ON" or "Transparent: OFF"), accent, mx, my, config.transparentEnabled, aMul)
sby = sby + bh + gap
local m2 = GP_DrawMiscButton(sbx, sby, swi, bh, (config.hideHotkeysInUI and "Hide Hotkeys in UI: ON" or "Hide Hotkeys in UI: OFF"), accent, mx, my, config.hideHotkeysInUI, aMul)
sby = sby + bh + gap
local m3 = GP_DrawMiscButton(sbx, sby, swi, bh, (config.hideInfoPopups and "Hide Info Pop ups: ON" or "Hide Info Pop ups: OFF"), accent, mx, my, config.hideInfoPopups, aMul)
sby = sby + bh + gap
local m4 = GP_DrawMiscButton(sbx, sby, swi, bh, (config.partyGpKillEnabled and "Party gp_kill command: ON" or "Party gp_kill command: OFF"), forceAccent, mx, my, config.partyGpKillEnabled, aMul)
sby = sby + bh + gap
local m5 = GP_DrawMiscButton(sbx, sby, swi, bh, (config.partyGpLeaveEnabled and "Party gp_leave command: ON" or "Party gp_leave command: OFF"), forceAccent, mx, my, config.partyGpLeaveEnabled, aMul)
sby = sby + bh + gap
local m6 = GP_DrawMiscButton(sbx, sby, swi, bh, "Lock TpWalking: " .. (config.tpWalkMoveLockEnabled and "ON" or "OFF"), forceAccent, mx, my, config.tpWalkMoveLockEnabled, aMul)
sby = sby + bh + gap
local m7 = GP_DrawMiscButton(sbx, sby, swi, bh, "TpWalk Whitelist: " .. (config.tpWalkWhitelistEnabled and "ON" or "OFF"), forceAccent, mx, my, config.tpWalkWhitelistEnabled, aMul)
sby = sby + bh + gap
local firstJoinAccent = forceAccent
local m8 = GP_DrawMiscButton(sbx, sby, swi, bh, "First Join Medic: " .. (config.firstJoinPickMedic and "ON" or "OFF"), firstJoinAccent, mx, my, config.firstJoinPickMedic, aMul)
sby = sby + bh + gap
local f4CycleAccent = forceAccent
local m9 = GP_DrawMiscButton(sbx, sby, swi, bh, "Smart AutoF4: " .. (config.mvmReadyTpCycleEnabled and "ON" or "OFF"), f4CycleAccent, mx, my, config.mvmReadyTpCycleEnabled, aMul)
sby = sby + bh + gap
local m10 = GP_DrawMiscButton(sbx, sby, swi, bh, "Instant Respawn: " .. (config.instantRespawnEnabled and "ON" or "OFF"), forceAccent, mx, my, config.instantRespawnEnabled, aMul)
sby = sby + bh + gap
local m11 = GP_DrawMiscButton(sbx, sby, swi, bh, "Auto Disconnect: " .. (config.autoDisconnectEnabled and "ON" or "OFF"), forceAccent, mx, my, config.autoDisconnectEnabled, aMul)
if misc.armed and lPressed and ((misc.debounceFrames or 0) <= 0) then
if m1 then
config.transparentEnabled = not config.transparentEnabled
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
AddNotification("Transparent mode " .. (config.transparentEnabled and "Enabled" or "Disabled"), "success")
elseif m2 then
config.hideHotkeysInUI = not config.hideHotkeysInUI
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
AddNotification("Hide Hotkeys in UI " .. (config.hideHotkeysInUI and "Enabled" or "Disabled"), "success")
elseif m3 then
config.hideInfoPopups = not config.hideInfoPopups
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
if not config.hideInfoPopups then
AddNotification("Hide Info Pop ups Disabled", "info")
end
elseif m4 then
config.partyGpKillEnabled = not config.partyGpKillEnabled
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
AddNotification("Party gp_kill command " .. (config.partyGpKillEnabled and "Enabled" or "Disabled"), "info")
elseif m5 then
config.partyGpLeaveEnabled = not config.partyGpLeaveEnabled
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
AddNotification("Party gp_leave command " .. (config.partyGpLeaveEnabled and "Enabled" or "Disabled"), "info")
elseif m6 then
config.tpWalkMoveLockEnabled = not config.tpWalkMoveLockEnabled
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
if config.tpWalkMoveLockEnabled then
AddNotification("Lock TpWalking Enabled (locks your own movement and turns off aimbot until teleport)", "info", (UI.notificationLifetime or 3) + 2)
else
AddNotification("Lock TpWalking Disabled", "info")
end
elseif m7 then
config.tpWalkWhitelistEnabled = not config.tpWalkWhitelistEnabled
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
if config.tpWalkWhitelistEnabled then
AddNotification("TpWalk Whitelist enabled (set a player's priority to 1 in the playerlist to whitelist them)", "info", (UI.notificationLifetime or 3) + 2)
else
AddNotification("TpWalk Whitelist Disabled", "info")
end
elseif m8 then
config.firstJoinPickMedic = not config.firstJoinPickMedic
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
AddNotification("First Join Medic " .. (config.firstJoinPickMedic and "Enabled" or "Disabled"), "info")
elseif m9 then
config.mvmReadyTpCycleEnabled = not config.mvmReadyTpCycleEnabled
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
GP_F4_OnFeatureToggle(config.mvmReadyTpCycleEnabled == true)
elseif m10 then
config.instantRespawnEnabled = not config.instantRespawnEnabled
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
AddNotification("Instant Respawn " .. (config.instantRespawnEnabled and "Enabled" or "Disabled"), "info")
elseif m11 then
config.autoDisconnectEnabled = not config.autoDisconnectEnabled
if not config.autoDisconnectEnabled then
gpAutoDisconnectTriggered = false
end
SaveConfig(GP_CfgPath(), config)
misc.debounceFrames = 10
AddNotification("Auto Disconnect " .. (config.autoDisconnectEnabled and "Enabled" or "Disabled"), "info")
end
end
elseif misc.category == "hotkeys" then
local h1 = GP_DrawMiscButton(sbx, sby, swi, bh, (misc.waitKey and misc.waitWhich=="walk" and "Press a key..." or ("Set Hotkey AutoCredit ["..GP_KeyName(WALK_KEY).."]")), accent, mx, my, false, aMul)
sby = sby + bh + gap
local h2 = GP_DrawMiscButton(sbx, sby, swi, bh, (misc.waitKey and misc.waitWhich=="clean" and "Press a key..." or ("Set Hotkey Cleanup ["..GP_KeyName(CLEAN_KEY).."]")), accent, mx, my, false, aMul)
sby = sby + bh + gap
local h3 = GP_DrawMiscButton(sbx, sby, swi, bh, (misc.waitKey and misc.waitWhich=="auto" and "Press a key..." or ("Set Hotkey SniperBuy ["..GP_KeyName(AUTO_KEY).."]")), accent, mx, my, false, aMul)
sby = sby + bh + gap
local h4 = GP_DrawMiscButton(sbx, sby, swi, bh, (misc.waitKey and misc.waitWhich=="tp" and "Press a key..." or ("Set Hotkey TpWalk ["..GP_KeyName(TP_KEY).."]")), accent, mx, my, false, aMul)
sby = sby + bh + gap
local h5 = GP_DrawMiscButton(sbx, sby, swi, bh, (misc.waitKey and misc.waitWhich=="alloff" and "Press a key..." or ("Set Hotkey Disable All ["..GP_KeyName(ALL_OFF_KEY).."]")), accent, mx, my, false, aMul)
if misc.armed and lPressed and ((misc.debounceFrames or 0) <= 0) then
if h1 then
misc.waitKey = true
misc.waitWhich = "walk"
misc.waitKeyArmed = false
misc.keyPrev = {}
misc.waitKeyStartFrame = globals.FrameCount() or 0
elseif h2 then
misc.waitKey = true
misc.waitWhich = "clean"
misc.waitKeyArmed = false
misc.keyPrev = {}
misc.waitKeyStartFrame = globals.FrameCount() or 0
elseif h3 then
misc.waitKey = true
misc.waitWhich = "auto"
misc.waitKeyArmed = false
misc.keyPrev = {}
misc.waitKeyStartFrame = globals.FrameCount() or 0
elseif h4 then
misc.waitKey = true
misc.waitWhich = "tp"
misc.waitKeyArmed = false
misc.keyPrev = {}
misc.waitKeyStartFrame = globals.FrameCount() or 0
elseif h5 then
misc.waitKey = true
misc.waitWhich = "alloff"
misc.waitKeyArmed = false
misc.keyPrev = {}
misc.waitKeyStartFrame = globals.FrameCount() or 0
end
end
end
end
if misc.waitKey then
local mw2, mh2 = 220, 62
local cx = px + mw/2 - mw2/2
local cy = pyDraw + mh/2 - mh2/2
GP_Color(0,0,0,140)
SafeFilledRect(cx-4, cy-4, cx+mw2+4, cy+mh2+4)
GP_Color(15,15,15,245)
SafeFilledRect(cx, cy, cx+mw2, cy+mh2)
GP_Color(accent[1], accent[2], accent[3], 255)
SafeFilledRect(cx, cy, cx+mw2, cy+2)
GP_Color(accent[1], accent[2], accent[3], 255)
SafeFilledRect(cx, cy+mh2-2, cx+mw2, cy+mh2)
draw.SetFont(GP_UI.font)
local line1 = "Press a key or ESC"
local line2 = "Binding: " .. (misc.waitWhich=="walk" and "AutoCredit" or (misc.waitWhich=="clean" and "Cleanup" or (misc.waitWhich=="tp" and "TpWalk" or (misc.waitWhich=="alloff" and "Disable All Toggles" or "SniperBuy"))))
local tw1, th1 = draw.GetTextSize(line1)
local tw2, th2 = draw.GetTextSize(line2)
GP_Color(255,215,0,255)
SafeText(math.floor(cx + mw2/2 - tw1/2), math.floor(cy + 14 - th1/2), line1)
GP_Color(200,200,200,255)
SafeText(math.floor(cx + mw2/2 - tw2/2), math.floor(cy + 38 - th2/2), line2)
if IsUIInputAllowed() then
if not misc.waitKeyArmed then
if (not input.IsButtonDown(MOUSE_LEFT)) and (not input.IsButtonDown(MOUSE_RIGHT)) then
misc.waitKeyArmed = true
misc.keyPrev = {}
end
else
GP_TryCaptureHotkey()
end
end
end
_gp_noTransparent = _gp_prevNoTrans
end
function GP_IsMedic(me)
return GP_GetClassId(me) == 5
end
function IsMedic(me)
if me ~= nil then
return GP_IsMedic(me)
end
local lp = (entities and entities.GetLocalPlayer) and entities.GetLocalPlayer() or nil
return GP_IsMedic(lp)
end
GP_IsSniper = function(me)
return GP_GetClassId(me) == 2
end
function GP_GetCurrentClassName(me)
local cls = GP_GetClassId(me)
if not cls then return nil end
return GP_CLASS_NAME[cls]
end
function GP_UpdatePostWaveSwapLatch()
if acPostWaveSwapLatched then
return true
end
local wave = GP_GetWaveNumber and GP_GetWaveNumber() or nil
local rs = GP_GetRoundState and GP_GetRoundState() or nil
local inSetup = nil
if GP_TP_IsSetupPhase then
local okSetup, vSetup = pcall(GP_TP_IsSetupPhase)
if okSetup then
inSetup = vSetup
end
end
if (type(rs) == "number") and (rs == 4) then
acPostWaveSwapLatched = true
end
if (not acPostWaveSwapLatched) and (type(rs) == "number") and (rs == 3) then
local liveSeen = (GP_RST and GP_RST.liveSeen) or false
if liveSeen then
acPostWaveSwapLatched = true
end
end
if (not acPostWaveSwapLatched) and (type(wave) == "number") then
if wave >= 2 then
acPostWaveSwapLatched = true
elseif (wave >= 1) and (inSetup == false) then
acPostWaveSwapLatched = true
end
end
return acPostWaveSwapLatched
end
function GP_HasExplicitPreWave1Proof()
local wave = GP_GetWaveNumber and GP_GetWaveNumber() or nil
local rs = GP_GetRoundState and GP_GetRoundState() or nil
local inSetup = nil
if GP_TP_IsSetupPhase then
local okSetup, vSetup = pcall(GP_TP_IsSetupPhase)
if okSetup then
inSetup = vSetup
end
end
local liveSeen = (GP_RST and GP_RST.liveSeen) or false
if GP_UpdatePostWaveSwapLatch and GP_UpdatePostWaveSwapLatch() then
return false
end
if type(wave) == "number" then
if wave <= 0 then
return true
end
if (wave == 1) and (inSetup == true) and (not liveSeen) then
return true
end
return false
end
if inSetup == true then
return (not liveSeen)
end
if type(rs) == "number" and (rs == 3 or rs == 10) then
if not liveSeen then
return true
end
end
return false
end
function GP_IsPostWaveSwapRestricted()
if GP_UpdatePostWaveSwapLatch() then
return true
end
local rs = GP_GetRoundState and GP_GetRoundState() or nil
if (type(rs) == "number") and (rs == 4) then
acPostWaveSwapLatched = true
return true
end
local wave = GP_GetWaveNumber and GP_GetWaveNumber() or nil
local inSetup = nil
if GP_TP_IsSetupPhase then
local okSetup, vSetup = pcall(GP_TP_IsSetupPhase)
if okSetup then
inSetup = vSetup
end
end
if type(wave) == "number" then
if wave <= 0 then
return false
end
if wave == 1 then
if inSetup == false then
acPostWaveSwapLatched = true
return true
end
return false
end
if wave >= 2 then
acPostWaveSwapLatched = true
return true
end
end
return acPostWaveSwapLatched == true
end
function GP_GetPostWaveAutoCreditTargetClass()
if not config or not config.changeClassEnabled then return nil end
local tc = config.targetClass
if type(tc) ~= "string" then return nil end
tc = string.lower(tc)
if tc == "" or tc == "off" or tc == "medic" then
return nil
end
local valid = {
scout=true, sniper=true, soldier=true, demoman=true,
heavy=true, heavyweapons=true, pyro=true, spy=true, engineer=true
}
if valid[tc] then
return tc
end
return nil
end
function GP_GetPostWaveStationSwapTarget(me)
if not me then return nil, "no_player" end
local tc = GP_GetPostWaveAutoCreditTargetClass()
if not tc then
return nil, "invalid_target"
end
if not IsMedic(me) then
return nil, "not_medic"
end
local inZone = false
if me.GetPropInt then
local okZone, vZone = pcall(me.GetPropInt, me, "m_bInUpgradeZone")
inZone = (okZone and vZone == 1)
end
if not inZone then
return nil, "not_in_upgrade"
end
return tc, nil
end
function GP_ShouldAllowPostWaveStationSwapWithoutThreshold(me)
if not me then return false end
if not (config and config.autoWalkEnabled) then return false end
if not (config and config.changeClassEnabled) then return false end
if not GP_IsPostWaveSwapRestricted() then return false end
local tc, reason = GP_GetPostWaveStationSwapTarget(me)
return (tc ~= nil and tc ~= "")
end
function GP_SafeCall(fn, default)
local ok, res = pcall(fn)
if ok then return res end
return default
end
function GP_GetGameRulesProxy()
if entities and entities.FindByClass then
local t = entities.FindByClass("CTFGameRulesProxy")
if t and t[1] then return t[1] end
end
return nil
end
function GP_TryPropInt(ent, ...)
if not ent or not ent.GetPropInt then return nil end
for i = 1, select('#', ...) do
local name = select(i, ...)
local ok, v = pcall(ent.GetPropInt, ent, name)
if ok then
local tv = type(v)
if tv == "number" then
return v
elseif tv == "boolean" then
return v and 1 or 0
elseif tv == "string" then
local n = tonumber(v)
if n ~= nil then return n end
end
end
end
return nil
end
function GP_GetRoundState()
local rs = GP_SafeCall(function() return gamerules.GetRoundState() end, nil)
if type(rs) == "number" then return rs end
rs = GP_SafeCall(function() return gamerules.RoundState() end, nil)
if type(rs) == "number" then return rs end
local proxy = GP_GetGameRulesProxy()
rs = GP_TryPropInt(proxy, "m_iRoundState", "m_iState", "m_nRoundState")
if type(rs) == "number" then return rs end
return nil
end
function GP_GetWaveNumber()
local wn = GP_SafeCall(function() return gamerules.GetWaveNumber() end, nil)
if type(wn) == "number" then return wn end
wn = GP_SafeCall(function() return gamerules.GetWave() end, nil)
if type(wn) == "number" then return wn end
wn = GP_SafeCall(function() return gamerules.WaveNumber() end, nil)
if type(wn) == "number" then return wn end
local proxy = GP_GetGameRulesProxy()
wn = GP_TryPropInt(proxy,
"m_nMannVsMachineWaveCount",
"m_iMvMWaveCount",
"m_nWaveCount",
"m_iWaveNumber",
"m_nWaveNumber"
)
if type(wn) == "number" then return wn end
local obj = nil
if entities and entities.FindByClass then
local t = entities.FindByClass("CTFObjectiveResource")
if t and t[1] then obj = t[1] end
end
wn = GP_TryPropInt(obj,
"m_nMannVsMachineWaveCount",
"m_iMvMWaveCount",
"m_nWaveCount",
"m_iWaveNumber",
"m_nWaveNumber"
)
if type(wn) == "number" then return wn end
return nil
end
function GP_TP_IsSetupPhase()
local b = GP_SafeCall(function()
if gamerules then
if gamerules.IsInSetup then return gamerules.IsInSetup() end
if gamerules.InSetup then return gamerules.InSetup() end
end
return nil
end, nil)
if type(b) == "boolean" then
return b
elseif type(b) == "number" then
return (b ~= 0)
end
local proxy = GP_GetGameRulesProxy()
local setup = GP_TryPropInt(proxy, "m_bInSetup")
if type(setup) == "number" then
return (setup ~= 0)
end
local between = GP_TryPropInt(proxy, "m_bMannVsMachineBetweenWaves")
if type(between) == "number" then
if between ~= 0 then return true end
end
local waiting = GP_TryPropInt(proxy, "m_bInWaitingForPlayers")
if type(waiting) == "number" then
if waiting ~= 0 then return true end
return false
end
return nil
end
function GP_TP_IsArmedAndAllowed()
local now = (globals and globals.CurTime and globals.CurTime()) or 0
function tryReleaseRoundReloadGate()
if not tpWaitForRoundReload then
tpWaitForRoundReloadArmedAt = 0
return
end
if (tpWaitForRoundReloadArmedAt or 0) <= 0 then
tpWaitForRoundReloadArmedAt = now
end
local me = nil
if entities and entities.GetLocalPlayer then
local okMe, vMe = pcall(entities.GetLocalPlayer)
if okMe then me = vMe end
end
local inSpawnCtx = false
if me then
local okCtx, vCtx = pcall(GP_TP_IsSpawnContextNow, me)
inSpawnCtx = (okCtx and vCtx == true)
end
local timedOut = ((now - (tpWaitForRoundReloadArmedAt or now)) >= (TP_WAITROUND_REARM_FAILSAFE_SECONDS or 12.0))
local rrReason = tostring(tpWaitForRoundReloadReason or "")
local strictRestartReload = (string.find(rrReason, "restart", 1, true) ~= nil) or (string.find(rrReason, "fail", 1, true) ~= nil)
local canReleaseEarly = inSpawnCtx
if strictRestartReload then
canReleaseEarly = false
end
if canReleaseEarly or timedOut then
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
tpWaitForRoundReloadArmedAt = 0
tpToggleSpawnLock = false
tpToggleSpawnLockArmedAt = 0
if (sniperUpgradeCompletedTime or 0) <= 0 then
sniperUpgradeCompletedTime = now - (TELEPORTER_AUTOWALK_DELAY or 1.0)
end
if tpForceModeEnabled and tpForceRestoreAwaitRespawn then
local aliveNow = false
if me and me.IsAlive then
aliveNow = (me:IsAlive() == true)
end
if aliveNow then
tpForceRestoreAwaitRespawn = false
tpRespawnRearmPending = false
tpStickyArmed = true
teleporterManuallyDisabled = false
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
tpIsWaitingForTeleporter = false
tpNoTeleFallbackActive = false
tpTeleporterSeenCount = (TP_TELE_STABLE_SCANS or 8)
reloadMoveLock = false
else
tpRespawnRearmPending = true
reloadMoveLock = true
end
tpLastAliveState = aliveNow
end
end
end
tryReleaseRoundReloadGate()
if tpForceModeEnabled then
if tpForceRestoreAwaitRespawn then return false end
if tpWaitForRoundReload then return false end
return (tpStickyArmed == true)
end
if not (config and config.tpWalkEnabled) then return false end
if tpWaitForRoundReload then return false end
if tpToggleNeedsTrigger then return false end
return (sniperUpgradeCompleted == true)
end
function GP_Draw()
UI_Color(255, 255, 255, 255)
local lboxMenuOpen = (gui and gui.IsMenuOpen and gui.IsMenuOpen()) or false
if engine.IsGameUIVisible() and not lboxMenuOpen then
return
end
local me = entities.GetLocalPlayer()
if me then
CheckServerChange()
end
GP_AutoDisconnectTick()
UI.notifications = UI.notifications or {}
if me then
CheckServerChange()
end
if not me then
if not lboxMenuOpen then return end
end
if me and (not GP_IsMvM()) then
return
end
local currency = (me and (me:GetPropInt("m_nCurrency") or 0)) or 0
local goal = config.moneyThreshold or 0
local progressRatio = 0
if goal > 0 then
progressRatio = math.min(currency / goal, 1)
end
local showFillbar = (GP_GetRoundState() == 3 and GP_GetWaveNumber() == 0)
local mainLabel = "GhostMoney"
local moneyText = "Cash: $" .. currency .. "/" .. goal
local classText = "Class: " .. (config.changeClassEnabled and (config.targetClass or "unknown") or "off")
local lowerText
if config.hideHotkeysInUI then
lowerText = "AutoCredit | Cleanup | SniperBuy | TpWalk"
else
lowerText = "[" .. KeyLabel(WALK_KEY) .. "] AutoCredit | [" .. KeyLabel(CLEAN_KEY) .. "] Cleanup | [" .. KeyLabel(AUTO_KEY) .. "] SniperBuy | [" .. KeyLabel(TP_KEY) .. "] TpWalk"
end
local topText = mainLabel .. " | " .. moneyText .. " | " .. classText
draw.SetFont(GP_UI.font)
local topWidth = draw.GetTextSize(topText)
draw.SetFont(GP_UI.font2)
local lowerWidth = draw.GetTextSize(lowerText)
local paddingX = 10
local width = math.max(topWidth, lowerWidth) + paddingX * 2
local height = 44
local mouse = { x = input.GetMousePos()[1], y = input.GetMousePos()[2] }
local screenWidth, screenHeight = draw.GetScreenSize()
local barWidth, barHeight = width, height + (showFillbar and 6 or 0)
if ClampUIPos(screenWidth, screenHeight, barWidth, barHeight) then
local rt = globals.RealTime() or 0
if (rt - uiClampSavedAt) > 0.5 then
uiClampSavedAt = rt
config.watermarkX = watermarkX
config.watermarkY = watermarkY
SaveConfig(GP_CfgPath(), config)
end
end
local mouseDown = input.IsButtonDown(MOUSE_LEFT)
local mousePressed = mouseDown and not gpDropdown.lastMouseDown
local mouseReleased = (not mouseDown) and gpDropdown.lastMouseDown
gpDropdown.lastMouseDown = mouseDown
local mouseOverMisc = GP_MiscIsMouseOver(watermarkX, watermarkY, barHeight, screenWidth, screenHeight, mouse.x, mouse.y)
local mousePressedDD = mousePressed and (not mouseOverMisc)
local inMainPanel = (mouse.x >= watermarkX and mouse.x <= (watermarkX + barWidth) and mouse.y >= watermarkY and mouse.y <= (watermarkY + barHeight))
local rDown = input.IsButtonDown(MOUSE_RIGHT)
local rPressed = rDown and not misc.lastRDown
local rPressedAny = rPressed
misc.lastRDown = rDown
if rPressed and inMainPanel and IsUIInputAllowed() then
misc.want = not misc.want
misc.armed = false
if misc.want then
misc.openedAt = (globals.RealTime and globals.RealTime() or 0)
misc.openFrame = (globals.FrameCount and globals.FrameCount() or 0)
else
misc.openedAt = 0
misc.openFrame = 0
end
if not misc.want then
misc.category = nil
GP_MiscResetKeyBindState()
end
end
do
local ft = GP_FrameDT()
local target = (misc.want and 1 or 0)
local speed = 14
local t = math.min(1, ft * speed)
misc.anim = (misc.anim or 0) + (target - (misc.anim or 0)) * t
if misc.anim < 0.01 and (not misc.want) then
misc.anim = 0
end
misc.open = (misc.anim or 0) > 0
end
draw.SetFont(GP_UI.font)
local clickY1 = watermarkY + 6
local clickY2 = clickY1 + 18
local sepText = " | "
local mainX1 = watermarkX + paddingX
local mainX2 = mainX1 + draw.GetTextSize(mainLabel)
local moneyW = draw.GetTextSize(moneyText)
local classW = draw.GetTextSize(classText)
local sepW = draw.GetTextSize(sepText)
local classDrawX = watermarkX + width - paddingX - classW
local leftBound = mainX2 + sepW
local rightBound = classDrawX - sepW
local moneyDrawX = math.floor(((leftBound + rightBound) - moneyW) * 0.5 + 0.5)
local maxMoneyX = rightBound - moneyW
if maxMoneyX < leftBound then maxMoneyX = leftBound end
if moneyDrawX < leftBound then
moneyDrawX = leftBound
elseif moneyDrawX > maxMoneyX then
moneyDrawX = maxMoneyX
end
if classDrawX < (moneyDrawX + moneyW + sepW) then
classDrawX = moneyDrawX + moneyW + sepW
end
local moneyX1 = moneyDrawX - 6
local moneyX2 = moneyDrawX + moneyW + 6
local classX1 = classDrawX - 6
local classX2 = classDrawX + classW + 6
local hitMoneyTop = (mouse.x >= moneyX1 and mouse.x <= moneyX2 and mouse.y >= clickY1 and mouse.y <= clickY2)
local hitClassTop = (mouse.x >= classX1 and mouse.x <= classX2 and mouse.y >= clickY1 and mouse.y <= clickY2)
local hitMainTop = (mouse.x >= mainX1 and mouse.x <= mainX2 and mouse.y >= clickY1 and mouse.y <= clickY2)
if mouseDown then
if isDragging then
watermarkX = mouse.x - dragOffsetX
watermarkY = mouse.y - dragOffsetY
if watermarkX < 0 then
watermarkX = 0
elseif watermarkX + barWidth > screenWidth then
watermarkX = screenWidth - barWidth
end
if watermarkY < 0 then
watermarkY = 0
elseif watermarkY + barHeight > screenHeight then
watermarkY = screenHeight - barHeight
end
config.watermarkX = watermarkX
config.watermarkY = watermarkY
SaveConfig(GP_CfgPath(), config)
else
local inPanel = (mouse.x >= watermarkX and mouse.x <= (watermarkX + barWidth) and mouse.y >= watermarkY and mouse.y <= (watermarkY + barHeight))
local canDrag = inPanel and (
(mouse.y >= (watermarkY + 20) and mouse.y <= (watermarkY + barHeight)) or
(hitMainTop and not hitMoneyTop and not hitClassTop)
)
if canDrag then
isDragging = true
dragOffsetX = mouse.x - watermarkX
dragOffsetY = mouse.y - watermarkY
end
end
else
isDragging = false
end
local bgA = (config.transparentEnabled and 110 or GP_UI.colors.background[4])
local infoA = (config.transparentEnabled and 150 or 255)
UI_Color(GP_UI.colors.background[1], GP_UI.colors.background[2], GP_UI.colors.background[3], bgA)
SafeFilledRect(watermarkX, watermarkY, watermarkX + width, watermarkY + height)
local goldA = GP_GoldBarAlpha()
UI_Color(GP_UI.colors.gold[1], GP_UI.colors.gold[2], GP_UI.colors.gold[3], goldA)
SafeFilledRect(watermarkX, watermarkY, watermarkX + width, watermarkY + 2)
draw.SetFont(GP_UI.font)
local sepText = " | "
local mainX = watermarkX + paddingX
local mainW = draw.GetTextSize(mainLabel)
local moneyW = draw.GetTextSize(moneyText)
local classW = draw.GetTextSize(classText)
local sepW = draw.GetTextSize(sepText)
local classX = watermarkX + width - paddingX - classW
local leftBound = mainX + mainW + sepW
local rightBound = classX - sepW
local moneyX = math.floor(((leftBound + rightBound) - moneyW) * 0.5 + 0.5)
local maxMoneyX = rightBound - moneyW
if maxMoneyX < leftBound then maxMoneyX = leftBound end
if moneyX < leftBound then
moneyX = leftBound
elseif moneyX > maxMoneyX then
moneyX = maxMoneyX
end
if classX < (moneyX + moneyW + sepW) then
classX = moneyX + moneyW + sepW
end
local sep1X = mainX + mainW
local sep2X = moneyX + moneyW
UI_Color(GP_UI.colors.gold[1], GP_UI.colors.gold[2], GP_UI.colors.gold[3], infoA)
SafeText(mainX, watermarkY + 6, mainLabel)
UI_Color(GP_UI.colors.textDim[1], GP_UI.colors.textDim[2], GP_UI.colors.textDim[3], infoA)
SafeText(sep1X, watermarkY + 6, sepText)
UI_Color(GP_UI.colors.text[1], GP_UI.colors.text[2], GP_UI.colors.text[3], infoA)
SafeText(moneyX, watermarkY + 6, moneyText)
UI_Color(GP_UI.colors.textDim[1], GP_UI.colors.textDim[2], GP_UI.colors.textDim[3], infoA)
SafeText(sep2X, watermarkY + 6, sepText)
UI_Color(GP_UI.colors.text[1], GP_UI.colors.text[2], GP_UI.colors.text[3], infoA)
SafeText(classX, watermarkY + 6, classText)
local clickY1 = watermarkY + 6
local clickY2 = clickY1 + 18
local moneyX1 = moneyX - 6
local moneyX2 = moneyX + moneyW + 6
local classX1 = classX - 6
local classX2 = classX + classW + 6
if mousePressedDD and not isDragging then
local hitMoney = (mouse.x >= moneyX1 and mouse.x <= moneyX2 and mouse.y >= clickY1 and mouse.y <= clickY2)
local hitClass = (mouse.x >= classX1 and mouse.x <= classX2 and mouse.y >= clickY1 and mouse.y <= clickY2)
if hitMoney then
if gpDropdown.want == "cash" then
local before = tonumber(gpDropdown.openedCashThreshold) or tonumber(config.moneyThreshold) or 0
local now = tonumber(config.moneyThreshold) or 0
if before ~= now then
SaveConfig(GP_CfgPath(), config)
AddNotification("Money threshold set to $" .. tostring(config.moneyThreshold), "success")
end
gpDropdown.openedCashThreshold = nil
gpDropdown.want = nil
else
gpDropdown.want = "cash"
gpDropdown.state = "cash"
gpDropdown.openedCashThreshold = tonumber(config.moneyThreshold) or 0
end
gpDropdown.sliderDragging = false
elseif hitClass then
if gpDropdown.want == "cash" then
local before = tonumber(gpDropdown.openedCashThreshold) or tonumber(config.moneyThreshold) or 0
local now = tonumber(config.moneyThreshold) or 0
if before ~= now then
SaveConfig(GP_CfgPath(), config)
AddNotification("Money threshold set to $" .. tostring(now), "success")
end
gpDropdown.openedCashThreshold = nil
end
if gpDropdown.want == "class" then
gpDropdown.openedClassEnabled = nil
gpDropdown.openedClassTarget = nil
gpDropdown.want = nil
else
gpDropdown.want = "class"
gpDropdown.state = "class"
gpDropdown.openedClassEnabled = config.changeClassEnabled
gpDropdown.openedClassTarget = config.targetClass
end
gpDropdown.sliderDragging = false
end
end
draw.SetFont(GP_UI.font2)
local lowerLeft, lowerMid, lowerRight, lowerFarRight
local lowerGap = " | "
local lowerGap2 = " | "
local lowerGap3 = " | "
if config.hideHotkeysInUI then
lowerLeft = "AutoCredit"
lowerMid = "Cleanup"
lowerRight = "SniperBuy"
lowerFarRight = "TpWalk"
else
lowerLeft = "[" .. KeyLabel(WALK_KEY) .. "] AutoCredit"
lowerMid = "[" .. KeyLabel(CLEAN_KEY) .. "] Cleanup"
lowerRight = "[" .. KeyLabel(AUTO_KEY) .. "] SniperBuy"
lowerFarRight = "[" .. KeyLabel(TP_KEY) .. "] TpWalk"
end
local lwL = draw.GetTextSize(lowerLeft)
local lwG = draw.GetTextSize(lowerGap)
local lwM = draw.GetTextSize(lowerMid)
local lwG2 = draw.GetTextSize(lowerGap2)
local lwR = draw.GetTextSize(lowerRight)
local lwG3 = draw.GetTextSize(lowerGap3)
local lwFR = draw.GetTextSize(lowerFarRight)
local totalLower = lwL + lwG + lwM + lwG2 + lwR + lwG3 + lwFR
local centerX = watermarkX + (width / 2) - (totalLower / 2)
if config.autoWalkEnabled or autoModeWalkActive then
UI_Color(table.unpack(GP_UI.colors.gold))
else
UI_Color(table.unpack(GP_UI.colors.textDim))
end
SafeText(centerX, watermarkY + 22, lowerLeft)
UI_Color(table.unpack(GP_UI.colors.textDim))
SafeText(centerX + lwL, watermarkY + 22, lowerGap)
if globals.CurTime() < cleanupFlashUntil then
UI_Color(table.unpack(GP_UI.colors.gold))
else
UI_Color(table.unpack(GP_UI.colors.textDim))
end
SafeText(centerX + lwL + lwG, watermarkY + 22, lowerMid)
UI_Color(table.unpack(GP_UI.colors.textDim))
SafeText(centerX + lwL + lwG + lwM, watermarkY + 22, lowerGap2)
if forceSniperBuyModeEnabled then
UI_Color(255, 140, 0, infoA)
elseif config.autoBuyEnabled then
UI_Color(table.unpack(GP_UI.colors.gold))
else
UI_Color(table.unpack(GP_UI.colors.textDim))
end
SafeText(centerX + lwL + lwG + lwM + lwG2, watermarkY + 22, lowerRight)
UI_Color(table.unpack(GP_UI.colors.textDim))
SafeText(centerX + lwL + lwG + lwM + lwG2 + lwR, watermarkY + 22, lowerGap3)
if tpForceModeEnabled then
UI_Color(255, 140, 0, infoA)
elseif config.tpWalkEnabled then
UI_Color(table.unpack(GP_UI.colors.gold))
else
UI_Color(table.unpack(GP_UI.colors.textDim))
end
SafeText(centerX + lwL + lwG + lwM + lwG2 + lwR + lwG3, watermarkY + 22, lowerFarRight)
do
local _gA = GP_GoldBarAlpha()
UI_Color(GP_UI.colors.gold[1], GP_UI.colors.gold[2], GP_UI.colors.gold[3], _gA)
end
SafeFilledRect(watermarkX, watermarkY + height - 2, watermarkX + width, watermarkY + height)
if showFillbar then
local barY = watermarkY + height
UI_Color(table.unpack(GP_UI.colors.barBg))
SafeFilledRect(watermarkX, barY, watermarkX + width, barY + 6)
UI_Color(table.unpack(GP_UI.colors.barFill))
SafeFilledRect(watermarkX, barY, watermarkX + math.floor(width * progressRatio), barY + 6)
end
local panelH = 0
local panelY = watermarkY + barHeight + 4
local panelX = watermarkX
local panelW = width
local panelBelow = true
local ft = (globals.FrameTime and globals.FrameTime() or 0.016)
local targetAnim = (gpDropdown.want ~= nil) and 1 or 0
gpDropdown.anim = gpDropdown.anim + (targetAnim - gpDropdown.anim) * math.min(1, ft * 14)
if gpDropdown.anim < 0.01 and gpDropdown.want == nil then
gpDropdown.anim = 0
gpDropdown.state = nil
end
if gpDropdown.state ~= nil and gpDropdown.anim > 0 then
local requiredH
if gpDropdown.state == "cash" then
requiredH = 52
else
local classesCount = 10
local cols = 3
local rows = math.ceil(classesCount / cols)
local btnH = 18
local gap = 6
local headerH = 36
local bottomPad = 10
requiredH = headerH + (rows * btnH) + ((rows - 1) * gap) + bottomPad
end
if (screenHeight - panelY) < (requiredH + 10) then
panelBelow = false
panelY = watermarkY - requiredH - 6
end
panelH = requiredH
local panelYDraw = panelY + math.floor((1 - gpDropdown.anim) * 8)
function PanelColor(r,g,b,a)
UI_Color(r, g, b, math.floor((a or 255) * gpDropdown.anim))
end
if mousePressed and not isDragging then
local inPanel = (mouse.x >= panelX and mouse.x <= (panelX + panelW) and mouse.y >= panelYDraw and mouse.y <= (panelYDraw + panelH))
local inHeader = (mouse.y >= clickY1 and mouse.y <= clickY2 and mouse.x >= watermarkX and mouse.x <= (watermarkX + width))
if (not inPanel) and (not inHeader) then
if gpDropdown.want == "cash" then
local before = tonumber(gpDropdown.openedCashThreshold) or tonumber(config.moneyThreshold) or 0
local now = tonumber(config.moneyThreshold) or 0
if before ~= now then
SaveConfig(GP_CfgPath(), config)
AddNotification("Money threshold set to $" .. tostring(now), "success")
end
gpDropdown.openedCashThreshold = nil
end
gpDropdown.want = nil
gpDropdown.sliderDragging = false
end
end
do
local _bgA = math.floor(235 * gpDropdown.anim)
UI_Color(15, 15, 15, _bgA)
DrawRect(panelX, panelYDraw, panelW, panelH, {15, 15, 15, _bgA})
end
do
local _gA = math.floor(GP_GoldBarAlpha() * gpDropdown.anim)
UI_Color(GP_UI.colors.gold[1], GP_UI.colors.gold[2], GP_UI.colors.gold[3], _gA)
DrawRect(panelX, panelYDraw, panelW, 2, {GP_UI.colors.gold[1], GP_UI.colors.gold[2], GP_UI.colors.gold[3], _gA})
GP_Color(GP_UI.colors.gold[1], GP_UI.colors.gold[2], GP_UI.colors.gold[3], _gA)
DrawRect(panelX, panelYDraw + panelH - 2, panelW, 2, {GP_UI.colors.gold[1], GP_UI.colors.gold[2], GP_UI.colors.gold[3], _gA})
end
draw.SetFont(GP_UI.font2)
if gpDropdown.state == "cash" then
local minV, maxV, step = 1, 50000, 250
local curV = tonumber(config.moneyThreshold) or 5500
if curV < minV then curV = minV end
if curV > maxV then curV = maxV end
local label = "Threshold: $" .. tostring(curV)
PanelColor(GP_UI.colors.text[1], GP_UI.colors.text[2], GP_UI.colors.text[3], 255)
SafeText(panelX + 10, panelYDraw + 8, label)
local trackX = panelX + 10
local trackY = panelYDraw + 30
local trackW = panelW - 20
local trackH = 10
UI_Color(40, 35, 20, 255)
SafeFilledRect(trackX, trackY, trackX + trackW, trackY + trackH)
local ratio = (curV - minV) / (maxV - minV)
local fillW = math.floor(trackW * ratio)
PanelColor(GP_UI.colors.gold[1], GP_UI.colors.gold[2], GP_UI.colors.gold[3], GP_GoldBarAlpha())
SafeFilledRect(trackX, trackY, trackX + fillW, trackY + trackH)
local onTrack = (mouse.x >= trackX and mouse.x <= (trackX + trackW) and mouse.y >= trackY - 4 and mouse.y <= trackY + trackH + 4)
if mousePressedDD and onTrack then
gpDropdown.sliderDragging = true
end
if mouseReleased then
gpDropdown.sliderDragging = false
SaveConfig(GP_CfgPath(), config)
local before = tonumber(gpDropdown.openedCashThreshold) or tonumber(config.moneyThreshold) or 0
local now = tonumber(config.moneyThreshold) or 0
if before ~= now then
AddNotification("Money threshold set to $" .. tostring(now), "success")
gpDropdown.openedCashThreshold = now
end
end
if gpDropdown.sliderDragging and mouseDown then
local t = (mouse.x - trackX) / trackW
if t < 0 then t = 0 end
if t > 1 then t = 1 end
local raw = minV + (maxV - minV) * t
local snapped = math.floor((raw + step / 2) / step) * step
if snapped < minV then snapped = minV end
if snapped > maxV then snapped = maxV end
if snapped ~= config.moneyThreshold then
config.moneyThreshold = snapped
end
end
elseif gpDropdown.state == "class" then
PanelColor(GP_UI.colors.text[1], GP_UI.colors.text[2], GP_UI.colors.text[3], 255)
SafeText(panelX + 10, panelYDraw + 8, "Select class")
local classes = {"scout","soldier","pyro","demoman","heavy","engineer","medic","sniper","spy","no class"}
local btnW = math.floor((panelW - 20 - 2 * 6) / 3)
local btnH = 18
local startX = panelX + 10
local startY = panelYDraw + 36
local gap = 6
for i = 1, #classes do
local col = (i - 1) % 3
local row = math.floor((i - 1) / 3)
local bx = startX + col * (btnW + gap)
local by = startY + row * (btnH + gap)
local name = classes[i]
local isNoClass = (name == "no class")
local isSelected = false
if isNoClass then
isSelected = (not config.changeClassEnabled)
else
isSelected = (config.changeClassEnabled and config.targetClass == name)
end
if isSelected then
PanelColor(GP_UI.colors.gold[1], GP_UI.colors.gold[2], GP_UI.colors.gold[3], GP_GoldBarAlpha())
SafeFilledRect(bx, by, bx + btnW, by + btnH)
UI_Color(15, 15, 15, 255)
else
UI_Color(30, 30, 30, 255)
SafeFilledRect(bx, by, bx + btnW, by + btnH)
PanelColor(GP_UI.colors.text[1], GP_UI.colors.text[2], GP_UI.colors.text[3], 255)
end
if mousePressedDD and mouse.x >= bx and mouse.x <= (bx + btnW) and mouse.y >= by and mouse.y <= (by + btnH) then
if isNoClass then
config.changeClassEnabled = false
needToLeaveZone = false
leaveZoneStartPos = nil
leaveZoneTime = 0
pendingRetry = false
hasTriedClassChange = false
else
config.changeClassEnabled = true
config.targetClass = name
needToLeaveZone = false
leaveZoneStartPos = nil
leaveZoneTime = 0
pendingRetry = false
hasTriedClassChange = false
end
if isNoClass then
AddNotification("Auto class change disabled", "success")
else
AddNotification("Target class set to " .. tostring(name) .. " after threshold", "success")
end
SaveConfig(GP_CfgPath(), config)
gpDropdown.want = nil
end
SafeText(bx + 6, by + 2, name)
end
end
end
local currentTime = GP_Time()
UI.notifications = UI.notifications or {}
local dropdownOffset = ((gpDropdown.state ~= nil and gpDropdown.anim > 0 and panelBelow) and (panelH + 4) or 0)
local baseY = watermarkY + barHeight + 4 + dropdownOffset
baseY = math.max(0, math.min(baseY, screenHeight - UI.notificationHeight - 4))
local dt = GP_FrameDT()
local inDur = UI.notificationInDur or 0.22
local outDur = UI.notificationOutDur or 0.28
local slide = UI.notificationSlide or 16
for i = #UI.notifications, 1, -1 do
local notif = UI.notifications[i]
local age = currentTime - (notif.time or currentTime)
if age < 0 then
notif.time = currentTime
age = 0
end
local alpha = 255
local off = 0
local life = tonumber(notif.lifetime) or UI.notificationLifetime
local minLife = (inDur + outDur + 0.05)
if life < minLife then life = minLife end
if age < inDur then
local t = age / inDur
local e = GP_EaseOutCubic(t)
alpha = math.floor(255 * e + 0.5)
off = (1 - e) * slide
elseif age > (life - outDur) then
local t = (age - (life - outDur)) / outDur
local e = GP_EaseInCubic(t)
alpha = math.floor(255 * (1 - e) + 0.5)
off = -e * slide
else
alpha = 255
off = 0
end
notif.alpha = alpha
notif.offsetY = off
if age >= life and alpha <= 1 then
table.remove(UI.notifications, i)
end
end
for i = 1, #UI.notifications do
local notif = UI.notifications[i]
local targetY = baseY + (i - 1) * (UI.notificationHeight + UI.notificationSpacing)
local dt = GP_FrameDT()
local spring = UI.notificationSpring or 18.0
local t = 1 - math.exp(-spring * dt)
if notif.y == nil then notif.y = targetY end
notif.y = notif.y + (targetY - notif.y) * t
local offY = notif.offsetY or 0
if i == 1 and offY < 0 then offY = 0 end
local y = math.floor((notif.y or targetY) + offY + 0.5)
if (notif.alpha or 0) >= 5 then
DrawNotification(notif, watermarkX, y)
end
end
GP_DrawRightClickMenu(watermarkX, watermarkY, barHeight, screenWidth, screenHeight, mouse.x, mouse.y, rPressedAny)
end
GP_RST = GP_RST or {}
GP_RST.contextUntil = GP_RST.contextUntil or 0
GP_RST.queueAt = GP_RST.queueAt or 0
GP_RST.queueReason = GP_RST.queueReason or "none"
GP_RST.cooldownUntil = GP_RST.cooldownUntil or 0
GP_RST.lastEvent = GP_RST.lastEvent or "none"
GP_RST.sourceWave = GP_RST.sourceWave
GP_RST.sourceWaveReliable = GP_RST.sourceWaveReliable or false
GP_RST.lastReliableWave = GP_RST.lastReliableWave
GP_RST.lastLiveAt = GP_RST.lastLiveAt or 0
GP_RST.forceActive = GP_RST.forceActive or false
GP_RST.forceTarget = GP_RST.forceTarget or ""
GP_RST.forceReason = GP_RST.forceReason or "none"
GP_RST.forceRetries = GP_RST.forceRetries or 0
GP_RST.forceNextAt = GP_RST.forceNextAt or 0
GP_RST.forceLockUntil = GP_RST.forceLockUntil or 0
GP_RST.lastWave = GP_RST.lastWave
GP_RST.lastRound = GP_RST.lastRound
GP_RST.lastSetup = GP_RST.lastSetup
GP_RST.liveSeen = GP_RST.liveSeen or false
GP_RST.liveMaxWave = GP_RST.liveMaxWave
GP_RST.lastRuntimeArmAt = GP_RST.lastRuntimeArmAt or 0
GP_RST.runtimeTpArmDone = GP_RST.runtimeTpArmDone or false
GP_RST.sourceClass = GP_RST.sourceClass or nil
GP_RST.detectNotifyUntil = GP_RST.detectNotifyUntil or 0
GP_RST.detectNotifyKind = GP_RST.detectNotifyKind or ""
GP_RST.detectGlobalUntil = GP_RST.detectGlobalUntil or 0
GP_RST.kind = GP_RST.kind or "unknown"
GP_RST.runWaveOrdinal = GP_RST.runWaveOrdinal or 0
GP_RST.runWaveReliable = GP_RST.runWaveReliable or false
GP_RST.waitLogAt = GP_RST.waitLogAt or 0
GP_RST.ignoreAutoArmUntil = GP_RST.ignoreAutoArmUntil or 0
GP_RST.medicCycleHardResetPending = GP_RST.medicCycleHardResetPending or false
GP_RST.medicCycleHardResetSince = GP_RST.medicCycleHardResetSince or 0
GP_RST.medicCycleSwapLockUntil = GP_RST.medicCycleSwapLockUntil or 0
GP_RST_CONTEXT_SECONDS = GP_RST_CONTEXT_SECONDS or 25.0
GP_RST_QUEUE_DELAY = GP_RST_QUEUE_DELAY or 0.60
GP_RST_RESTART_COOLDOWN = GP_RST_RESTART_COOLDOWN or 1.50
GP_RST_FORCE_RETRY_DELAY = GP_RST_FORCE_RETRY_DELAY or 0.40
GP_RST_FORCE_MAX_RETRIES = GP_RST_FORCE_MAX_RETRIES or 70
GP_RST_FORCE_LOCK_SECONDS = GP_RST_FORCE_LOCK_SECONDS or 12.0
GP_RST.voteRestartWindowUntil = GP_RST.voteRestartWindowUntil or 0
GP_RST.voteRestartCandidate = GP_RST.voteRestartCandidate or false
GP_RST.voteRestartWeakCandidate = GP_RST.voteRestartWeakCandidate or false
GP_RST.voteRestartPassedUntil = GP_RST.voteRestartPassedUntil or 0
GP_RST_VOTE_WINDOW_SECONDS = GP_RST_VOTE_WINDOW_SECONDS or 20.0
GP_RST_SNIPER_AFTER_WAVE = 2
function GP_RST_Now()
local t = 0
pcall(function()
if globals and globals.RealTime then t = globals.RealTime()
elseif globals and globals.CurTime then t = globals.CurTime()
end
end)
return t
end
function GP_RST_IsTransitionLockActive()
local now = GP_RST_Now()
local k = tostring(GP_RST.kind or "unknown")
if now < (GP_RST.detectGlobalUntil or 0) then
return true
end
if (k == "vote" or k == "fail") and (now < (GP_RST.contextUntil or 0)) then
return true
end
if ((GP_RST.queueAt or 0) > now) then
return true
end
if tpWaitForRoundReload == true then
return true
end
return false
end
function GP_RST_Log(msg)
end
function GP_RST_GetVotePayloadText(ev)
if not ev then return "" end
local keys = {
"issue", "details", "detailstr", "vote_name", "vote_option", "reason",
"text", "message", "chat", "param1", "param2",
"option1", "option2", "option3", "option4", "option5"
}
local parts = {}
for i = 1, #keys do
local k = keys[i]
local v = GP_SafeCall(function()
if ev and ev.GetString then return ev:GetString(k) end
return nil
end, nil)
if type(v) == "string" and v ~= "" then
parts[#parts + 1] = string.lower(v)
end
end
return table.concat(parts, " | ")
end
function GP_RST_IsNegativeVotePayload(ev)
local s = GP_RST_GetVotePayloadText(ev)
if s == "" then
return false
end
local hasNegative =
(string.find(s, "kick", 1, true) ~= nil) or
(string.find(s, "ban", 1, true) ~= nil) or
(string.find(s, "scramble", 1, true) ~= nil) or
(string.find(s, "changelevel", 1, true) ~= nil) or
(string.find(s, "nextlevel", 1, true) ~= nil) or
(string.find(s, "difficulty", 1, true) ~= nil) or
(string.find(s, "surrender", 1, true) ~= nil) or
(string.find(s, "forfeit", 1, true) ~= nil)
return hasNegative
end
function GP_RST_IsRestartVotePayload(ev)
local s = GP_RST_GetVotePayloadText(ev)
if s == "" then
return false
end
local hasRestart =
(string.find(s, "restart", 1, true) ~= nil) or
(string.find(s, "reset", 1, true) ~= nil) or
(string.find(s, "tf_vote_restart", 1, true) ~= nil) or
(string.find(s, "mvm_restart", 1, true) ~= nil) or
(string.find(s, "restart round", 1, true) ~= nil)
if not hasRestart then
return false
end
if GP_RST_IsNegativeVotePayload(ev) then
local explicitRestart =
(string.find(s, "tf_vote_restart", 1, true) ~= nil) or
(string.find(s, "mvm_restart", 1, true) ~= nil) or
(string.find(s, "restart round", 1, true) ~= nil)
if not explicitRestart then
return false
end
end
return true
end
function GP_RST_NotifyDetected(kind, reason)
local k = tostring(kind or "unknown")
if k ~= "vote" and k ~= "fail" then return end
local r = tostring(reason or "")
if r == "vote_options" or r == "vote_cast" or r == "vote_changed" then
return
end
local now = GP_RST_Now()
if now < (GP_RST.detectGlobalUntil or 0) then
return
end
local hold = (k == "vote") and 1.50 or 1.00
if now < (GP_RST.detectNotifyUntil or 0) and tostring(GP_RST.detectNotifyKind or "") == k then
return
end
GP_RST.detectNotifyUntil = now + hold
GP_RST.detectNotifyKind = k
GP_RST.detectGlobalUntil = now + 6.00
if GP_InstantRespawnSuspend then pcall(GP_InstantRespawnSuspend, 8.0, "rst_detect_" .. tostring(k)) end
AddNotification("Map fail/restart detected - reset state", "warning", 5.0)
GP_RST_Log("detected popup: kind=" .. tostring(k) .. " by=" .. tostring(reason))
end
function GP_RST_Reset(reason)
GP_RST.contextUntil = 0
GP_RST.queueAt = 0
GP_RST.queueReason = "none"
GP_RST.cooldownUntil = 0
GP_RST.sourceWave = nil
GP_RST.sourceWaveReliable = false
GP_RST.sourceClass = nil
GP_RST.kind = "unknown"
GP_RST.forceActive = false
GP_RST.forceTarget = ""
GP_RST.forceReason = "none"
GP_RST.forceRetries = 0
GP_RST.forceNextAt = 0
GP_RST.forceLockUntil = 0
GP_RST.waitLogAt = 0
GP_RST.ignoreAutoArmUntil = 0
GP_RST.runtimeTpArmDone = false
GP_RST.medicCycleHardResetPending = false
GP_RST.medicCycleHardResetSince = 0
GP_RST.medicCycleSwapLockUntil = 0
GP_RST.runWaveOrdinal = 0
GP_RST.runWaveReliable = false
GP_RST.liveSeen = false
GP_RST.liveMaxWave = nil
GP_RST.lastWave = nil
GP_RST.lastReliableWave = nil
GP_RST.lastRound = nil
GP_RST.lastSetup = nil
GP_RST.lastLiveAt = 0
GP_RST.detectNotifyUntil = 0
GP_RST.detectNotifyKind = ""
GP_RST.detectGlobalUntil = 0
GP_RST.voteRestartWindowUntil = 0
GP_RST.voteRestartCandidate = false
GP_RST.voteRestartWeakCandidate = false
GP_RST.voteRestartPassedUntil = 0
gpF4Wave2FailPauseUntil = 0
if reason then
GP_RST_Log("reset: " .. tostring(reason))
end
end
function GP_RST_GetConfiguredTargetClass()
if not config then return nil end
if not config.changeClassEnabled then return nil end
local tc = config.targetClass
if type(tc) ~= "string" then return nil end
tc = tc:lower()
if tc == "" then return nil end
local valid = {
scout=true, sniper=true, soldier=true, demoman=true, medic=true,
heavy=true, heavyweapons=true, pyro=true, spy=true, engineer=true
}
if valid[tc] then return tc end
return nil
end
function GP_RST_EventKind(name)
local n = tostring(name or "")
if n == "vote_options" or n == "vote_cast" or n == "vote_changed" then
return "vote"
end
if n == "teamplay_restart_round" or n == "mvm_wave_failed" then
return "fail"
end
return "unknown"
end
function GP_RST_UpdateKind(newKind)
local old = GP_RST.kind or "unknown"
if newKind == "vote" then
GP_RST.kind = "vote"
return
end
if old == "vote" then
return
end
if newKind == "fail" then
GP_RST.kind = "fail"
return
end
if old == "unknown" and newKind ~= nil then
GP_RST.kind = newKind
end
end
function GP_RST_Arm(reason, kindOverride)
local t = GP_RST_Now()
local untilT = t + GP_RST_CONTEXT_SECONDS
if untilT > (GP_RST.contextUntil or 0) then
GP_RST.contextUntil = untilT
end
local kind = kindOverride or GP_RST_EventKind(reason)
GP_RST_UpdateKind(kind)
GP_RST.runtimeTpArmDone = false
GP_RST_NotifyDetected(GP_RST.kind or kind, reason)
if (GP_RST.kind == "vote" or GP_RST.kind == "fail") then
local holdUntil = t + 8.0
if holdUntil > (GP_RST.detectGlobalUntil or 0) then
GP_RST.detectGlobalUntil = holdUntil
end
end
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
tpRespawnRearmPending = false
tpForceRestoreAwaitRespawn = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
tpToggleSpawnLock = false
tpToggleSpawnLockArmedAt = 0
tpFallbackWaitPopupShown = false
tpFallbackNextWaitNotify = 0
if GP_TP_StopUseVerify then pcall(GP_TP_StopUseVerify) end
if GP_TP_ResetPathState then pcall(GP_TP_ResetPathState) end
if GP_TP_ResetStuckTracker then pcall(GP_TP_ResetStuckTracker) end
if GP_InstantRespawnSuspend then pcall(GP_InstantRespawnSuspend, 8.0, "rst_arm_" .. tostring(reason or "event")) end
if GP_F4_IsFeatureEnabled and GP_F4_OnDisconnectCycle then
local kNow = tostring(GP_RST.kind or kind or "unknown")
if kNow == "vote" or kNow == "fail" then
pcall(GP_F4_OnDisconnectCycle, "restart_fail_arm")
end
end
do
local me = (entities and entities.GetLocalPlayer and entities.GetLocalPlayer()) or nil
local cls = GP_GetCurrentClassName(me)
if type(cls) == "string" then
cls = string.lower(cls)
else
cls = nil
end
GP_RST.sourceClass = cls
end
if (GP_RST.kind or "unknown") == "vote" then
GP_RST.sourceWave = 0
GP_RST.sourceWaveReliable = true
acPostWaveSwapLatched = false
else
GP_RST.sourceWaveReliable = false
local w = GP_GetWaveNumber()
if type(w) == "number" then
GP_RST.sourceWave = w
GP_RST.sourceWaveReliable = true
elseif type(GP_RST.lastReliableWave) == "number" then
GP_RST.sourceWave = GP_RST.lastReliableWave
GP_RST.sourceWaveReliable = true
elseif type(GP_RST.runWaveOrdinal) == "number" and GP_RST.runWaveOrdinal > 0 and GP_RST.runWaveReliable == true then
GP_RST.sourceWave = GP_RST.runWaveOrdinal
GP_RST.sourceWaveReliable = true
elseif GP_RST.liveSeen then
GP_RST.sourceWave = 1
GP_RST.sourceWaveReliable = false
else
GP_RST.sourceWave = 0
GP_RST.sourceWaveReliable = false
end
if type(GP_RST.sourceWave) == "number" and GP_RST.sourceWave <= 1 then
acPostWaveSwapLatched = false
end
end
if (GP_RST.kind == "fail")
and (type(GP_RST.sourceWave) == "number")
and (GP_RST.sourceWave >= (GP_RST_SNIPER_AFTER_WAVE or 2)) then
local f4HoldUntil = t + 30.0
if f4HoldUntil > (gpF4Wave2FailPauseUntil or 0) then
gpF4Wave2FailPauseUntil = f4HoldUntil
end
if GP_F4_IsFeatureEnabled and GP_F4_IsFeatureEnabled() then
GP_F4_SetGuiAutoReady(false, true)
end
end
GP_RST_Log(
"arm by=" .. tostring(reason) ..
" kind=" .. tostring(GP_RST.kind) ..
" sourceClass=" .. tostring(GP_RST.sourceClass) ..
" sourceWave=" .. tostring(GP_RST.sourceWave) ..
" reliable=" .. tostring(GP_RST.sourceWaveReliable) ..
" contextLeft=" .. string.format("%.1f", math.max(0, GP_RST.contextUntil - t))
)
end
function GP_RST_Queue(reason)
local t = GP_RST_Now()
if t < (GP_RST.cooldownUntil or 0) then
return
end
GP_RST.queueAt = t + GP_RST_QUEUE_DELAY
GP_RST.queueReason = reason or "event_chain"
GP_RST.cooldownUntil = t + GP_RST_RESTART_COOLDOWN
GP_RST_Log("queue reason=" .. tostring(GP_RST.queueReason) .. " in " .. string.format("%.1f", GP_RST_QUEUE_DELAY) .. "s")
end
function GP_RST_ClassNum(cls)
if cls == "scout" then return 1 end
if cls == "sniper" then return 2 end
if cls == "soldier" then return 3 end
if cls == "demoman" then return 4 end
if cls == "medic" then return 5 end
if cls == "heavy" or cls == "heavyweapons" then return 6 end
if cls == "pyro" then return 7 end
if cls == "spy" then return 8 end
if cls == "engineer" then return 9 end
return nil
end
function GP_RST_RearmTpWalkNormal(reason)
if tpForceModeEnabled then return end
if not (config and config.tpWalkEnabled) then return end
local nowCT = (globals and globals.CurTime and globals.CurTime()) or GP_RST_Now()
local rearmTime = nowCT - (TELEPORTER_AUTOWALK_DELAY or 1.0)
tpToggleNeedsTrigger = false
sniperUpgradeCompleted = true
sniperUpgradeCompletedTime = rearmTime
teleporterJustUsed = false
tpLastReachedTeleporterAt = 0
teleporterManuallyDisabled = false
teleporterConfig.autoWalkEnabled = false
tpRespawnRearmPending = false
tpForceRestoreAwaitRespawn = false
tpToggleSpawnLock = true
tpStickyArmed = true
reloadMoveLock = true
tpWaitForRoundReload = true
tpWaitForRoundReloadReason = tostring(reason or "restart_fail")
tpWaitForRoundReloadArmedAt = nowCT
tpLastAliveState = nil
tpIsWaitingForTeleporter = false
tpNoTeleFallbackActive = false
tpTeleporterSeenCount = 0
if GP_TP_StopUseVerify then pcall(GP_TP_StopUseVerify) end
GP_TP_ResetPathState()
GP_TP_ResetStuckTracker()
AddNotification("TpWalk armed after fail/restart - waiting for round reload", "warning")
end
function GP_RST_RearmForceTpWalk(reason)
if not tpForceModeEnabled then return end
local nowCT = (globals and globals.CurTime and globals.CurTime()) or GP_RST_Now()
local rearmTime = nowCT - (TELEPORTER_AUTOWALK_DELAY or 1.0)
tpStickyArmed = true
tpForceRestoreAwaitRespawn = true
tpRespawnRearmPending = false
teleporterJustUsed = false
tpLastReachedTeleporterAt = 0
teleporterManuallyDisabled = false
teleporterConfig.autoWalkEnabled = false
sniperUpgradeCompleted = true
sniperUpgradeCompletedTime = rearmTime
tpToggleSpawnLock = true
reloadMoveLock = true
tpWaitForRoundReload = true
tpWaitForRoundReloadReason = tostring(reason or "restart_fail_force")
tpWaitForRoundReloadArmedAt = nowCT
tpLastAliveState = nil
tpIsWaitingForTeleporter = false
tpNoTeleFallbackActive = false
tpTeleporterSeenCount = 0
if GP_TP_StopUseVerify then pcall(GP_TP_StopUseVerify) end
GP_TP_ResetPathState()
GP_TP_ResetStuckTracker()
local me = (entities and entities.GetLocalPlayer and entities.GetLocalPlayer()) or nil
if me and me.IsAlive and (not me:IsAlive()) then
tpRespawnRearmPending = true
end
AddNotification("Force TpWalk armed after fail/restart - waiting for round reload", "warning")
end
function GP_RST_DecideTarget()
local sourceWave = GP_RST.sourceWave
if type(sourceWave) ~= "number" then
sourceWave = 0
end
local sourceReliable = (GP_RST.sourceWaveReliable == true)
local kind = GP_RST.kind or "unknown"
local acOn = (config and config.autoWalkEnabled) and true or false
local sbOn = (config and config.autoBuyEnabled) and true or false
local tc = GP_RST_GetConfiguredTargetClass()
local sourceClass = tostring(GP_RST.sourceClass or ""):lower()
local rawTarget = tostring((config and config.targetClass) or ""):lower()
local targetExplicitNonSniper = (rawTarget ~= "" and rawTarget ~= "sniper")
local allowSniperFallback = (not targetExplicitNonSniper)
local wasSniperBeforeRestart = (sourceClass == "sniper")
local tpwalkNormalSniperRecovery = ((config and config.tpWalkEnabled) and (not tpForceModeEnabled) and (not acOn) and (not sbOn) and wasSniperBeforeRestart)
if tpwalkNormalSniperRecovery then
return "sniper", "restart_tpwalk_normal_sniper", "tpwalk_sniper"
end
local sniperAfterWave = 2
GP_RST.lastDecisionThreshold = sniperAfterWave
if kind == "vote" then
GP_RST.lastDecisionWave2Plus = false
if acOn then
return "medic", "vote_restart_prewave1_autocredit", "medic_cycle"
end
if tc then
if tc == "sniper" and sbOn then
return "sniper", "vote_restart_target_sniperbuy", "sniper_cycle"
end
return tc, "vote_restart_target_class", "target_only"
end
return nil, "vote_restart_no_path", "none"
end
local wave2plus = (kind == "fail" and sourceReliable and sourceWave >= sniperAfterWave)
if sourceWave <= 1 then
wave2plus = false
end
GP_RST.lastDecisionWave2Plus = wave2plus
if kind == "fail" and wave2plus then
if tc then
if tc == "sniper" and sbOn then
return "sniper", "fail_wave2plus_target_sniperbuy", "sniper_cycle"
end
return tc, "fail_wave2plus_target_class", "target_only"
end
return nil, "fail_wave2plus_no_path", "none"
end
if acOn then
return "medic", "prewave_autocredit", "medic_cycle"
end
if tc then
if tc == "sniper" and sbOn then
return "sniper", "prewave_target_sniperbuy", "sniper_cycle"
end
return tc, "prewave_target_class", "target_only"
end
if (config and config.tpWalkEnabled) and (not tpForceModeEnabled) then
return "__tpwalk__", "prewave_tpwalk_rearm", "tpwalk_rearm"
end
return nil, "no_matching_path", "none"
end
function GP_RST_PrepareMedicCycle()
ForceCleanup()
acPostWaveSwapLatched = false
if GP_F4_IsFeatureEnabled and GP_F4_IsFeatureEnabled() then
gpF4PendingRejoinCycle = false
gpF4RequireTpForReady = true
GP_F4_Sync("restart_medic_cycle", true)
end
autobuyRunOnceDone = false
autobuyDoneAnnounced = false
sniperUpgradesComplete = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
sniperUpgradeCooldownUntil = 0
sniperReloadAwaitRespawn = false
sniperReloadRespawnPending = false
sniperLastAliveState = nil
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
thresholdNotificationShown = false
medicThresholdReached = false
gpPhase = "MEDIC_FARM"
autoWalkPaused = false
autoWalkPauseReason = nil
lastWavePauseWarning = false
lastAutoWalkPauseReason = nil
shouldGuidePlayer = false
midpoint = nil
needToLeaveZone = false
leaveZoneStartPos = nil
leaveZoneTime = 0
hasTriedClassChange = false
pendingClassChange = false
classChangeUsePreWaveRules = false
pendingRetry = false
pendingRetryTargetClass = nil
pendingRetryTargetUntil = 0
classChangeSwapPopupShown = false
classChangeDidRefund = false
classChangeRefundTime = 0
classChangeDidCleanup = false
classChangeCleanupTime = 0
classChangeReadyTime = 0
local rstNow = GP_RST_Now()
GP_RST.medicCycleHardResetPending = true
GP_RST.medicCycleHardResetSince = rstNow
GP_RST.medicCycleSwapLockUntil = rstNow + 180.0
end
function GP_RST_PrepareSniperCycle()
ForceCleanup()
gpPhase = "SNIPER_BUY"
isUpgradingSniper = false
sniperUpgradesComplete = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
sniperUpgradeCooldownUntil = 0
autobuyRunOnceDone = false
autobuyDoneAnnounced = false
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
tpNoTeleFallbackActive = false
end
function GP_RST_StartForce(targetClass, reason)
if not targetClass or targetClass == "" then return end
GP_RST.forceActive = true
GP_RST.forceTarget = tostring(targetClass)
GP_RST.forceReason = tostring(reason or "restart")
GP_RST.forceRetries = 0
GP_RST.forceNextAt = 0
local baseLock = (GP_RST_FORCE_LOCK_SECONDS or 12.0)
local k = tostring(GP_RST.kind or "unknown")
if k == "vote" then
baseLock = math.max(baseLock, 30.0)
elseif k == "fail" then
baseLock = math.max(baseLock, 20.0)
end
GP_RST.forceLockUntil = GP_RST_Now() + baseLock
GP_RST_Log("FORCE START target=" .. tostring(GP_RST.forceTarget) .. " reason=" .. tostring(GP_RST.forceReason))
end
function GP_RST_StopForce(reason)
GP_RST_Log("FORCE STOP: " .. tostring(reason))
GP_RST.forceActive = false
GP_RST.forceTarget = ""
GP_RST.forceReason = "none"
GP_RST.forceRetries = 0
GP_RST.forceNextAt = 0
GP_RST.forceLockUntil = 0
GP_RST.contextUntil = 0
GP_RST.queueAt = 0
GP_RST.queueReason = "none"
GP_RST.sourceWave = nil
GP_RST.sourceWaveReliable = false
GP_RST.sourceClass = nil
GP_RST.kind = "unknown"
GP_RST.waitLogAt = 0
GP_RST.ignoreAutoArmUntil = GP_RST_Now() + 6.0
GP_RST.runtimeTpArmDone = false
end
function GP_RST_IsClassChangeAllowed()
local setup = GP_TP_IsSetupPhase()
local rs = GP_GetRoundState()
if setup == true then
return true
end
if type(rs) == "number" then
if rs == 4 then return false end
if rs >= 8 then return true end
end
return false
end
function GP_RST_TickForce()
if not GP_RST.forceActive then return end
local t = GP_RST_Now()
local me = entities.GetLocalPlayer()
if not me then
return
end
local curClass = GP_GetCurrentClassName(me)
if curClass == GP_RST.forceTarget then
GP_RST_StopForce("target class reached")
return
end
if t >= (GP_RST.forceLockUntil or 0) then
GP_RST_StopForce("lock timeout")
return
end
if (GP_RST.forceRetries or 0) >= (GP_RST_FORCE_MAX_RETRIES or 70) then
GP_RST_StopForce("max retries")
return
end
if not GP_RST_IsClassChangeAllowed() then
if t >= (GP_RST.waitLogAt or 0) then
GP_RST.waitLogAt = t + 0.75
GP_RST_Log("force wait: class change not allowed yet (between waves only)")
end
return
end
if t >= (GP_RST.forceNextAt or 0) then
GP_RST.forceNextAt = t + (GP_RST_FORCE_RETRY_DELAY or 0.4)
GP_RST.forceRetries = (GP_RST.forceRetries or 0) + 1
local c = GP_RST.forceTarget
local n = GP_RST_ClassNum(c)
client.Command("joinclass " .. tostring(c), true)
client.Command("join_class " .. tostring(c), true)
if n then
client.Command("joinclass " .. tostring(n), true)
end
GP_RST_Log("force retry=" .. tostring(GP_RST.forceRetries) .. " target=" .. tostring(c) .. " current=" .. tostring(curClass))
end
end
function GP_RST_TickState()
local prevWave = GP_RST.lastWave
local prevRound = GP_RST.lastRound
local prevSetup = GP_RST.lastSetup
local wave = GP_GetWaveNumber()
local rs = GP_GetRoundState()
local setup = GP_TP_IsSetupPhase()
local t = GP_RST_Now()
if prevRound ~= nil and rs ~= nil and prevRound ~= 4 and rs == 4 then
GP_RST.runWaveOrdinal = (tonumber(GP_RST.runWaveOrdinal) or 0) + 1
GP_RST.runWaveReliable = false
GP_RST.liveSeen = true
GP_RST.lastLiveAt = t
if GP_RST.runWaveOrdinal > (tonumber(GP_RST.liveMaxWave) or 0) then
GP_RST.liveMaxWave = GP_RST.runWaveOrdinal
end
end
if rs == 4 then
GP_RST.liveSeen = true
GP_RST.lastLiveAt = t
end
if type(wave) == "number" then
if type(GP_RST.liveMaxWave) ~= "number" or wave > GP_RST.liveMaxWave then
GP_RST.liveMaxWave = wave
end
GP_RST.lastWave = wave
GP_RST.lastReliableWave = wave
end
local setupEdge = (prevSetup ~= nil and prevSetup == false and setup == true)
local liveToNonLive = (prevRound ~= nil and rs ~= nil and prevRound == 4 and rs ~= 4)
local waveDrop = (prevWave ~= nil and wave ~= nil and wave < prevWave)
GP_RST.lastSetup = setup
GP_RST.lastRound = rs
end
function GP_RST_TickQueuedStart()
local t = GP_RST_Now()
if (GP_RST.queueAt or 0) > 0 and t >= GP_RST.queueAt then
GP_RST.queueAt = 0
local queuedReason = GP_RST.queueReason or "event_chain"
GP_RST.queueReason = "none"
local target, why, mode = GP_RST_DecideTarget()
GP_RST_Log(
"decide target=" .. tostring(target) ..
" mode=" .. tostring(mode) ..
" why=" .. tostring(why) ..
" kind=" .. tostring(GP_RST.kind) ..
" sourceClass=" .. tostring(GP_RST.sourceClass) ..
" sourceWave=" .. tostring(GP_RST.sourceWave) ..
" reliable=" .. tostring(GP_RST.sourceWaveReliable) ..
" runWaveOrdinal=" .. tostring(GP_RST.runWaveOrdinal) ..
" threshold=" .. tostring(GP_RST.lastDecisionThreshold) ..
" wave2plus=" .. tostring(GP_RST.lastDecisionWave2Plus)
)
if (GP_RST.kind == "vote" or GP_RST.kind == "fail") and (not GP_RST.runtimeTpArmDone) then
if tpForceModeEnabled then
GP_RST_RearmForceTpWalk(queuedReason)
GP_RST.runtimeTpArmDone = true
GP_RST.lastRuntimeArmAt = t
else
if mode == "tpwalk_sniper"
or (((config and config.tpWalkEnabled) == true) and (target == "sniper" or tostring((GP_RST and GP_RST.sourceClass) or ""):lower() == "sniper")) then
GP_RST_RearmTpWalkNormal(queuedReason)
GP_RST.runtimeTpArmDone = true
GP_RST.lastRuntimeArmAt = t
end
end
end
if target and target ~= "" then
if mode == "medic_cycle" and target == "medic" then
GP_RST_PrepareMedicCycle()
GP_RST_StartForce(target, queuedReason .. ":" .. tostring(why))
elseif mode == "sniper_cycle" and target == "sniper" then
GP_RST_PrepareSniperCycle()
GP_RST_StartForce(target, queuedReason .. ":" .. tostring(why))
elseif mode == "tpwalk_rearm" and target == "__tpwalk__" then
GP_RST.contextUntil = 0
GP_RST.sourceWave = nil
GP_RST.sourceWaveReliable = false
GP_RST.sourceClass = nil
GP_RST.kind = "unknown"
elseif mode == "tpwalk_sniper" and target == "sniper" then
local meNow = (entities and entities.GetLocalPlayer and entities.GetLocalPlayer()) or nil
local curCls = GP_GetCurrentClassName(meNow)
if curCls ~= "sniper" then
ForceCleanup()
GP_RST_StartForce("sniper", queuedReason .. ":" .. tostring(why))
AddNotification("TpWalk: fail/restart detected - switching to Sniper", "info", 5.0)
else
GP_RST.contextUntil = 0
GP_RST.sourceWave = nil
GP_RST.sourceWaveReliable = false
GP_RST.sourceClass = nil
GP_RST.kind = "unknown"
end
else
if target == "sniper" and (config and config.autoBuyEnabled) and (not forceSniperBuyModeEnabled) then
GP_RST_PrepareSniperCycle()
else
ForceCleanup()
end
GP_RST_StartForce(target, queuedReason .. ":" .. tostring(why))
end
else
GP_RST.contextUntil = 0
GP_RST.sourceWave = nil
GP_RST.sourceWaveReliable = false
GP_RST.sourceClass = nil
GP_RST.kind = "unknown"
end
end
GP_RST_TickForce()
end
function GP_RST_OnEvent(name, ev)
GP_RST.lastEvent = name or "none"
if name == "mvm_begin_wave" then
local idx = GP_SafeCall(function() return ev and ev.GetInt and ev:GetInt("wave_index") end, nil)
if type(idx) == "number" then
if idx >= 0 and idx < 100 then
GP_RST.runWaveOrdinal = idx + 1
GP_RST.lastReliableWave = GP_RST.runWaveOrdinal
GP_RST.runWaveReliable = true
end
elseif (tonumber(GP_RST.runWaveOrdinal) or 0) <= 0 then
GP_RST.runWaveOrdinal = 1
GP_RST.runWaveReliable = false
end
GP_RST.liveSeen = true
GP_RST.lastLiveAt = GP_RST_Now()
end
if name == "vote_options" then
local now = GP_RST_Now()
local isRestart = GP_RST_IsRestartVotePayload(ev)
local isNegative = GP_RST_IsNegativeVotePayload(ev)
if isRestart then
GP_RST.voteRestartCandidate = true
GP_RST.voteRestartWeakCandidate = false
GP_RST.voteRestartWindowUntil = now + (GP_RST_VOTE_WINDOW_SECONDS or 20.0)
GP_RST_Arm(name, "vote")
elseif not isNegative then
GP_RST.voteRestartCandidate = false
GP_RST.voteRestartWeakCandidate = true
GP_RST.voteRestartWindowUntil = now + (GP_RST_VOTE_WINDOW_SECONDS or 20.0)
GP_RST_Log("vote_options: ambiguous payload -> weak restart context")
else
GP_RST.voteRestartCandidate = false
GP_RST.voteRestartWeakCandidate = false
GP_RST.voteRestartWindowUntil = 0
GP_RST_Log("ignore vote_options (not restart vote)")
end
return
end
if name == "vote_cast" or name == "vote_changed" then
local now = GP_RST_Now()
if (GP_RST.voteRestartCandidate == true) and (now < (GP_RST.voteRestartWindowUntil or 0)) then
GP_RST_Arm(name, "vote")
elseif (GP_RST.voteRestartWeakCandidate == true) and (now < (GP_RST.voteRestartWindowUntil or 0)) then
GP_RST_Log(tostring(name) .. ": weak restart context pending vote result")
else
GP_RST_Log("ignore " .. tostring(name) .. " (no restart-vote context)")
end
return
end
if name == "vote_passed" or name == "vote_ended" then
local now = GP_RST_Now()
local inWindow = (now < (GP_RST.voteRestartWindowUntil or 0))
local strongCtx = (GP_RST.voteRestartCandidate == true) and inWindow
local weakCtx = (GP_RST.voteRestartWeakCandidate == true) and inWindow
local isRestart = GP_RST_IsRestartVotePayload(ev)
local isNegative = GP_RST_IsNegativeVotePayload(ev)
local confirmRestart = false
if isRestart then
confirmRestart = true
elseif strongCtx then
confirmRestart = true
elseif weakCtx and (not isNegative) then
confirmRestart = true
end
if confirmRestart then
GP_RST.voteRestartPassedUntil = now + 20.0
GP_RST_Log("vote pass confirmed -> immediate restart arm")
GP_RST_Arm("vote_passed", "vote")
if GP_InstantRespawnSuspend then GP_InstantRespawnSuspend(8.0, "vote_passed") end
GP_RST_Queue("vote_passed")
else
GP_RST_Log("ignore " .. tostring(name) .. " (not a restart vote)")
end
GP_RST.voteRestartCandidate = false
GP_RST.voteRestartWeakCandidate = false
GP_RST.voteRestartWindowUntil = 0
return
end
if name == "vote_failed" then
GP_RST.voteRestartCandidate = false
GP_RST.voteRestartWeakCandidate = false
GP_RST.voteRestartWindowUntil = 0
return
end
if name == "teamplay_restart_round" then
local now = GP_RST_Now()
local fromVote =
((GP_RST.voteRestartCandidate == true or GP_RST.voteRestartWeakCandidate == true) and (now < (GP_RST.voteRestartWindowUntil or 0))) or
(now < (GP_RST.voteRestartPassedUntil or 0))
if fromVote then
GP_RST_Arm(name, "vote")
if GP_InstantRespawnSuspend then GP_InstantRespawnSuspend(8.0, "teamplay_restart_round_vote") end
GP_RST_Queue("teamplay_restart_round_vote")
else
GP_RST_Arm(name, "fail")
if GP_InstantRespawnSuspend then GP_InstantRespawnSuspend(8.0, "teamplay_restart_round_fail") end
GP_RST_Queue("teamplay_restart_round_fail")
end
return
end
if name == "mvm_wave_failed" then
GP_RST_Arm(name, GP_RST_EventKind(name))
if GP_InstantRespawnSuspend then GP_InstantRespawnSuspend(8.0, "mvm_wave_failed") end
return
end
if name == "teamplay_round_win" then
local winTeam = GP_SafeCall(function() return ev and ev.GetInt and ev:GetInt("team") end, nil)
if type(winTeam) == "number" and winTeam == 3 then
GP_RST_Arm("teamplay_round_win_blue", "fail")
if GP_InstantRespawnSuspend then GP_InstantRespawnSuspend(8.0, "teamplay_round_win_blue") end
GP_RST_Queue("teamplay_round_win_blue")
return
end
end
if name == "teamplay_round_start" or name == "mvm_reset_stats"
or name == "localplayer_respawn" or name == "player_spawn"
or name == "post_inventory_application" then
local t = GP_RST_Now()
if (name == "teamplay_round_start" or name == "mvm_reset_stats")
and (GP_RST.voteRestartWeakCandidate == true)
and (t < (GP_RST.voteRestartWindowUntil or 0)) then
GP_RST_Log("weak restart context confirmed by " .. tostring(name))
GP_RST.voteRestartPassedUntil = t + 20.0
GP_RST_Arm("weak_" .. tostring(name), "vote")
if GP_InstantRespawnSuspend then GP_InstantRespawnSuspend(8.0, "weak_" .. tostring(name)) end
GP_RST_Queue("weak_" .. tostring(name))
GP_RST.voteRestartCandidate = false
GP_RST.voteRestartWeakCandidate = false
GP_RST.voteRestartWindowUntil = 0
end
if tpWaitForRoundReload and (name == "teamplay_round_start" or name == "mvm_reset_stats") then
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
teleporterConfig.autoWalkEnabled = false
tpToggleSpawnLock = false
tpFallbackWaitPopupShown = false
tpFallbackNextWaitNotify = 0
if GP_TP_StopUseVerify then pcall(GP_TP_StopUseVerify) end
if GP_TP_ResetPathState then pcall(GP_TP_ResetPathState) end
if GP_TP_ResetStuckTracker then pcall(GP_TP_ResetStuckTracker) end
local nowCT = (globals and globals.CurTime and globals.CurTime()) or t
sniperUpgradeCompletedTime = nowCT - (TELEPORTER_AUTOWALK_DELAY or 1.0)
if tpForceModeEnabled and tpForceRestoreAwaitRespawn then
local meNow = (entities and entities.GetLocalPlayer and entities.GetLocalPlayer()) or nil
local aliveNow = (meNow and meNow.IsAlive and meNow:IsAlive()) and true or false
if aliveNow then
tpForceRestoreAwaitRespawn = false
tpRespawnRearmPending = false
tpStickyArmed = true
teleporterManuallyDisabled = false
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
tpIsWaitingForTeleporter = false
tpNoTeleFallbackActive = false
tpTeleporterSeenCount = (TP_TELE_STABLE_SCANS or 8)
reloadMoveLock = false
else
tpRespawnRearmPending = true
reloadMoveLock = true
end
tpLastAliveState = aliveNow
end
if tpForceModeEnabled then
AddNotification("Force TpWalk: round reload detected", "info")
else
AddNotification("TpWalk: round reload detected", "info")
end
end
if t < (GP_RST.contextUntil or 0) then
GP_RST_Queue("followup_" .. tostring(name))
end
if name == "teamplay_round_start" or name == "mvm_reset_stats" then
GP_RST.runWaveOrdinal = 0
GP_RST.runWaveReliable = false
GP_RST.liveSeen = false
GP_RST.liveMaxWave = nil
GP_RST.lastWave = nil
GP_RST.lastReliableWave = nil
GP_RST.voteRestartPassedUntil = 0
end
end
end
gp_partyKillLastTrigger = gp_partyKillLastTrigger or 0
gp_partyLeaveLastTrigger = gp_partyLeaveLastTrigger or 0
function GP_TryGetEventString(ev, key)
if not ev or not key then return nil end
local ok, v = pcall(function()
if ev.GetString then return ev:GetString(key) end
return nil
end)
if ok and type(v) == "string" and v ~= "" then
return v
end
return nil
end
function GP_NormalizeChatCmd(s)
if not s then return "" end
s = tostring(s)
s = s:gsub("^%s+", ""):gsub("%s+$", "")
s = s:gsub("%s+", " ")
s = string.lower(s)
return s
end
function GP_PartyMsgHasCommand(normMsg, commandToken)
if not normMsg or normMsg == "" or not commandToken then return false end
if normMsg == commandToken then return true end
for token in string.gmatch(normMsg, "[%w_]+") do
if token == commandToken then
return true
end
end
return false
end
function GP_HandlePartyKillFromEvent(name, ev)
if not name then return false end
local wantsKill = (config and config.partyGpKillEnabled == true)
local wantsLeave = (config and config.partyGpLeaveEnabled == true)
if not wantsKill and not wantsLeave then
return false
end
local lname = string.lower(tostring(name))
if not string.find(lname, "party", 1, true) then
return false
end
local msg = GP_TryGetEventString(ev, "text")
or GP_TryGetEventString(ev, "message")
or GP_TryGetEventString(ev, "chat")
or GP_TryGetEventString(ev, "msg")
or GP_TryGetEventString(ev, "command")
or GP_TryGetEventString(ev, "param1")
or GP_TryGetEventString(ev, "param2")
if not msg then return false end
local cmd = GP_NormalizeChatCmd(msg)
local hasLeave = wantsLeave and GP_PartyMsgHasCommand(cmd, "gp_leave")
local hasKill = wantsKill and GP_PartyMsgHasCommand(cmd, "gp_kill")
if not hasLeave and not hasKill then
return false
end
local now = 0
pcall(function()
if globals and globals.RealTime then now = globals.RealTime()
elseif globals and globals.CurTime then now = globals.CurTime()
end
end)
if hasLeave then
if (now - (gp_partyLeaveLastTrigger or 0)) < 0.30 then
return true
end
gp_partyLeaveLastTrigger = now
pcall(function()
if client and client.Command then
client.Command("disconnect", true)
end
end)
AddNotification("Party gp_leave received - disconnected", "info")
return true
end
if hasKill then
if (now - (gp_partyKillLastTrigger or 0)) < 0.30 then
return true
end
gp_partyKillLastTrigger = now
pcall(function()
if client and client.Command then
client.Command("kill", true)
end
end)
AddNotification("Party gp_kill received - killbind used", "info")
return true
end
return false
end
pcall(function()
if client and client.AllowListener then
client.AllowListener("party_chat")
client.AllowListener("party_message")
client.AllowListener("party_member_chat")
client.AllowListener("party_invite_chat")
end
end)
callbacks.Register("FireGameEvent", function(e)
local ok, name = pcall(function() return e:GetName() end)
if ok and name then
GP_HandlePartyKillFromEvent(name, e)
GP_RST_OnEvent(name, e)
end
end)
callbacks.Register("Draw", GP_Draw)
callbacks.Register("CreateMove", function(cmd)
local currentTime = globals.CurTime()
GP_HandleCurTimeRewind(currentTime)
if type(currentTime) == "number" then
if (sniperIgnoreShortToggleUntil or 0) > (currentTime + 3.0) then
sniperIgnoreShortToggleUntil = 0
sniperSkipNextShortToggle = false
sniperBlockShortToggleOnRelease = false
sniperHotkeyHoldDown = false
sniperHotkeyHoldStart = 0
sniperHotkeyHoldTriggered = false
end
if (tpIgnoreShortToggleUntil or 0) > (currentTime + 3.0) then
tpIgnoreShortToggleUntil = 0
tpSkipNextShortToggle = false
tpHotkeyHoldDown = false
tpHotkeyHoldStart = 0
tpHotkeyHoldTriggered = false
tpLastForceToggleAt = 0
end
end
CheckServerChange()
GP_AutoDisconnectTick()
GP_RST_TickState()
GP_RST_TickQueuedStart()
GP_TryCaptureHotkey()
local me = entities.GetLocalPlayer()
GP_HandleInstantRespawn(me)
GP_TP_HandleAimbotSuppression(currentTime)
GP_TP_TickUseVerify(me, currentTime)
GP_F4_Sync("tick", false)
autoModeWalkActive = false
config._autoModeVacWarned = false
if not (config and config.autoWalkEnabled) then
thresholdNotificationShown = false
medicThresholdReached = false
hasTriedClassChange = false
pendingClassChange = false
classChangeUsePreWaveRules = false
pendingRetry = false
pendingRetryTargetClass = nil
pendingRetryTargetUntil = 0
classChangeDidRefund = false
classChangeRefundTime = 0
classChangeDidCleanup = false
classChangeCleanupTime = 0
classChangeReadyTime = 0
needToLeaveZone = false
leaveZoneStartPos = nil
leaveZoneTime = 0
if GP_RST then
GP_RST.medicCycleHardResetPending = false
GP_RST.medicCycleHardResetSince = 0
GP_RST.medicCycleSwapLockUntil = 0
end
end
local gpMedicHardResetPending = (GP_RST and GP_RST.medicCycleHardResetPending == true) or false
if me and config and config.autoWalkEnabled and config.changeClassEnabled and (not gpMedicHardResetPending) and (not isExploiting) and (not pendingClassChange) and (
(thresholdNotificationShown == true)
or (medicThresholdReached == true)
or IsMoneyThresholdReached()
or GP_ShouldAllowPostWaveStationSwapWithoutThreshold(me)
) then
local postWaveRestrictedRearm = GP_IsPostWaveSwapRestricted()
if postWaveRestrictedRearm then
local strictTargetRearm = GP_GetPostWaveStationSwapTarget(me)
if strictTargetRearm and strictTargetRearm ~= "" then
local currentClassRearm = GP_GetCurrentClassName(me)
if currentClassRearm ~= strictTargetRearm then
hasTriedClassChange = false
pendingClassChange = true
classChangeUsePreWaveRules = false
classChangeSwapPopupShown = false
classChangeDidRefund = false
classChangeRefundTime = 0
classChangeDidCleanup = false
classChangeCleanupTime = 0
classChangeReadyTime = (currentTime or 0) + 0.05
end
end
end
end
if me and config and config.autoWalkEnabled and config.changeClassEnabled and (not gpMedicHardResetPending) and (not isExploiting) and pendingClassChange and currentTime >= classChangeReadyTime and (
(thresholdNotificationShown == true)
or (medicThresholdReached == true)
or IsMoneyThresholdReached()
or GP_ShouldAllowPostWaveStationSwapWithoutThreshold(me)
) then
local inZone = (me:GetPropInt('m_bInUpgradeZone') == 1)
local finalized = false
local swapTargetClass = config and config.targetClass or nil
local postWaveRestricted = GP_IsPostWaveSwapRestricted()
if classChangeUsePreWaveRules then
local definitelyPostWave = GP_UpdatePostWaveSwapLatch and GP_UpdatePostWaveSwapLatch() or false
if definitelyPostWave then
classChangeUsePreWaveRules = false
postWaveRestricted = true
else
postWaveRestricted = false
end
end
if postWaveRestricted then
local postWaveTarget, postWaveReason = GP_GetPostWaveStationSwapTarget(me)
if postWaveReason == "not_medic" then
AddNotification("Auto class change skipped (after Wave 1 only from Medic)", "info")
finalized = true
elseif postWaveReason == "invalid_target" then
AddNotification("Auto class change skipped (target class is OFF/Medic/invalid)", "warning")
finalized = true
elseif postWaveReason == "not_in_upgrade" then
classChangeReadyTime = currentTime + 0.35
return
elseif postWaveTarget then
swapTargetClass = postWaveTarget
else
finalized = true
end
end
if (not finalized) and ((not swapTargetClass) or swapTargetClass == "") then
AddNotification("Threshold reached but no target class set", "warning")
finalized = true
end
if (not finalized) and IsMvMWaveActive() then
classChangeReadyTime = currentTime + 0.35
if inZone and IsMedic(me) and (currentTime - (lastRetryTime or 0)) > RETRY_COOLDOWN then
local retryTarget = nil
if not postWaveRestricted then
retryTarget = (swapTargetClass or (config and config.targetClass) or nil)
else
retryTarget = swapTargetClass
end
if retryTarget and retryTarget ~= "" then
AddNotification("Wave active - retrying to change class", "warning")
lastRetryTime = currentTime
pendingRetry = true
pendingRetryTargetClass = tostring(retryTarget)
pendingRetryTargetUntil = currentTime + 90.0
client.Command("retry", true)
end
end
return
end
if not finalized then
local allowRefund = (not postWaveRestricted)
if allowRefund and inZone and (not classChangeDidRefund) then
pcall(engine.SendKeyValues, '"MVM_Respec" {}')
classChangeDidRefund = true
classChangeRefundTime = currentTime
classChangeReadyTime = currentTime + 0.12
return
end
if not classChangeDidCleanup then
ForceCleanup()
classChangeDidCleanup = true
classChangeCleanupTime = currentTime
classChangeReadyTime = currentTime + 0.08
return
end
local currentClassNow = GP_GetCurrentClassName(me)
if currentClassNow == swapTargetClass then
AddNotification("Already playing " .. tostring(swapTargetClass), "info")
finalized = true
else
client.Command("joinclass " .. tostring(swapTargetClass), true)
if not classChangeSwapPopupShown then
AddNotification("Changed class to " .. tostring(swapTargetClass), "success")
classChangeSwapPopupShown = true
end
finalized = true
end
end
if finalized then
hasTriedClassChange = true
pendingClassChange = false
classChangeUsePreWaveRules = false
needToLeaveZone = false
leaveZoneStartPos = nil
leaveZoneTime = 0
else
classChangeReadyTime = currentTime + 0.25
end
end
if not me then return end
do
if gpFirstJoinPickMedicPending and config and config.firstJoinPickMedic and config.autoWalkEnabled then
local nowFJ = currentTime or ((globals and globals.CurTime and globals.CurTime()) or 0)
if nowFJ > (gpFirstJoinPickMedicUntil or 0) then
gpFirstJoinPickMedicPending = false
gpFirstJoinPickMedicDone = true
else
local preWaveJoin = ((GP_HasExplicitPreWave1Proof and GP_HasExplicitPreWave1Proof()) or false)
if not preWaveJoin then
local waveJoin = GP_GetWaveNumber and GP_GetWaveNumber() or nil
local rsJoin = GP_GetRoundState and GP_GetRoundState() or nil
local inSetupJoin = nil
if GP_TP_IsSetupPhase then
local okSetupJoin, vSetupJoin = pcall(GP_TP_IsSetupPhase)
if okSetupJoin then
inSetupJoin = vSetupJoin
end
end
if type(waveJoin) == "number" and waveJoin <= 1 then
if (inSetupJoin == true) or (type(rsJoin) == "number" and (rsJoin == 3 or rsJoin == 10)) then
preWaveJoin = true
end
end
end
if preWaveJoin then
local clsNowFJ = GP_GetCurrentClassName(me)
if clsNowFJ ~= "medic" then
client.Command("joinclass medic", true)
client.Command("join_class medic", true)
client.Command("joinclass 5", true)
end
gpFirstJoinPickMedicPending = false
gpFirstJoinPickMedicDone = true
else
local waveConsume = GP_GetWaveNumber and GP_GetWaveNumber() or nil
local rsConsume = GP_GetRoundState and GP_GetRoundState() or nil
local liveSeenConsume = (GP_RST and GP_RST.liveSeen) or false
if liveSeenConsume or (type(waveConsume) == "number" and waveConsume >= 2) or (type(rsConsume) == "number" and rsConsume == 4) then
gpFirstJoinPickMedicPending = false
gpFirstJoinPickMedicDone = true
end
end
end
end
local cls = GP_GetCurrentClassName(me)
if tpLastKnownClassName == nil then
tpLastKnownClassName = cls
elseif cls and tpLastKnownClassName and cls ~= tpLastKnownClassName then
local hadTraversalBeforeSwap = (GP_TP_IsTraversalActive and GP_TP_IsTraversalActive()) or false
if hadTraversalBeforeSwap then
if teleporterConfig then teleporterConfig.autoWalkEnabled = false end
tpIsWaitingForTeleporter = false
tpNoTeleFallbackActive = false
if GP_TP_StopUseVerify then pcall(GP_TP_StopUseVerify) end
if GP_TP_ResetPathState then pcall(GP_TP_ResetPathState) end
if GP_TP_ResetStuckTracker then pcall(GP_TP_ResetStuckTracker) end
tpClassSwapUnlockUntil = (currentTime or 0) + 1.25
end
local rearmTime = currentTime - (TELEPORTER_AUTOWALK_DELAY or 1.0)
local ip = (engine and engine.GetServerIP and engine.GetServerIP()) or ""
if ip == "" then ip = currentServer or "" end
if tpForceModeEnabled then
tpToggleNeedsTrigger = false
tpStickyArmed = true
tpStickyServerIP = ip
teleporterManuallyDisabled = false
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
sniperUpgradeCompleted = true
sniperUpgradeCompletedTime = rearmTime
GP_TP_ResetPathState()
GP_TP_ResetStuckTracker()
if tpForceRestoreAwaitRespawn then
tpRespawnRearmPending = true
AddNotification("Class switch detected - Force TpWalk still waiting for respawn", "info")
else
tpRespawnRearmPending = false
tpToggleSpawnLock = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
reloadMoveLock = false
AddNotification("Class switch detected - Force TpWalk re-armed", "success")
end
elseif (config and config.tpWalkEnabled) and (cls == "sniper") then
tpForceRestoreAwaitRespawn = false
tpRespawnRearmPending = false
tpToggleNeedsTrigger = false
tpToggleSpawnLock = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
tpStickyArmed = true
teleporterManuallyDisabled = false
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = false
sniperUpgradeCompleted = true
sniperUpgradeCompletedTime = rearmTime
tpStickyServerIP = ip
reloadMoveLock = false
GP_TP_ResetPathState()
GP_TP_ResetStuckTracker()
AddNotification("Class switch to Sniper detected - TpWalk re-armed", "success")
end
if cls == "sniper"
and config and config.autoBuyEnabled
and (not forceSniperBuyModeEnabled)
and sniperReloadAwaitRespawn
and GP_ShouldSniperBuyArmImmediately() then
sniperReloadAwaitRespawn = false
sniperReloadRespawnPending = false
sniperLastAliveState = nil
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
end
tpLastKnownClassName = cls
else
tpLastKnownClassName = cls or tpLastKnownClassName
end
end
local canAutoMoveNow = GP_IsReloadMoveUnlocked(me)
if GP_TP_IsMoveLockActive() and IsManualMoveInput() then
local tpPendingRearmNow = (tpRespawnRearmPending == true)
or (tpForceRestoreAwaitRespawn == true)
or (tpWaitForRoundReload == true)
or (tpToggleSpawnLock == true)
or ((not (teleporterConfig and teleporterConfig.autoWalkEnabled == true))
and (sniperUpgradeCompletedTime or 0) > 0
and ((currentTime - (sniperUpgradeCompletedTime or 0)) < (TELEPORTER_AUTOWALK_DELAY or 1.0)))
if tpPendingRearmNow then
GP_TP_ApplyMovementLock(cmd)
end
end
local hasVacc = HasVaccinator(me)
local gpMedicSwapLockedNow = (GP_RST and GP_RST.medicCycleHardResetPending == true) or false
if gpMedicSwapLockedNow then
needToLeaveZone = false
leaveZoneStartPos = nil
leaveZoneTime = 0
pendingClassChange = false
pendingRetry = false
pendingRetryTargetClass = nil
pendingRetryTargetUntil = 0
end
if needToLeaveZone and (config and config.autoWalkEnabled) and (not gpMedicSwapLockedNow) and (not isExploiting) then
if me:GetPropInt('m_bInUpgradeZone') == 1 then
if leaveZoneStartPos then
local viewAngles = engine.GetViewAngles()
if not IsManualMoveInput() then
cmd:SetForwardMove(-450)
end
end
else
if leaveZoneTime == 0 then
leaveZoneTime = currentTime
AddNotification("Waiting before class change", "info")
end
if currentTime - leaveZoneTime >= 0.5 then
local didSwap = false
local postWaveRestricted = GP_IsPostWaveSwapRestricted()
local swapTargetClass = config and config.targetClass or nil
local allowSwap = true
if postWaveRestricted then
local strictTarget = GP_GetPostWaveStationSwapTarget(me)
if strictTarget and strictTarget ~= "" then
swapTargetClass = strictTarget
else
allowSwap = false
end
end
if allowSwap and swapTargetClass and swapTargetClass ~= "" then
if GP_GetCurrentClassName(me) == swapTargetClass then
AddNotification("Already playing " .. tostring(swapTargetClass), "info")
else
client.Command("joinclass " .. tostring(swapTargetClass), true)
didSwap = true
end
end
hasTriedClassChange = true
pendingClassChange = false
classChangeUsePreWaveRules = false
needToLeaveZone = false
leaveZoneStartPos = nil
leaveZoneTime = 0
if didSwap and swapTargetClass and (not classChangeSwapPopupShown) then AddNotification("Changed class to " .. tostring(swapTargetClass), "success"); classChangeSwapPopupShown = true end
end
end
end
if pendingRetry and (config and config.autoWalkEnabled) and (not gpMedicSwapLockedNow) and (not isExploiting) then
if entities.GetLocalPlayer() then
pendingRetry = false
local nowRetry = currentTime or ((globals and globals.CurTime and globals.CurTime()) or 0)
local swapTargetClass = nil
local postWaveRetryRestricted = GP_IsPostWaveSwapRestricted()
local cachedRetryTarget = nil
if pendingRetryTargetClass and (pendingRetryTargetClass ~= "") and ((pendingRetryTargetUntil or 0) >= nowRetry) then
cachedRetryTarget = tostring(pendingRetryTargetClass)
end
if not postWaveRetryRestricted then
swapTargetClass = cachedRetryTarget
if (not swapTargetClass) or swapTargetClass == "" then
swapTargetClass = (config and config.targetClass) or nil
end
else
local allowRetryBypass = ((lastRetryTime or 0) > 0) and ((nowRetry - (lastRetryTime or 0)) <= 20.0)
if allowRetryBypass then
local strictValidTarget = GP_GetPostWaveAutoCreditTargetClass and GP_GetPostWaveAutoCreditTargetClass() or nil
if cachedRetryTarget and strictValidTarget and (cachedRetryTarget == strictValidTarget) then
swapTargetClass = cachedRetryTarget
else
swapTargetClass = GP_GetPostWaveStationSwapTarget(me)
end
else
swapTargetClass = GP_GetPostWaveStationSwapTarget(me)
end
end
pendingRetryTargetClass = nil
pendingRetryTargetUntil = 0
if swapTargetClass and swapTargetClass ~= "" then
if GP_GetCurrentClassName(me) == swapTargetClass then
AddNotification("Already playing " .. tostring(swapTargetClass), "info")
else
client.Command("joinclass " .. tostring(swapTargetClass), true)
if not classChangeSwapPopupShown then
AddNotification("Changed class to " .. tostring(swapTargetClass), "success")
classChangeSwapPopupShown = true
end
end
else
if not postWaveRetryRestricted then
AddNotification("Retry done, but no valid target class configured", "warning")
else
AddNotification("Retry class swap skipped (after Wave 1 requires Medic in upgrade station + valid target class)", "info")
end
end
end
return
end
if GP_KeyPressedBind(ALL_OFF_KEY) and (currentTime - lastToggleTime > TOGGLE_COOLDOWN)
and IsGameInputAllowed() and (currentTime >= suppressToggleUntil) and (not misc.waitKey) then
local canRestore = (allOffRestoreSnapshot ~= nil) and ((allOffRestoreUntil or 0) >= currentTime)
if canRestore then
GP_RestoreActiveToggleSnapshot(allOffRestoreSnapshot, true)
allOffRestoreSnapshot = nil
allOffRestoreUntil = 0
else
allOffRestoreSnapshot = GP_CaptureActiveToggleSnapshot()
local hadAnyBefore = GP_SnapshotHasAnyActive(allOffRestoreSnapshot)
GP_DisableAllActiveToggles(false)
allOffRestoreUntil = currentTime + (ALL_OFF_RESTORE_WINDOW or 60.0)
if hadAnyBefore then
AddNotification("All active toggles disabled", "info", 4.5)
else
AddNotification("No active toggles were active", "info", 4.5)
end
end
lastToggleTime = currentTime
end
if GP_KeyPressedBind(WALK_KEY) and (currentTime - lastToggleTime > TOGGLE_COOLDOWN)
and IsGameInputAllowed() and (currentTime >= suppressToggleUntil) and (not misc.waitKey) then
if GP_SetAutoCreditEnabled((not config.autoWalkEnabled), true) then
lastToggleTime = currentTime
end
end
do
local autoDownNow = input.IsButtonDown(AUTO_KEY)
if autoDownNow and (not sniperHotkeyHoldDown) then
sniperHotkeyHoldDown = true
sniperHotkeyHoldStart = currentTime
sniperHotkeyHoldTriggered = false
sniperBlockShortToggleOnRelease = false
end
if sniperHotkeyHoldDown and autoDownNow and (not sniperHotkeyHoldTriggered) then
if (currentTime - (sniperHotkeyHoldStart or currentTime)) >= (SNIPER_FORCE_HOLD_SECONDS or 2.0)
and IsGameInputAllowed() and (currentTime >= suppressToggleUntil) and (not misc.waitKey) then
sniperHotkeyHoldTriggered = true
if GP_SetForceSniperBuyEnabled((not forceSniperBuyModeEnabled), true) then
sniperBlockShortToggleOnRelease = true
lastToggleTime = currentTime
end
end
end
if (not autoDownNow) and sniperHotkeyHoldDown then
local blockShortToggle = sniperBlockShortToggleOnRelease
or sniperSkipNextShortToggle
or (currentTime < (sniperIgnoreShortToggleUntil or 0))
if sniperBlockShortToggleOnRelease then
sniperBlockShortToggleOnRelease = false
end
if blockShortToggle then
sniperSkipNextShortToggle = false
end
if (not blockShortToggle)
and (not sniperHotkeyHoldTriggered)
and ((currentTime - (sniperHotkeyHoldStart or currentTime)) < (SNIPER_FORCE_HOLD_SECONDS or 2.0))
and (currentTime - lastToggleTime > TOGGLE_COOLDOWN)
and IsGameInputAllowed() and (currentTime >= suppressToggleUntil) and (not misc.waitKey) then
if forceSniperBuyModeEnabled then
if GP_SetForceSniperBuyEnabled(false, true) then
lastToggleTime = currentTime
end
else
local nextEnabled = (not config.autoBuyEnabled)
config.autoBuyEnabled = nextEnabled
gpStickyAutoBuyEnabled = (config.autoBuyEnabled == true)
if config.autoBuyEnabled then
GP_EnableSniperBuyRuntime(((GP_TP_IsTraversalActive and GP_TP_IsTraversalActive()) and true or false))
AddNotification("SniperBuy Enabled - Reset state (Death/Respawn as Sniper activates it)", "warning", 4.0)
else
GP_DisableSniperBuyRuntime(GP_TP_IsTraversalActive())
AddNotification("SniperBuy Disabled", "info")
end
SaveConfig(GP_CfgPath(), config)
lastToggleTime = currentTime
end
end
sniperHotkeyHoldDown = false
sniperHotkeyHoldStart = 0
sniperHotkeyHoldTriggered = false
end
end
if GP_KeyPressedBind(CLEAN_KEY) and (currentTime - lastCleanupTime > TOGGLE_COOLDOWN)
and IsGameInputAllowed() and (currentTime >= suppressToggleUntil) and (not misc.waitKey) then
AddNotification("Started cleanup", "info")
ForceCleanup()
lastCleanupTime = currentTime
cleanupFlashUntil = currentTime + 0.25
end
do
tpDownNow = input.IsButtonDown(TP_KEY)
if tpDownNow and (not tpHotkeyHoldDown) then
tpHotkeyHoldDown = true
tpHotkeyHoldStart = currentTime
tpHotkeyHoldTriggered = false
end
if tpHotkeyHoldDown and tpDownNow and (not tpHotkeyHoldTriggered) then
if (currentTime - (tpHotkeyHoldStart or currentTime)) >= (TP_FORCE_HOLD_SECONDS or 2.0)
and IsGameInputAllowed() and (currentTime >= suppressToggleUntil) and (not misc.waitKey) then
tpHotkeyHoldTriggered = true
if GP_SetTpForceEnabled((not tpForceModeEnabled), true) then
lastToggleTime = currentTime
end
end
end
if (not tpDownNow) and tpHotkeyHoldDown then
local holdDur = (currentTime - (tpHotkeyHoldStart or currentTime))
if tpHotkeyHoldTriggered then
tpSkipNextShortToggle = true
end
if (not tpHotkeyHoldTriggered)
and (holdDur < (TP_FORCE_HOLD_SECONDS or 2.0))
and (currentTime >= (tpIgnoreShortToggleUntil or 0))
and (not tpSkipNextShortToggle)
and (currentTime - lastToggleTime > TOGGLE_COOLDOWN)
and IsGameInputAllowed() and (currentTime >= suppressToggleUntil) and (not misc.waitKey) then
if tpForceModeEnabled then
GP_SetTpForceEnabled(false, true)
else
GP_SetTpWalkEnabled((not config.tpWalkEnabled), true)
end
lastToggleTime = currentTime
end
tpSkipNextShortToggle = false
tpHotkeyHoldDown = false
tpHotkeyHoldStart = 0
tpHotkeyHoldTriggered = false
end
end
do
local sbNeedsRearm = (config and config.autoBuyEnabled and (not forceSniperBuyModeEnabled))
if sniperReloadAwaitRespawn and sbNeedsRearm and me then
local aliveNowSB = me:IsAlive()
if sniperLastAliveState == nil then
sniperLastAliveState = aliveNowSB
if not aliveNowSB then
sniperReloadRespawnPending = true
end
end
if sniperLastAliveState and (not aliveNowSB) then
sniperReloadRespawnPending = true
if isUpgradingSniper then
isUpgradingSniper = false
upgradeQueue = {}
end
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
forceSniperBuyZoneLatch = false
elseif (not sniperLastAliveState) and aliveNowSB and sniperReloadRespawnPending then
sniperReloadAwaitRespawn = false
sniperReloadRespawnPending = false
forceSniperBuyZoneLatch = false
forceSniperBuyLastTry = 0
end
sniperLastAliveState = aliveNowSB
else
sniperReloadRespawnPending = false
if not sbNeedsRearm then
sniperReloadAwaitRespawn = false
end
if me then
sniperLastAliveState = me:IsAlive()
else
sniperLastAliveState = nil
end
end
end
do
local inZoneFS = false
if me and me.GetPropInt then
inZoneFS = (me:GetPropInt('m_bInUpgradeZone') == 1)
end
if forceSniperBuyModeEnabled and (not sniperReloadAwaitRespawn) and me and me:IsAlive() and GP_IsSniper(me) and (not isExploiting) and (not (GP_RST_IsTransitionLockActive and GP_RST_IsTransitionLockActive())) then
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
if inZoneFS then
if not forceSniperBuyZoneLatch then
forceSniperBuyZoneLatch = true
forceSniperBuyLastTry = currentTime
sniperUpgradesComplete = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
TriggerSniperUpgrades()
elseif (not isUpgradingSniper) and ((not upgradeQueue) or (#upgradeQueue == 0)) and (not sniperUpgradesComplete) then
if (currentTime - (forceSniperBuyLastTry or 0)) >= 1.0 then
forceSniperBuyLastTry = currentTime
TriggerSniperUpgrades()
end
end
else
forceSniperBuyZoneLatch = false
end
else
forceSniperBuyZoneLatch = false
end
end
if config.autoBuyEnabled and (not forceSniperBuyModeEnabled) and (not sniperReloadAwaitRespawn) and (gpPhase == "SNIPER_BUY") and (not autobuyRunOnceDone) then
if sniperUpgradesComplete then
autobuyRunOnceDone = true
if not autobuyDoneAnnounced then
AddNotification("SniperBuy run complete (this mission). Toggle SniperBuy OFF/ON to run again", "success")
autobuyDoneAnnounced = true
end
end
end
if config.autoBuyEnabled and (not forceSniperBuyModeEnabled) and (not sniperReloadAwaitRespawn) and (not autobuyRunOnceDone) and me then
local alive = (me.IsAlive and me:IsAlive()) or false
local isSniper = GP_IsSniper(me)
local inZoneDbg = false
if me.GetPropInt then
inZoneDbg = (me:GetPropInt('m_bInUpgradeZone') == 1)
end
if (not alive) or (not isSniper) or isExploiting or (not inZoneDbg) then
end
end
if config.autoBuyEnabled and (not forceSniperBuyModeEnabled) and (not sniperReloadAwaitRespawn) and (not autobuyRunOnceDone) and me and me:IsAlive() and GP_IsSniper(me) and (not isExploiting) and canAutoMoveNow and (not (GP_RST_IsTransitionLockActive and GP_RST_IsTransitionLockActive())) then
local inZone = me:GetPropInt('m_bInUpgradeZone') == 1
if inZone then
if shouldGuidePlayerBuy then
AddNotification("SniperBuy: reached upgrade station", "success")
end
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
sniperBuyWalkStartTime = 0
if config.autoBuyEnabled and (not sniperUpgradesComplete) then
TriggerSniperUpgrades()
end
else
local newMidpoint = FindUpgradeStations(me)
local inSpawnArea = IsInSniperBuySpawnArea(me)
if newMidpoint and inSpawnArea then
buyMidpoint = newMidpoint
if not shouldGuidePlayerBuy then
shouldGuidePlayerBuy = true
sniperBuyWalkStartTime = currentTime
elseif (sniperBuyWalkStartTime or 0) <= 0 then
sniperBuyWalkStartTime = currentTime
end
local walkTimedOut = ((sniperBuyWalkStartTime or 0) > 0) and ((currentTime - (sniperBuyWalkStartTime or currentTime)) >= (SNIPER_BUY_WALK_TIMEOUT or 10.0))
local canKillNow = (currentTime >= (sniperBuyWalkKillCooldownUntil or 0))
if walkTimedOut and canKillNow then
AddNotification("SniperBuy: station not reached in 10s - suiciding reset", "warning")
pcall(function()
if client and client.Command then
client.Command("kill", true)
end
end)
sniperBuyWalkKillCooldownUntil = currentTime + (SNIPER_BUY_WALK_KILL_COOLDOWN or 4.0)
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
sniperBuyWalkStartTime = 0
sniperUpgradesComplete = false
sniperUpgradeCompleted = false
sniperUpgradeCompletedTime = 0
autobuyRunOnceDone = false
autobuyDoneAnnounced = false
sniperReloadAwaitRespawn = true
sniperReloadRespawnPending = true
sniperLastAliveState = false
isUpgradingSniper = false
upgradeQueue = {}
else
WalkTo(cmd, me, buyMidpoint)
end
else
if shouldGuidePlayerBuy and (not inSpawnArea) then
AddNotification("SniperBuy: stopped (left spawn room)", "info")
end
shouldGuidePlayerBuy = false
buyMidpoint = nil
sniperBuyWalkStartTime = 0
if not inSpawnArea then
buySpawnAnchor = nil
medicSpawnAnchor = nil
end
end
end
else
shouldGuidePlayerBuy = false
buyMidpoint = nil
buySpawnAnchor = nil
medicSpawnAnchor = nil
sniperBuyWalkStartTime = 0
end
do
local inZone_now = false
if me and me.GetPropInt then
inZone_now = (me:GetPropInt('m_bInUpgradeZone') == 1)
end
if config.autoWalkEnabled and me then
local alive = (me.IsAlive and me:IsAlive()) or false
local isMedic = IsMedic(me)
local inZoneDbg = inZone_now
local paused = autoWalkPaused
if (not alive) or (not isMedic) or (not hasVacc) or (not inZoneDbg) or paused or isExploiting then
end
end
if config.autoWalkEnabled and me and not (misc and misc.acStartedOnce) then
local wave_now = GP_GetWaveNumber()
local rs_now = GP_GetRoundState()
local preWave_now = ((GP_HasExplicitPreWave1Proof and GP_HasExplicitPreWave1Proof()) or false)
if not preWave_now then
local inSetup_fallback = nil
if GP_TP_IsSetupPhase then
local okSetup, vSetup = pcall(GP_TP_IsSetupPhase)
if okSetup then
inSetup_fallback = vSetup
end
end
if type(wave_now) == "number" and wave_now <= 1 then
if (inSetup_fallback == true) or (type(rs_now) == "number" and (rs_now == 3 or rs_now == 10)) then
preWave_now = true
end
end
end
local class_map = GP_CLASS_NAME
local class_now = nil
local class_selected_now = false
local cls_id = nil
if me and me.GetPropInt then
local okCls, vCls = pcall(function() return me:GetPropInt("m_iClass") end)
if okCls and type(vCls) == "number" then
cls_id = vCls
end
end
if type(cls_id) == "number" and cls_id >= 1 and cls_id <= 9 then
class_now = class_map[cls_id]
class_selected_now = true
else
local desired_id = nil
if me and me.GetPropInt then
local okD1, vD1 = pcall(function() return me:GetPropInt("m_Shared.m_iDesiredPlayerClass") end)
if okD1 and type(vD1) == "number" then
desired_id = vD1
end
if (not desired_id or desired_id <= 0) then
local okD2, vD2 = pcall(function() return me:GetPropInt("m_Shared", "m_iDesiredPlayerClass") end)
if okD2 and type(vD2) == "number" then
desired_id = vD2
end
end
if (not desired_id or desired_id <= 0) then
local okD3, vD3 = pcall(function() return me:GetPropInt("m_iDesiredPlayerClass") end)
if okD3 and type(vD3) == "number" then
desired_id = vD3
end
end
end
if type(desired_id) == "number" and desired_id >= 1 and desired_id <= 9 then
class_now = class_map[desired_id]
class_selected_now = true
end
end
if (not class_selected_now) and GP_GetCurrentClassName then
local fallback_class = GP_GetCurrentClassName(me)
if type(fallback_class) == "string" and fallback_class ~= "" then
class_now = fallback_class
class_selected_now = true
end
end
local prev_class = misc.acWarnPrevClassName
local prev_vacc = misc.acWarnPrevHasVacc
local prev_selected = misc.acWarnPrevClassSelected
if preWave_now then
local initial_snapshot = (prev_class == nil or prev_vacc == nil or prev_selected == nil)
local class_changed = (prev_class ~= nil and class_now ~= prev_class)
local vacc_changed = (prev_vacc ~= nil and hasVacc ~= prev_vacc)
local selected_changed = (prev_selected ~= nil and class_selected_now ~= prev_selected)
if class_selected_now and (initial_snapshot or class_changed or vacc_changed or selected_changed) then
if class_now ~= "medic" then
if not misc.acWarnSeenNoMedic then
AddNotification("Select Medic with Vaccinator for AutoCredit", "warning", 4.0)
misc.acWarnSeenNoMedic = true
end
elseif not hasVacc then
if not misc.acWarnSeenNoVacc then
AddNotification("Vaccinator not equipped for AutoCredit", "warning", 4.0)
misc.acWarnSeenNoVacc = true
end
end
end
end
misc.acWarnPrevClassName = class_now
misc.acWarnPrevHasVacc = (hasVacc and true or false)
misc.acWarnPrevClassSelected = (class_selected_now and true or false)
else
misc.acWarnPrevClassName = nil
misc.acWarnPrevHasVacc = nil
misc.acWarnPrevClassSelected = nil
end
if config.autoWalkEnabled and inZone_now and IsMedic(me) and hasVacc and (not isExploiting) then
TriggerMoneyExploit()
end
if isExploiting or isUpgradingSniper then
ProcessExploitQueue()
end
end
do
local aliveNow = me:IsAlive()
local classNow = GP_GetCurrentClassName(me)
local isSniperNow = (classNow == "sniper")
local normalModeActive = (config and config.tpWalkEnabled) and (not tpForceModeEnabled)
local normalRespawnRelevant = normalModeActive and isSniperNow
local forceRespawnRelevant = tpForceModeEnabled and (GP_TP_IsArmedAndAllowed() or tpForceRestoreAwaitRespawn)
local initAliveWithPending = false
if tpLastAliveState == nil then
if aliveNow and tpRespawnRearmPending then
initAliveWithPending = true
end
tpLastAliveState = aliveNow
if (not aliveNow) and (tpForceRestoreAwaitRespawn or (normalRespawnRelevant and (tpToggleNeedsTrigger or sniperUpgradeCompleted))) then
tpRespawnRearmPending = true
end
end
local trackRespawn = forceRespawnRelevant
or (normalRespawnRelevant and (tpToggleNeedsTrigger or sniperUpgradeCompleted))
if trackRespawn then
if tpLastAliveState and (not aliveNow) then
tpRespawnRearmPending = true
teleporterConfig.autoWalkEnabled = false
GP_TP_ResetPathState()
if tpForceModeEnabled then
AddNotification("Force TpWalk pending re-arm, please wait", "warning", 4.0)
else
AddNotification("TpWalk pending re-arm, please wait", "warning")
end
elseif (initAliveWithPending or ((not tpLastAliveState) and aliveNow and tpRespawnRearmPending)) then
tpRespawnRearmPending = false
teleporterJustUsed = false
sniperUpgradeCompletedTime = currentTime - (TELEPORTER_AUTOWALK_DELAY or 1.0)
teleporterConfig.autoWalkEnabled = false
if tpForceRestoreAwaitRespawn then
if tpWaitForRoundReload then
reloadMoveLock = true
else
tpForceRestoreAwaitRespawn = false
tpToggleSpawnLock = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
tpStickyArmed = true
teleporterManuallyDisabled = false
sniperUpgradeCompleted = true
sniperUpgradeCompletedTime = currentTime - (TELEPORTER_AUTOWALK_DELAY or 1.0)
teleporterJustUsed = false
tpIsWaitingForTeleporter = false
tpNoTeleFallbackActive = false
tpTeleporterSeenCount = (TP_TELE_STABLE_SCANS or 8)
reloadMoveLock = false
end
end
if (config and config.tpWalkEnabled) and tpToggleNeedsTrigger and isSniperNow then
tpToggleNeedsTrigger = false
tpWaitForRoundReload = false
tpWaitForRoundReloadReason = ""
sniperUpgradeCompleted = true
sniperUpgradeCompletedTime = currentTime - (TELEPORTER_AUTOWALK_DELAY or 1.0)
teleporterJustUsed = false
tpLastReachedTeleporterAt = 0
teleporterManuallyDisabled = false
reloadMoveLock = false
end
GP_TP_ResetPathState()
if tpForceModeEnabled then
if not tpForceRestoreAwaitRespawn then
AddNotification("Respawn detected - Force TpWalk re-armed", "success")
end
else
end
end
else
tpRespawnRearmPending = false
end
if tpForceModeEnabled and (tpStickyArmed ~= true) then
tpStickyArmed = true
end
tpLastAliveState = aliveNow
end
if sniperUpgradesComplete and (not sniperUpgradeCompleted) and (not tpToggleNeedsTrigger) then
GP_OnSniperUpgradesComplete("sync")
end
tpHoldForSniperBuy = false
local tpHoldForAutoCredit = false
do
local tpAnyModeEnabled = (tpForceModeEnabled == true) or ((config and config.tpWalkEnabled) == true)
local tpNormalModeEnabled = ((not tpForceModeEnabled) and ((config and config.tpWalkEnabled) == true))
local curClsName = GP_GetCurrentClassName(me)
local sniperBuyPending = (curClsName == "sniper")
and (config and config.autoBuyEnabled)
and (not forceSniperBuyModeEnabled)
and (not sniperReloadAwaitRespawn)
and (not autobuyRunOnceDone)
and (not sniperUpgradesComplete)
local rstAutoCreditPending = false
if config and config.autoWalkEnabled and GP_RST then
local rstNow = GP_RST_Now()
if GP_RST.medicCycleHardResetPending == true then
rstAutoCreditPending = true
elseif ((GP_RST.kind == "vote") or (GP_RST.kind == "fail")) and (rstNow < (GP_RST.contextUntil or 0)) then
rstAutoCreditPending = true
elseif (GP_RST.queueAt or 0) > 0 then
rstAutoCreditPending = true
end
end
local autoCreditPending = (config and config.autoWalkEnabled) and rstAutoCreditPending
if tpAnyModeEnabled and sniperBuyPending then
tpHoldForSniperBuy = true
end
if tpNormalModeEnabled and autoCreditPending then
tpHoldForAutoCredit = true
end
end
local forceBypassSniperBuyHold = false
local forceBypassAutoCreditHold = (tpForceModeEnabled == true)
local rstTransitionBlocked = false
if GP_RST then
local rstNow = (GP_RST_Now and GP_RST_Now()) or currentTime
if rstNow < (GP_RST.detectGlobalUntil or 0) then
rstTransitionBlocked = true
elseif ((GP_RST.kind == "vote") or (GP_RST.kind == "fail")) and (rstNow < (GP_RST.contextUntil or 0)) then
if tpWaitForRoundReload or tpForceRestoreAwaitRespawn or ((GP_RST.queueAt or 0) > rstNow) then
rstTransitionBlocked = true
end
end
end
if rstTransitionBlocked then
if teleporterConfig and teleporterConfig.autoWalkEnabled then
teleporterConfig.autoWalkEnabled = false
end
tpNoTeleFallbackActive = false
if GP_TP_StopUseVerify then pcall(GP_TP_StopUseVerify) end
if GP_TP_ResetPathState then pcall(GP_TP_ResetPathState) end
end
local allowTpWalkNow = ((forceBypassSniperBuyHold or (not tpHoldForSniperBuy)) and (forceBypassAutoCreditHold or (not tpHoldForAutoCredit)) and (not rstTransitionBlocked))
if allowTpWalkNow and GP_TP_IsArmedAndAllowed() and me and me:IsAlive() and canAutoMoveNow and GP_TP_IsToggleSpawnUnlocked(me) then
if GP_TP_IsMoveLockActive() and IsManualMoveInput() then
GP_TP_ApplyMovementLock(cmd)
end
if tpForceModeEnabled or GP_IsSniper(me) then
if (not teleporterConfig.autoWalkEnabled) and (not teleporterManuallyDisabled) and sniperUpgradeCompletedTime > 0 then
if (currentTime - sniperUpgradeCompletedTime) >= TELEPORTER_AUTOWALK_DELAY then
if GP_TP_ResetPathState then GP_TP_ResetPathState() end
teleporterConfig.autoWalkEnabled = true
teleporterJustUsed = false
AddNotification("TpWalk: searching for teleporter", "info")
end
end
if teleporterConfig.autoWalkEnabled then
local tpMapName = GP_TP_GetCurrentMap()
if currentTime >= nextTeleporterScanTime then
GP_TP_ScanForTeleporters(me)
nextTeleporterScanTime = currentTime + teleporterScanInterval
end
local activeTeleporterCandidates = foundTeleporters
local waitingAtEndpoint = false
do
waitingAtEndpoint = (tpIsWaitingForTeleporter == true)
if (not waitingAtEndpoint) and tpNoTeleFallbackActive then
waitingAtEndpoint = (GP_TP_GetCurrentPathWaypoint() == nil)
end
local endpointFilterRequired = waitingAtEndpoint
local endpointFilterRadius = (TP_ENDPOINT_TELE_RADIUS or 650)
if endpointFilterRequired then
local endpointPos = nil
local pths = mapPaths[tpMapName]
local endpointPathIndex = tpCurrentPathIndex
if (not endpointPathIndex) and me and me.GetAbsOrigin then
local myP = me:GetAbsOrigin()
if myP then
endpointPathIndex = GP_TP_ChooseBestPath(myP, tpMapName)
end
end
if pths and endpointPathIndex and pths[endpointPathIndex] and #pths[endpointPathIndex] > 0 then
local ep = pths[endpointPathIndex][#pths[endpointPathIndex]]
if ep then
endpointPos = Vector3(ep.x, ep.y, ep.z)
end
end
if endpointPos and foundTeleporters and #foundTeleporters > 0 then
local filteredCandidates = {}
for i = 1, #foundTeleporters do
local c = foundTeleporters[i]
if c and c.pos then
local dEnd = GP_TP_GetDistance(c.pos, endpointPos)
if dEnd <= endpointFilterRadius then
filteredCandidates[#filteredCandidates + 1] = c
end
end
end
if #filteredCandidates > 0 then
activeTeleporterCandidates = filteredCandidates
end
end
end
end
if activeTeleporterCandidates and #activeTeleporterCandidates > 0 then
local validated = {}
local mePosNow = me:GetAbsOrigin()
for i = 1, #activeTeleporterCandidates do
local c = activeTeleporterCandidates[i]
local ent = c and c.entity
if ent and ent.GetClass and ent.GetAbsOrigin and GP_TP_IsUsableTeleporter(ent) then
local class = ent:GetClass()
local mode = -1
if ent.GetPropInt then
local okMode, m = pcall(ent.GetPropInt, ent, "m_iObjectMode")
if okMode and type(m) == "number" then mode = m end
end
local isEntrance = (class == "CObjectTeleporterEntrance") or (mode == 0)
if isEntrance then
local p = ent:GetAbsOrigin()
if p then
c.pos = p
if mePosNow then
c.distance = GP_TP_GetDistance(mePosNow, p)
else
c.distance = GP_TP_GetDistance(me:GetAbsOrigin(), p)
end
validated[#validated + 1] = c
end
end
end
end
table.sort(validated, function(a, b) return (a.distance or math.huge) < (b.distance or math.huge) end)
activeTeleporterCandidates = validated
end
if activeTeleporterCandidates and #activeTeleporterCandidates > 0 then
tpTeleporterSeenCount = (tpTeleporterSeenCount or 0) + 1
else
tpTeleporterSeenCount = 0
end
local tpStableNeeded = (TP_TELE_STABLE_SCANS or 8)
if tpForceModeEnabled then
tpStableNeeded = 1
end
local fromWaitingState = waitingAtEndpoint
if activeTeleporterCandidates and #activeTeleporterCandidates > 0 and (tpTeleporterSeenCount >= tpStableNeeded) then
if tpNoTeleFallbackActive then
tpNoTeleFallbackActive = false
end
tpFallbackWaitPopupShown = false
tpFallbackNextWaitNotify = 0
tpIsWaitingForTeleporter = false
tpWaitMoveWarnNext = 0
tpWaitMoveWarnCount = 0
local nearestTele = activeTeleporterCandidates[1]
local dist = GP_TP_GetDistance(me:GetAbsOrigin(), nearestTele.pos)
local stopDistance = (TP_TELE_STOP_DISTANCE or 75)
if fromWaitingState then
stopDistance = math.min(stopDistance, (TP_TELE_WAIT_STOP_DISTANCE or 24))
end
local shouldMove = (dist > stopDistance)
if shouldMove then
if not GP_TP_CheckAndHandleStuck(me, nearestTele, dist, currentTime) then
GP_TP_WalkToTeleporter(cmd, me, nearestTele.pos)
end
else
GP_TP_ResetStuckTracker()
teleporterConfig.autoWalkEnabled = false
teleporterJustUsed = true
tpLastReachedTeleporterAt = currentTime
tpIsWaitingForTeleporter = false
tpNoTeleFallbackActive = false
tpWaitMoveWarnNext = 0
tpWaitMoveWarnCount = 0
GP_TP_StartUseVerify(me, nearestTele.pos, currentTime)
sniperUpgradeCompletedTime = 0
end
else
if not tpNoTeleFallbackActive then
GP_TP_ResetStuckTracker()
end
tpNoTeleFallbackActive = true
GP_TP_WalkFallbackPath(cmd, me)
if tpIsWaitingForTeleporter and GP_TP_IsMoveLockActive() then
cmd:SetForwardMove(0)
cmd:SetSideMove(0)
end
end
end
else
if teleporterConfig.autoWalkEnabled then
teleporterConfig.autoWalkEnabled = false
end
tpIsWaitingForTeleporter = false
tpWaitMoveWarnNext = 0
tpWaitMoveWarnCount = 0
GP_TP_ResetStuckTracker()
if (currentTime - lastTpClassWarnTime) > 1.5 then
lastTpClassWarnTime = currentTime
end
end
else
teleporterConfig.autoWalkEnabled = false
tpIsWaitingForTeleporter = false
tpWaitMoveWarnNext = 0
tpWaitMoveWarnCount = 0
GP_TP_ResetStuckTracker()
end
if autoWalkPaused then
local preWaveProofNow = ((GP_HasExplicitPreWave1Proof and GP_HasExplicitPreWave1Proof()) or false)
if autoWalkPauseReason == "after_wave1" and preWaveProofNow then
autoWalkPaused = false
autoWalkPauseReason = nil
lastAutoWalkPauseReason = nil
elseif autoWalkPauseReason == "threshold" and (not IsMoneyThresholdReached()) then
autoWalkPaused = false
autoWalkPauseReason = nil
thresholdNotificationShown = false
medicThresholdReached = false
elseif autoWalkPauseReason == "threshold" and GP_RST and GP_RST.medicCycleHardResetPending == true then
autoWalkPaused = false
autoWalkPauseReason = nil
thresholdNotificationShown = false
medicThresholdReached = false
hasTriedClassChange = false
pendingClassChange = false
classChangeUsePreWaveRules = false
pendingRetry = false
pendingRetryTargetClass = nil
pendingRetryTargetUntil = 0
end
end
if (not autoModeWalkActive) and ((not config.autoWalkEnabled) or autoWalkPaused) then
shouldGuidePlayer = false
midpoint = nil
return
end
local gpMedicHardResetPendingNow = (GP_RST and GP_RST.medicCycleHardResetPending == true)
if IsMoneyThresholdReached() and (not gpMedicHardResetPendingNow) then
GP_OnThresholdReached(me, currentTime, inZone, true)
if config.changeClassEnabled and (not hasTriedClassChange) and IsMvMWaveActive() and inZone and IsMedic(me) then
local retryTarget = GP_GetPostWaveStationSwapTarget(me)
if retryTarget and (currentTime - (lastRetryTime or 0)) > RETRY_COOLDOWN then
AddNotification("Wave active - retrying to change class", "warning")
lastRetryTime = currentTime
hasTriedClassChange = true
pendingRetry = true
pendingRetryTargetClass = retryTarget
pendingRetryTargetUntil = currentTime + 90.0
client.Command("retry", true)
end
end
return
end
local isExpl = isExploiting
local tpOwnsAutoMovement = false
do
if tpUseVerifyActive then
tpOwnsAutoMovement = true
elseif teleporterConfig.autoWalkEnabled and (tpNoTeleFallbackActive or tpIsWaitingForTeleporter) then
tpOwnsAutoMovement = true
end
end
if tpOwnsAutoMovement then
shouldGuidePlayer = false
midpoint = nil
elseif canAutoMoveNow and (not inZone) and IsMedic(me) and hasVacc and not isExpl then
local inSpawnArea = IsInAutoCreditSpawnArea(me)
if inSpawnArea then
local newMidpoint = FindUpgradeStations(me)
if newMidpoint then
midpoint = newMidpoint
if not shouldGuidePlayer then
shouldGuidePlayer = true
AddNotification("Found upgrade station at: " .. tostring(midpoint.x) .. ", " .. tostring(midpoint.y) .. ", " .. tostring(midpoint.z), "info")
end
else
if shouldGuidePlayer then
AddNotification("Lost sight of upgrade station!", "warning")
end
shouldGuidePlayer = false
midpoint = nil
end
else
if shouldGuidePlayer then
AddNotification("Stopped guidance - reached zone or started exploit", "info")
end
shouldGuidePlayer = false
midpoint = nil
medicSpawnAnchor = nil
end
else
if shouldGuidePlayer then
AddNotification("Stopped guidance - reached zone or started exploit", "info")
end
shouldGuidePlayer = false
midpoint = nil
end
if (not tpOwnsAutoMovement) and shouldGuidePlayer and midpoint and canAutoMoveNow then
WalkTo(cmd, me, midpoint)
elseif (not canAutoMoveNow) then
shouldGuidePlayer = false
midpoint = nil
end
if tpIsWaitingForTeleporter and GP_TP_IsMoveLockActive() and IsManualMoveInput() then
GP_TP_ApplyMovementLock(cmd)
end
do
local tpAnyModeOn = (tpForceModeEnabled == true) or ((config and config.tpWalkEnabled) == true)
local lockConfigured = tpAnyModeOn and (config and config.tpWalkMoveLockEnabled == true)
if tpUseVerifyActive and lockConfigured and (teleporterConfig and teleporterConfig.autoWalkEnabled == true) and IsManualMoveInput() then
GP_TP_ApplyMovementLock(cmd)
end
end
GP_TP_HandleAimbotSuppression(currentTime)
if isExploiting and me:GetPropInt('m_bInUpgradeZone') ~= 1 and not respawnExpected then
ForceCleanup()
return
end
if respawnExpected and me:GetPropInt('m_bInUpgradeZone') == 1 then
respawnExpected = false
end
if isExploiting and not me:IsAlive() and not respawnExpected then
ForceCleanup()
AddNotification("Sequence interrupted!", "error")
return
end
if isExploiting or isUpgradingSniper then
ProcessExploitQueue()
end
end)
callbacks.Register("Unload", function()
if GhostMoney and GhostMoney.Internal and GhostMoney.Internal.Shutdown then pcall(GhostMoney.Internal.Shutdown) end
GP_TP_AimbotRestoreOnUnload()
ForceCleanup()
SaveConfig(GP_CfgPath(), config)
end)
AddNotification("Loaded GhostMoney by golden pan!", "info")
if gpHadActiveTogglesOnLoad and entities.GetLocalPlayer() ~= nil and ((engine.GetMapName and engine.GetMapName()) or "") ~= "" then
AddNotification("Detected active toggles - some states reset", "warning", 5.0)
end
function GP_ResetUIToCenter()
local screenW, screenH = draw.GetScreenSize()
local width = 260
local height = 44
watermarkX = math.floor((screenW - width) / 2)
watermarkY = math.floor((screenH - height) / 2)
config.watermarkX = watermarkX
config.watermarkY = watermarkY
SaveConfig(GP_CfgPath(), config)
AddNotification("UI reset to center", "success")
end
function GP_ResetCfgToDefaults()
local defaults = {
transparentEnabled = false,
hideHotkeysInUI = false,
hideInfoPopups = false,
partyGpKillEnabled = false,
partyGpLeaveEnabled = false,
autoDisconnectEnabled = false,
autoWalkEnabled = false,
autoBuyEnabled = false,
forceSniperBuyEnabled = false,
tpWalkEnabled = false,
forceTpWalkEnabled = false,
tpWalkMoveLockEnabled = true,
tpWalkWhitelistEnabled = false,
firstJoinPickMedic = false,
mvmReadyTpCycleEnabled = true,
instantRespawnEnabled = false,
all_off_key = KEY_X,
watermarkX = 10,
watermarkY = 10,
moneyThreshold = 5500,
changeClassEnabled = false,
targetClass = ""
}
for k, _ in pairs(config) do
config[k] = nil
end
for k, v in pairs(defaults) do
config[k] = v
end
WALK_KEY = KEY_L
CLEAN_KEY = KEY_K
AUTO_KEY = KEY_J
TP_KEY = KEY_O
ALL_OFF_KEY = KEY_X
config.all_off_key = KEY_X
tpForceModeEnabled = false
forceSniperBuyModeEnabled = false
gpSniperBuyLoadRearmPending = false
gpHadSniperBuyActiveOnLoad = false
gpStickyAutoBuyEnabled = false
gpStickyForceSniperBuyEnabled = false
allOffRestoreSnapshot = nil
allOffRestoreUntil = 0
if HardReset then
pcall(HardReset, "Config reset")
else
if ForceCleanup then pcall(ForceCleanup) end
if ResetRuntimeState then pcall(ResetRuntimeState, "Config reset") end
end
SaveConfig(GP_CfgPath(), config)
GP_F4_OnFeatureToggle(config.mvmReadyTpCycleEnabled == true)
AddNotification("Config reset to defaults", "success")
end
function GP_UIResetCmd(cmd)
local raw = cmd:Get()
if not raw then return end
local args = {}
for w in string.gmatch(raw:lower(), "%S+") do
table.insert(args, w)
end
if args[1] == "gp_gm_ui_reset" then
GP_ResetUIToCenter()
cmd:Set("")
return false
elseif args[1] == "gp_gm_cfg_reset" then
GP_ResetCfgToDefaults()
cmd:Set("")
return false
end
end
callbacks.Register("SendStringCmd", "gp_gm_ui_reset_cmd", GP_UIResetCmd)

do
GhostMoney.Modules = GhostMoney.Modules or {}

function __GM_bind(bucket, alias, gname)
GhostMoney.Modules[bucket] = GhostMoney.Modules[bucket] or {}
local fn = _G[gname]
if type(fn) == "function" then
GhostMoney.Modules[bucket][alias] = fn
end
end

__GM_bind("UI", "AddNotification", "AddNotification")
__GM_bind("Core", "GP_ArmReloadMoveLock", "GP_ArmReloadMoveLock")
__GM_bind("Core", "GP_CaptureActiveToggleSnapshot", "GP_CaptureActiveToggleSnapshot")
__GM_bind("Core", "GP_CheckSniperUpgradeDone", "GP_CheckSniperUpgradeDone")
__GM_bind("Core", "GP_DisableAllActiveToggles", "GP_DisableAllActiveToggles")
__GM_bind("UI", "DrawRightClickMenu", "GP_DrawRightClickMenu")
__GM_bind("F4", "IsFeatureEnabled", "GP_F4_IsFeatureEnabled")
__GM_bind("F4", "IsPreWave1State", "GP_F4_IsPreWave1State")
__GM_bind("F4", "OnDisconnectCycle", "GP_F4_OnDisconnectCycle")
__GM_bind("F4", "OnFeatureToggle", "GP_F4_OnFeatureToggle")
__GM_bind("F4", "OnJoinCycle", "GP_F4_OnJoinCycle")
__GM_bind("F4", "OnTpSuccess", "GP_F4_OnTpSuccess")
__GM_bind("F4", "SetGuiAutoReady", "GP_F4_SetGuiAutoReady")
__GM_bind("F4", "Sync", "GP_F4_Sync")
__GM_bind("Query", "GetCurrentClassName", "GP_GetCurrentClassName")
__GM_bind("Query", "GetGameRulesProxy", "GP_GetGameRulesProxy")
__GM_bind("Query", "GetPostWaveAutoCreditTargetClass", "GP_GetPostWaveAutoCreditTargetClass")
__GM_bind("Query", "GetPostWaveStationSwapTarget", "GP_GetPostWaveStationSwapTarget")
__GM_bind("Query", "GetRoundState", "GP_GetRoundState")
__GM_bind("Query", "GetWaveNumber", "GP_GetWaveNumber")
__GM_bind("Flow", "HandlePartyKillFromEvent", "GP_HandlePartyKillFromEvent")
__GM_bind("Query", "HasExplicitPreWave1Proof", "GP_HasExplicitPreWave1Proof")
__GM_bind("Query", "HasMoveIntent", "GP_HasMoveIntent")
__GM_bind("Query", "IsInSpawnRadiusArea", "GP_IsInSpawnRadiusArea")
__GM_bind("Query", "IsMedic", "GP_IsMedic")
__GM_bind("Query", "IsMvM", "GP_IsMvM")
__GM_bind("Query", "IsPostWaveSwapRestricted", "GP_IsPostWaveSwapRestricted")
__GM_bind("Query", "IsTextInputOpen", "GP_IsTextInputOpen")
__GM_bind("UI", "MiscCloseMenuState", "GP_MiscCloseMenuState")
__GM_bind("UI", "MiscComputePanels", "GP_MiscComputePanels")
__GM_bind("UI", "MiscIsMouseOver", "GP_MiscIsMouseOver")
__GM_bind("UI", "MiscResetKeyBindState", "GP_MiscResetKeyBindState")
__GM_bind("UI", "MiscSubItemCount", "GP_MiscSubItemCount")
__GM_bind("Core", "GP_NormalizeChatCmd", "GP_NormalizeChatCmd")
__GM_bind("Flow", "OnSniperUpgradesComplete", "GP_OnSniperUpgradesComplete")
__GM_bind("Restart", "Arm", "GP_RST_Arm")
__GM_bind("Restart", "ClassNum", "GP_RST_ClassNum")
__GM_bind("Restart", "DecideTarget", "GP_RST_DecideTarget")
__GM_bind("Restart", "EventKind", "GP_RST_EventKind")
__GM_bind("Restart", "GetConfiguredTargetClass", "GP_RST_GetConfiguredTargetClass")
__GM_bind("Restart", "GetVotePayloadText", "GP_RST_GetVotePayloadText")
__GM_bind("Restart", "IsClassChangeAllowed", "GP_RST_IsClassChangeAllowed")
__GM_bind("Restart", "IsNegativeVotePayload", "GP_RST_IsNegativeVotePayload")
__GM_bind("Restart", "IsRestartVotePayload", "GP_RST_IsRestartVotePayload")
__GM_bind("Restart", "Log", "GP_RST_Log")
__GM_bind("Restart", "NotifyDetected", "GP_RST_NotifyDetected")
__GM_bind("Restart", "Now", "GP_RST_Now")
__GM_bind("Restart", "OnEvent", "GP_RST_OnEvent")
__GM_bind("Restart", "PrepareMedicCycle", "GP_RST_PrepareMedicCycle")
__GM_bind("Restart", "PrepareSniperCycle", "GP_RST_PrepareSniperCycle")
__GM_bind("Restart", "Queue", "GP_RST_Queue")
__GM_bind("Restart", "RearmForceTpWalk", "GP_RST_RearmForceTpWalk")
__GM_bind("Restart", "RearmTpWalkNormal", "GP_RST_RearmTpWalkNormal")
__GM_bind("Restart", "Reset", "GP_RST_Reset")
__GM_bind("Restart", "StartForce", "GP_RST_StartForce")
__GM_bind("Restart", "StopForce", "GP_RST_StopForce")
__GM_bind("Restart", "TickForce", "GP_RST_TickForce")
__GM_bind("Restart", "TickQueuedStart", "GP_RST_TickQueuedStart")
__GM_bind("Restart", "TickState", "GP_RST_TickState")
__GM_bind("Restart", "UpdateKind", "GP_RST_UpdateKind")
__GM_bind("Core", "GP_RebuildSpawnAreaAnchors", "GP_RebuildSpawnAreaAnchors")
__GM_bind("Config", "ResetCfgToDefaults", "GP_ResetCfgToDefaults")
__GM_bind("Config", "ResetUIToCenter", "GP_ResetUIToCenter")
__GM_bind("Core", "GP_RestoreActiveToggleSnapshot", "GP_RestoreActiveToggleSnapshot")
__GM_bind("Core", "GP_SafeCall", "GP_SafeCall")
__GM_bind("Toggles", "SetAutoCreditEnabled", "GP_SetAutoCreditEnabled")
__GM_bind("Toggles", "SetForceSniperBuyEnabled", "GP_SetForceSniperBuyEnabled")
__GM_bind("Toggles", "SetTpForceEnabled", "GP_SetTpForceEnabled")
__GM_bind("Toggles", "SetTpWalkEnabled", "GP_SetTpWalkEnabled")
__GM_bind("Core", "GP_ShouldAllowPostWaveStationSwapWithoutThreshold", "GP_ShouldAllowPostWaveStationSwapWithoutThreshold")
__GM_bind("Core", "GP_SnapshotHasAnyActive", "GP_SnapshotHasAnyActive")
__GM_bind("TP", "ApplyMovementLock", "GP_TP_ApplyMovementLock")
__GM_bind("TP", "ArmSpawnToggleLock", "GP_TP_ArmSpawnToggleLock")
__GM_bind("TP", "BuildTargetId", "GP_TP_BuildTargetId")
__GM_bind("TP", "CheckAndHandleStuck", "GP_TP_CheckAndHandleStuck")
__GM_bind("TP", "CheckAndHandleWaypointStuck", "GP_TP_CheckAndHandleWaypointStuck")
__GM_bind("TP", "HandleWaitingPopups", "GP_TP_HandleWaitingPopups")
__GM_bind("TP", "IsMoveLockActive", "GP_TP_IsMoveLockActive")
__GM_bind("TP", "IsSetupPhase", "GP_TP_IsSetupPhase")
__GM_bind("TP", "IsSpawnContextNow", "GP_TP_IsSpawnContextNow")
__GM_bind("TP", "IsToggleSpawnUnlocked", "GP_TP_IsToggleSpawnUnlocked")
__GM_bind("TP", "ResetPathState", "GP_TP_ResetPathState")
__GM_bind("TP", "ResetStuckTracker", "GP_TP_ResetStuckTracker")
__GM_bind("TP", "StartUseVerify", "GP_TP_StartUseVerify")
__GM_bind("TP", "StopUseVerify", "GP_TP_StopUseVerify")
__GM_bind("TP", "TickUseVerify", "GP_TP_TickUseVerify")
__GM_bind("TP", "WalkFallbackPath", "GP_TP_WalkFallbackPath")
__GM_bind("Query", "TryGetEventString", "GP_TryGetEventString")
__GM_bind("Query", "TryPropInt", "GP_TryPropInt")
__GM_bind("UI", "UIResetCmd", "GP_UIResetCmd")
__GM_bind("Core", "GP_UpdateSpawnSignAnchor", "GP_UpdateSpawnSignAnchor")
__GM_bind("Core", "IsMedic", "IsMedic")

GhostMoney.API = GhostMoney.API or {}

function GhostMoney.API.GetRuntime()
return GhostMoney.Runtime
end

function GhostMoney.API.GetConfig()
return config
end

function GhostMoney.API.Save()
if SaveConfig and GP_CfgPath and config then
pcall(SaveConfig, GP_CfgPath(), config)
end
end

function GhostMoney.API.ResetRuntime(reason)
if ResetRuntimeState then
pcall(ResetRuntimeState, reason or "API reset")
end
end
end

end
__GM_PART2__()
