# 🎯 Reretarget Addon

![GitHub](https://img.shields.io/badge/Version-1.0.0-blue)
![GitHub](https://img.shields.io/badge/License-MIT-green)
![GitHub](https://img.shields.io/badge/Requires-SuperWoW-red)
![GitHub](https://img.shields.io/badge/Game-World%20of%20Warcraft-orange)

Reretarget is a **World of Warcraft** addon designed to automatically retarget a unit after they use specific spells or abilities that cause them to disappear or become untargetable. This addon is particularly useful for **PvP scenarios** where players frequently use abilities like **Vanish**, **Feign Death**, or **Stealth**.

---
## ⚙️ Requirements

- **[SuperWoW](https://github.com/balakethelock/SuperWoW)**: This addon requires **SuperWoW** to function properly. Make sure to install SuperWoW before using Reretarget.

---

## ✨ Features

- **🎯 Automatic Retargeting**: Automatically retargets a unit after they use a tracked spell.
- **⏳ Customizable Timeout**: Configure the time window in which the addon will attempt to retarget.
- **📜 Tracked Spells**: Easily add or remove spells by their **ID** or **name**.
- **⚙️ Lightweight & Efficient**: Built with performance in mind.

---

## 🔧 Configuration

To start configuring the addon, open **Reretarget**.lua in main folder.

### `retargetTimeout`

The `retargetTimeout` variable defines the time window (in seconds) during which the addon will attempt to retarget a unit after they use a tracked spell. By default, this is set to **19 seconds**.

```Reretarget.retargetTimeout = 19  -- Time window in seconds```

### `trackedSpells`

The `trackedSpells` table contains the list of spells that the addon will track. You can add or remove spells by their **spell ID** or **name**. By default, the addon tracks the following spells:

```
Reretarget.trackedSpells = {
    [11392] = true,  -- Invisibility Potion
    [3680] = true,   -- Lesser Invisibility Potion
    [4079] = true,   -- Gnomish Cloaking Device
    ["Feign Death"] = true,
    ["Vanish"] = true,
    ["Stealth"] = true,
}
```

