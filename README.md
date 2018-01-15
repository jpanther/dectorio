# Dectorio
[![GitHub issues](https://img.shields.io/github/issues/jpanther/Dectorio.svg)](https://github.com/jpanther/Dectorio/issues) [![CrowdIn](https://d322cqt584bo4o.cloudfront.net/dectorio/localized.svg)](https://crowdin.com/project/dectorio) [![GitHub license](https://img.shields.io/github/license/jpanther/Dectorio.svg)](https://github.com/jpanther/Dectorio/blob/develop/LICENSE)

A simple mod that adds decorative elements to beautify your factory. New technology research is required to unlock the various items before they can be crafted and some default recipes are adjusted to better reflect how these items should be made.

Inspiration for the mod came from a lot of other mods on the Factorio mod portal, although all the assets in Dectorio have been custom made for this mod and are either modified versions of base game assets or created from scratch. If you'd like to use any of these in your own mod, please observe the GNU GPLv3 license.

Requires Factorio version 0.15 or later.

## How to install

Download the latest stable release from the [Factorio mod portal](https://mods.factorio.com/mods/PantherX/Dectorio) or at <https://github.com/jpanther/Dectorio/releases/latest> and copy the entire zip file to your Factorio mods directory:

* Windows: `%appdata%\Factorio\mods`
* Mac: `~/Library/Application Support/factorio/mods/`
* Linux: `~/.factorio/mods`

> **Note:** If playing with Factorio 0.15, please download v0.7.6 as this is the last stable release supported on 0.15. v0.8.0 and later are only supported on Factorio 0.16.

When you launch the game, the new mod will be enabled by default.

## Current Features

### Decorative items

* Adds traffic bollards for decorating roadways or protecting your factory from vehicular collisions

  ![Traffic bollard](https://img.pantherx.net/dectorio/traffic-bollard.png)

### Flooring styles

* Adds basic gravel paths (crafted from raw stone, coal, iron and copper)

  ![Gravel styles](https://img.pantherx.net/dectorio/gravel.png)

* Adds wooden floorboard tiles with sound effects
* Adds grid-based concrete that reflects the classic Factorio 0.15 style concrete

  ![Concrete and Wooden floorboards](https://img.pantherx.net/dectorio/concrete-wood.png)

* Adds painted concrete tiles - Hazard (black/yellow), Danger (red/yellow), Emergency (white/red), Caution (orange/white), Radiation hazard (yellow/pink), Defect (blue/white), Operations (black/white) and Safety (white/green)

  ![Painted concrete](https://img.pantherx.net/dectorio/painted-concrete.png)

* Painted Hazard concrete replaces default Hazard concrete^
* Increased flooring item stack sizes^

### Landscaping

* Adds items for placing dirt, sand, dark sand, grass, dry grass, red desert and dark red desert tiles
* Ability to place water and green water tiles (aka. 'waterfill')
* Ability to place decorative rocks and trees

  ![Landscaping items](https://img.pantherx.net/dectorio/landscaping.png)

### Walls and Gates

* Adds items for wooden barricade, stone wall, chain-link fence and concrete walls
* Walls have varied resistances and strengths to allow for better progression
* Increased wall item stack sizes^

  ![Walls](https://img.pantherx.net/dectorio/walls.png)

* Adds items for hazard gates

  ![Gates](https://img.pantherx.net/dectorio/hazard-gates.png)

### Signs

* Adds placable wooden and steel signs with configurable icons

  ![Signs](https://img.pantherx.net/dectorio/signs.png)

### Signals & Lamps

* Adds a new Glowing lamp that will glow bright colours over a large radius when passed a coloured signal from the circuit network

  ![Glowing lamp](https://img.pantherx.net/dectorio/glowing-lamp.png)

* Adds new signal colours - purple, orange, tangerine and aqua
* Adds signal colours for raw resources, smelted items, fluids, science packs, inserters, belts, splitters and circuits

  ![New signal colours](https://img.pantherx.net/dectorio/signal-colours.png)

* Adds new icon based signals for making it easier to understand your circuit network logic
* New signal icons for base game signal colours that better represent the actual signal colour

  ![Signal selection](https://img.pantherx.net/dectorio/signals.png)

### General

* Includes settings for enabling or disabling each of the above features (Options > Mods > Startup). Ideally these should only be changed before starting a new game. Changes on existing games will require content to be migrated and some items may be lost if you disable components you've already used on an existing save. Always make a backup first!

  ![Mod settings](https://img.pantherx.net/dectorio/settings.png)

* Items above marked ^ can be further customised in the mod settings dialog

Check out the [Mod Spotlight video by Xterminator](https://www.youtube.com/watch?v=4OOs8o0dnug) to see the mod in action (note that this features an older version of Dectorio without some of the features mentioned above).

## Development

### Contributing

Feel free to get in touch with any issues or suggestions for new features you'd like to see. I also welcome pull requests to fix bugs or implement new features. The best way to make contact is via [GitHub Issues](https://github.com/jpanther/Dectorio/issues), however you can alternatively post on the [Factorio Mod Portal](https://mods.factorio.com/mods/PantherX/Dectorio/discussion) (but please note that it may take longer to get a response this way as there are no notifications of new messages on the portal and I only check it sporadically). Usually when I find issues reported on the Mod Portal, I'll open a new GitHub issue to track its progress.

#### **Did you find a bug?**

* **Ensure the bug was not already reported** by searching on GitHub under [Issues](https://github.com/jpanther/Dectorio/issues).
  > **Note:** If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.

* If you're unable to find an open issue addressing the problem, [open a new one](https://github.com/jpanther/Dectorio/issues/new). Be sure to include a **title and clear description**, as much relevant information as possible, and a **code sample** or a **test case** demonstrating the expected behaviour that is not occurring.

#### **Can you write a patch that fixes a bug or do you want to implement a new feature?**

* Fork the `develop` branch.
  > **Note:** The `master` branch is reserved for releases and is always in a 'production-ready' state. The `develop` branch is where the latest changes are developed and tested ahead of the next release.

* Create a new branch in your fork that describes the issue or new feature (i.e. `bugfix-nastybug` or `feature-mynewfeature`)

* Make the changes required to fix the bug or implement the new feature.

* Pull the upstream `develop` branch and merge it into your fork regularly to stay up to date with changes.

* When you're ready to submit your changes, and there are no conflicts with the upstream branch, push your fork and open a new GitHub pull request to the `develop` branch with your patch.

* Ensure the PR description clearly describes what the patch does. If it fixes a reported bug or feature request, include the relevant issue number.

### Language Support

Dectorio uses CrowdIn to translate the mod into various languages.

Fully supported languages:
* English

Community translations:
* Chinese Simplified (29%)
* Chinese Traditional (35%)
* Czech (37%)
* German (100%)
* Korean (100%)
* Polish (69%)
* Russian (100%)

If you are able to translate the mod into any of the above languages, or you know an additional language that you'd like to add a new translation for, please visit the [Dectorio project on CrowdIn](https://crowdin.com/project/dectorio) to help with the translation effort.

### Mod Compatibility

**Note:** If playing with Factorio 0.15 saves, please download Dectorio v0.7.6 as this is the last release supported on 0.15. Dectorio v0.8.0 and later are only supported on Factorio 0.16.

Limited testing has been completed with other mods. Warnings will be shown in-game to highlight any known issues. If you come across a specific compatibility issue, please let me know and I'll see what I can do to fix it.

It is not recommended to use other coloured signal mods at the same time as Dectorio. This can cause coloured signals to be overwritten multiple times and lead to game-breaking compatibility issues with other mods. If you would like more colours, you can add these in the Dectorio config.lua file (instructions are in the file).

Dectorio includes specific support for [Alien Biomes](https://mods.factorio.com/mods/Earendel/alien-biomes).

Other mods with additional Dectorio support (thanks!): [Concreep](https://mods.factorio.com/mods/Mylon/Concreep), [FARL](https://mods.factorio.com/mods/Choumiko/FARL), [Pavement Drive Assist](https://mods.factorio.com/mods/Arcitos/PavementDriveAssist).

Other decorative mods worth checking out (all compatible with Dectorio): [Asphalt Roads](https://mods.factorio.com/mods/Arcitos/AsphaltRoads), [Beautiful Bridge Railway](https://mods.factorio.com/mods/kapaer/beautiful_bridge_railway), [Color Coding](https://mods.factorio.com/mods/justarandomgeek/color-coding), [Naked Rails](https://mods.factorio.com/mods/futileohm/naked-rails).

Mods with known compatibility issues with Dectorio (either don't install these, or edit your mod settings and disable the conflicting components in Dectorio): [Expanded Color Lamps](https://mods.factorio.com/mods/Klonan/Expanded_Color_Lamps), [More Colours](https://mods.factorio.com/mods/zx64/more-colours), [More signal color](https://mods.factorio.com/mods/devilwarriors/More%20signal%20color), [Concrete and Stone](https://mods.factorio.com/mods/Earendel/concrete-and-stone), [Reinforced Walls](https://mods.factorio.com/mods/ChurchOrganist/Reinforced-Walls), [No Walls or Gates](https://mods.factorio.com/mods/abregado/no-walls), [Picker Tweaks](https://mods.factorio.com/mods/Nexela/PickerTweaks).

### Changelog

Refer to the [CHANGELOG](changelog.txt) for a detailed list of changes in each version. The changelog is also available in-game from the _Mods_ screen.

### Credits

Developed with ❤ by [James Panther](https://github.com/jpanther) in Melbourne, Australia.  
Special thanks to [marcfj](https://github.com/marcfj) for support and play testing.

#### Translators

German translation by [seeba8](https://github.com/seeba8) and [ST-DDT](https://crowdin.com/profile/ST-DDT).  
Polish translation by [Tomirad](https://github.com/Tomirad).  
Czech translation by [dereksp](https://crowdin.com/profile/dereksp).  
Korean translation by [Xagros](https://crowdin.com/profile/GimoXagros).  
