# Dectorio

A simple mod that adds decorative elements to beautify your factory. New technology research is required to unlock the various items before they can be crafted and some default recipes are adjusted to better reflect how these items should be made.

Inspiration for the mod came from a lot of other mods on the Factorio mod portal, although all the assets in Dectorio have been custom made for this mod and are either modified versions of base game assets or created from scratch. If you'd like to use any of these in your own mod, please observe the GNU GPLv3 license.

Requires Factorio version 0.15 or later.

## How to install

Download the latest stable release from the [Factorio mod portal](https://mods.factorio.com/mods/PantherX/Dectorio) or at <https://github.com/jpanther/Dectorio/releases/latest> and copy the entire zip file to your Factorio mods directory:

* Windows: `%appdata%\Factorio\mods`
* Mac: `~/Library/Application Support/factorio/mods/`
* Linux: `~/.factorio/mods`

When you launch the game, the new mod will be enabled by default.

## Current Features

### Flooring styles

* Adds basic gravel path (placed using raw stone)
* Adds wooden floorboard tiles with sound effects

  ![Gravel and Wooden floorboards](https://cl.ly/253y1V0W362e/gravelwood.png)

* Adds painted concrete tiles - Hazard (black/yellow), Danger (red/yellow), Emergency (white/red), Caution (orange/white), Radiation hazard (yellow/pink), Defect (blue/white), Operations (black/white) and Safety (white/green)

  ![Painted concrete](https://cl.ly/2D04401r202w/paintconcrete.png)

* Painted Hazard concrete replaces default Hazard concrete^
* Increased flooring item stack sizes^

### Landscaping

* Adds items for placing dirt, sand, dark sand, grass, dry grass, red desert and dark red desert tiles
* Ability to place water and green water tiles (aka. 'waterfill')

  ![Landscaping items](https://cl.ly/171X1J1s1D24/landscapeitems.png)

### Walls and Gates

* Adds items for wooden barricade, stone wall, chain-link fence and concrete walls
* Walls have varied resistances and strengths to allow for better progression
* Increased wall item stack sizes^

  ![Walls](https://cl.ly/0N0p3y0D3m2k/4walls.png)

* Adds items for hazard gates

  ![Gates](https://cl.ly/042x3E3P0A0o/hazgate.png)

### Signs

* Adds placable wooden and steel signs with configurable icons

  ![Signs](https://cl.ly/2K0Q3V2Q062y/signs.png)

### Signals & Lamps

* Adds a new Glowing lamp that will glow bright colours over a large radius when passed a coloured signal from the circuit network

  ![Glowing lamp](https://cl.ly/2i0b1F383D2a/glow.png)

* Adds new signal colours - purple, orange, tangerine and aqua^
* Adds signal colours for raw resources, smelted items, fluids, science packs, inserters, belts, splitters and circuits^

  ![New signal colours](https://cl.ly/2R04150O0P0m/signals.png)

* Adds new icon based signals for making it easier to understand your circuit network logic
* New signal icons for base game signal colours that better represent the actual signal colour

  ![Signal selection](https://cl.ly/443j3p1R1712/signal-icons.png)

### General

* Includes settings for enabling or disabling each of the above features (Options > Mods > Startup). Ideally these should only be changed before starting a new game. Changes on existing games will require content to be migrated and some items may be lost if you disable components you've already used on an existing save. Always make a backup first!

  ![Mod settings](https://cl.ly/23261B1x1e38/modset.png)

* Items above marked ^ can be further customised in the mod settings dialog

Check out the [Mod Spotlight video by Xterminator](https://www.youtube.com/watch?v=4OOs8o0dnug) to see the mod in action (note that this features an older version of Dectorio without some of the features mentioned above).

## Development

### Bugs & Suggestions

Feel free to get in touch with any issues or suggestions for new features you'd like to see. You can get in contact via the 'Discussion' tab on the [Factorio mod portal](https://mods.factorio.com/mods/PantherX/Dectorio/discussion), the [Factorio Forums](https://forums.factorio.com/memberlist.php?mode=viewprofile&u=28042) or you can also view and log issues directly to the GitHub repo.

### Language Support

Supported languages:
* English
* German
* Polish

If you are able to translate the mod into an additional language, please let me know and I'll package it into the bundle for distribution (with credit to you).

### Mod Compatibility

Limited testing has been completed with other mods. Warnings will be shown in-game to highlight any known issues. If you come across a specific compatibility issue, please let me know and I'll see what I can do to fix it.

Mods with additional Dectorio support (thanks!): [Concreep](https://mods.factorio.com/mods/Mylon/Concreep), [FARL](https://mods.factorio.com/mods/Choumiko/FARL), [Pavement Drive Assist](https://mods.factorio.com/mods/Arcitos/PavementDriveAssist)

It is not recommended to use other coloured signal mods at the same time as Dectorio. This can cause coloured signals to be overwritten multiple times and lead to game-breaking compatibility issues with other mods. If you would like more colours, you can add these in the Dectorio config.lua file (instructions are in the file).

### Changelog

Refer to the [CHANGELOG](CHANGELOG.md) for a detailed list of changes in each version.

### Credits

Developed with ❤ by [James Panther](https://github.com/jpanther) in Melbourne, Australia.  
Special thanks to [marcfj](https://github.com/marcfj) for support and playtesting.

#### Translators

German translation by [seeba8](https://github.com/seeba8).
Polish translation by [Tomirad](https://github.com/Tomirad).