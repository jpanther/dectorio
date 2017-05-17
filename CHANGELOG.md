# Changelog

The latest stable release is available at <https://github.com/jpanther/Dectorio/releases/latest>

## v0.5.7 - 2017-05-17

### Added
* New wall type - Wooden barricade (unlocked via _Basic walls_ technology)
* Shadow gfx for chain-link fence entities

### Changed
* Balancing - reduced max health of chain-link fence to make it less effective than concrete wall

## v0.5.6 - 2017-05-16

### Added
* New signal colours for additional items - science packs, transport/underground belts, splitters, inserters and red/green/blue circuits

### Changed
* Tweaked some existing signal colours to better match their item colour
* Widened wooden floorboard sprites so there is no gap when placed next to a wall

### Bugfixes
* Moved wooden floorboards to own layer so they don't join to concrete

## v0.5.5 - 2017-05-15

### Bugfixes
* Fixed migration error

## v0.5.4 - 2017-05-15

### Added
* New wall type - Chain-link fence (currently no shadow gfx, these will be added in a future release)

### Changed
* New Advanced walls technology that unlocks both concrete wall and chain-link fence
* Increased stack sizes of landscaping, flooring and walls (configurable in config.lua)

### Bugfixes
* More robust migration logic
* Fixed typo in migrated tech unlock that caused saves to not load in some rare instances

## v0.5.3 - 2017-05-14

### Added
* Landscaping now allows placement of dark sand, dry grass, red desert and dark red desert tiles
* New config.lua file that allows even more customisation over how the mod behaves
* Item descriptions for painted concrete

### Changed
* Gave all modded items prefixed prototype names to avoid potential clashes with other mods
* Better handling of migration for base Hazard concrete on existing saves when mod is added

## v0.5.2 - 2017-05-11

### Added
* New settings for enabling or disabling various parts of the mod (Options > Mods > Startup)

## v0.5.1 - 2017-05-11

### Changed
* Adjusted white/grey/black signal icons to follow same pattern as the other colours

## v0.5.0 - 2017-05-10

### Added
* Signal colours for raw resources, smelted items and fluids
* New signal colours - purple, orange, tangerine and aqua
* New signal icons for base game signal colours that better represent the actual signal colour

### Bugfixes
* Balancing - increased concrete wall health to better represent raw ingredient cost
* Changed stone walls to repurpose base "stone-wall" named prototypes to ensure compatibility with other mods
* Technology descriptions are now provided

## v0.4.1 - 2017-05-06

### Bugfixes
* Correctly disables base stone wall recipe in existing saves
* Migrates existing base stone wall to new stone wall
* Migrates existing hazard concrete to painted hazard concrete

## v0.4.0 - 2017-05-04

### Added
* Stone and Concrete wall variants

### Changed
* Removes decorations when placing base concrete and stone paths

## v0.3.0 - 2017-05-03

### Added
* Landscaping research that allows placement of dirt, sand and grass tiles
* Landfill now requires Landscaping to be researched as a pre-requisite

## v0.2.0 - 2017-05-02

### Added
* Radiation hazard painted concrete style
* Painted concrete can now be rotated
* Sound effects for wooden floorboards

### Changed
* Optimised wooden floorboard sprites
* Decorations are removed when placing wooden floorboards or painted concrete
* Renamed _Concrete paint_ technology to _Painted concrete_
* Removed tile collisions with base concrete

## v0.1.0 - 2017-04-30

### Initial Release
* Wooden floorboards
* Hazard, Emergency and Safety painted concrete styles
* Modified base concrete recipe to include iron pipe and remove iron ore requirement
* Disables base hazard concrete