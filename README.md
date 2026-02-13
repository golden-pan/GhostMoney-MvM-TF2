# GhostMoney by golden pan [TF2-Lua-MvM]
MvM automation featuring credit farming, Godspot Sniper auto-upgrades, and automatic teleporter navigation (Two Cities only).
 
Use at your own risk and responsibility.  
Misuse of this Lua may result in a ban.

---

## Important

Please read the full instructions before reporting that something does not work.

---

### Ping Note

Script behavior is ping-based.  
With high ping, money automation and sniper upgrade purchasing may respond slower.

---

### Editing Warning

Do not modify internal Lua logic unless you know exactly what you are doing.  
Random changes will likely break functionality.

---

## Features

### Core

- Automatic credit farming + walk  
  Toggle key: L
  
- Automatic sniper upgrades + walk  
  Toggle key: J  

- Automatic teleporter walk (Two Cities only)  
  Toggle key: O  

- Cleanup button  
  Key: K  

- Force SniperBuy  
  Hold J for 2 seconds  

- Force TpWalk  
  Hold O for 2 seconds  

---

### Misc

- Lock TpWalking  
  Prevents movement while walking to the teleporter (enabled by default)  

- Anti-stuck for (Force) TpWalk 
  Kills the player if the teleporter is not reached in time or teleport fails  

- Anti-stuck for SniperBuy  
  Failsafe recovery if SniperBuy gets stuck during its sequence  

- AutoF4 behavior  
  - During pre-wave 1, it stays off until teleport/start is reached, then continues normally  
  - On wave fail/restart:
    - Pre-wave 1 restart: behaves like normal pre-wave logic (off until teleport/start)
    - Post-wave 1 restart: waits 30 seconds, then resumes normal behavior

- Anti-aimbot handling while TpWalking with Lock TpWalking enabled  
  - Aimbot is suppressed during locked TpWalk movement  
  - Aimbot is turned on 1 second after reaching teleporter (not while in the waiting state), regardless of whether it was on or off before

- Smart F4
  - After wave fail/restart, respawn handling is locked for 8 seconds in case you die between old and new round
  - Should prevent unwanted Medic revives

- First Join: Pick Medic
  - On first join, it will automatically select Medic during pre-wave 1.

- Info popups for state/status feedback - can be disabled

- Detects wave fail/success and restart votes  
  Restores previously active states  

- Saves last settings  

- Optional party-chat kill command: `gp_kill`
  Kills you when someone in your party chat types the command. Intended for recovery if you’re AFK and fall off the Godspot.

- Emergency disable (default: X)  
  - Disables all active toggles  
  - Press again within 60 seconds to restore previous active toggles (Very useful).

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
    - Hide Hotkeys in UI
    - Hide Info Pop ups
    - Party gp_kill command
    - Lock TpWalking
    - First Join: Pick Medic
    - Smart F4
 - Shows current toggles: 
Gold = Enabled  / Orange = Force mode  / Grey = Disabled  

Cleanup function available for stuck upgrade-related states (Default K)

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

Works if
you have selected Sniper  

- Buys Godspot upgrades before Wave 1  
- After that, usually only after death/respawn  
- Saved per current server session, so not every death/respawn will re-trigger it.
- Includes an anti-stuck failsafe for SniperBuy sequence issues

Force SniperBuy
- Hold J for 2 seconds or via UI toggle  
- Buys upgrades inside station only (no autowalk)  

---

### TpWalk (Default: O or via UI toggle)

Works if
you have selected Sniper  

- Walks to nearest teleporter after Sniperbuy bought Godspot upgrades.
- Works without Sniperbuy on too.
- Re-triggers after death/respawn  
- Saved per server session

Force TpWalk - WORKS FOR ANY CLASS:
- Hold O for 2 seconds or via UI toggle
- Works for any class  
- Ignores upgrade restrictions  
- Triggers after respawn/death  

Lock TpWalking:
- Prevents movement while searching/walking to teleporter  
- While Lock TpWalking is active, anti-aimbot protection is applied during movement  
- Aimbot is automatically turned on 1 second after reaching teleporter

### Other features are already explained in "Features"

---

### Reset Commands

If UI or settings break or become stuck:

- `gp_gm_ui_reset` → Resets UI position to screen center  
- `gp_gm_cfg_reset` → Fully resets all configuration values
Alternatively, delete the config file located in the gp_ghost folder inside your Team Fortress 2 directory

## Commands

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
