# GhostMoney by golden pan [TF2-Lua-MvM]

MvM automation featuring credit farming, Godspot Sniper auto-upgrades, and automatic teleporter navigation  
(**TpWalk - Two Cities only**)

Use at your own risk and responsibility.  

---

### Important

Please read the full instructions before reporting that something does not work.

---

### Ping Note

Script behavior is ping-based.  
With high ping, money automation and SniperBuy purchasing may respond slower, and some actions (such as Smart F4 or Instant Respawn) may occasionally fail to trigger.

---

### Editing Warning

Do not modify internal Lua logic unless you know exactly what you are doing.  
Random changes will likely break functionality.
The Lua file is minified, so it may look unusual when you open it.

---

## Features

### Core (Toggles)

- AutoCredit > Automatic redit farming + walk  
  Toggle key: **L**
  
- SniperBuy > Automatic sniper upgrades + walk  
  Toggle key: **J**

- TpWalk > Automatic teleporter walk (Two Cities only)  
  Toggle key: **O**

- Cleanup button  
  Key: **K**

- Force SniperBuy  
  Hold **J** for 2 seconds, or toggle it in the main UI

- Force TpWalk  
  Hold **O** for 2 seconds, or toggle it in the main UI

---

### Misc

- Target Class & Money Threshold  
  - Set both by left-clicking **Class** or **Cash** in the main UI.

- Anti-stuck for (Force) TpWalk and SniperBuy (always on)  
  - Kills the player if the teleporter is not reached in time or teleport fails  
  - Kills the player if the upgrade station is not reached in time

- Optional party-chat kill command: `gp_kill`  
  - Kills you when someone in your party chat types the command  
    Intended for recovery if you are AFK and fall off the Godspot

- Optional party-chat leave command: `gp_leave`  
  - Disconnects you from the current server when someone in your party chat types the command  
    Intended for leaving a lobby while AFK if a requeue is needed

- Lock TpWalking  
  - Prevents movement while walking to the teleporter (enabled by default)  
  - Aimbot is suppressed during locked TpWalk movement  
    - Aimbot is turned on 1 second after reaching the teleporter (not during the waiting state), regardless of whether it was on or off before

- TpWalk Whitelist  
  - Force and normal TpWalk will only use teleporters from players with **priority 1** in the LBOX player list  
    - You can find the player list under **LBOX > Misc > Player List** (not part of this Lua)  
    - Set priority to 1 for the players whose teleporters should be used  
    - Multiple players can be set to priority 1

- First Join Medic  
  - On first join, it automatically selects Medic during pre-wave 1 for AutoCredit

- Smart F4  
  - During pre-wave 1, it stays off until teleport/start is reached, then continues normally  
  - On wave fail/restart:  
    - Pre-wave 1 restart: behaves like normal pre-wave logic (off until teleport/start)  
    - Post-wave 1 restart: waits 30 seconds, then resumes normal behavior

- Instant Respawn  
  - Instantly respawns after death  
  - Helps prevent unwanted Medic revives  
  - After wave fail/restart, it is locked for 8 seconds in case you die between old and new round state
 
- Configurable hotkeys for main features

- Cleanup function available for stuck upgrade-related states (default: **K**)

- Emergency disable (default: **X**)  
  - Disables all active toggles  
    - Press again within 60 seconds to restore previously active toggles (useful if something goes wrong or manual action is needed)

- Detects wave fails and restart votes  
  - Restores previously active states and prepares for the current wave state and active settings

- Info popups for state/status feedback  
  - Can be disabled in Misc

- Saves last settings  
  - The config file is located in `gp_ghost` inside your Team Fortress 2 folder

---

## UI

- Draggable UI
- Cash slider (left-click cash value in main UI)
- Class selector (left-click class in main UI)
- UI toggles for:
  - AutoCredit
  - SniperBuy (+ Force)
  - TpWalk (+ Force)
  - Transparent mode
  - Hide hotkeys in UI
  - Hide info popups
  - Party `gp_kill` command
  - Party `gp_leave` command
  - Lock TpWalking
  - TpWalk Whitelist
  - First Join Medic
  - Smart F4
  - Instant Respawn

- Shows current toggle states:  
  **Gold = Enabled** / **Orange = Force mode** / **Grey = Disabled**

---

## Installation

1. Download the Lua file.  
2. Place it into your Lua scripts folder.  
3. Load the Lua.

---

## Usage

Open options by right-clicking the main UI.

### Autocredit (Default: L)

- Farms money as Medic before Wave 1 starts  
- Requires Vaccinator and 600 starting credits  
- Set money threshold by left-clicking the cash value in the UI  
- Stops automatically when threshold is reached  
- Switches to selected target class afterward (if configured)

AutoCredit can remain enabled permanently and will automatically restart on a new server or after a map restart/fail.

---

### SniperBuy (Default: J or via UI toggle)

Works if you selected Sniper.

- Buys Godspot upgrades before Wave 1  
- After that, usually only after death/respawn  
- Saved per current server session, so not every death/respawn re-triggers it  
- Includes an anti-stuck failsafe for SniperBuy sequence issues

**Force SniperBuy**
- Hold J for 2 seconds or use the UI toggle  
- Buys upgrades inside station only (no auto-walk)

Both can remain enabled permanently and will restart automatically on a new server, after a map restart/fail, or after being toggled again.

---

### TpWalk (Default: O or via UI toggle)

Works if you selected Sniper.

- Walks to the nearest teleporter after SniperBuy purchases Godspot upgrades  
- Also works without SniperBuy  
- Re-triggers after death/respawn  
- Saved per server session

**Force TpWalk — works for any class**
- Hold O for 2 seconds or use the UI toggle
- Works for any class  
- Ignores upgrade restrictions  
- Triggers after respawn/death

Both can remain enabled permanently and will automatically resume after death/respawn, on a new server, after a map restart/fail, or when toggled again.

**Lock TpWalking**
- Prevents movement while searching/walking to the teleporter  
- While Lock TpWalking is active, anti-aimbot protection is applied during movement  
  - Aimbot is automatically turned on 1 second after reaching teleporter, even if it was off beforehand

### Other features are already explained in "Features"

---

### Reset Commands

If UI or settings break or become stuck:

- `gp_gm_ui_reset` → Resets UI position to screen center  
- `gp_gm_cfg_reset` → Fully resets all configuration values

Alternatively, delete the config file located in the `gp_ghost` folder inside your Team Fortress 2 directory.

---

## All Commands

- `gp_gm_cash <amount>`  
  Sets money threshold

- `gp_gm_class <class/off>`  
  Sets target class after threshold

- `gp_gm_ui_reset`  
  Resets UI to center screen

- `gp_gm_cfg_reset`  
  Resets all settings to default

---

## Warning

Use at your own risk and responsibility.  
You may get banned if you misuse this Lua.
