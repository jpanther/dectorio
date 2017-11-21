# Changelog

The latest stable release is available at <https://github.com/jpanther/Dectorio/releases/latest>

## v0.7.5 - 2017-11-21

### Added
* New crafting tab to separate decorative items from other crafting menus - can be disabled in settings (thanks to [Aidiakapi](https://github.com/Aidiakapi))
* New localisation system - help translate Dectorio by visiting [CrowdIn](https://crowdin.com/project/dectorio)
* Added initial Czech translation (thanks to [dereksp](https://crowdin.com/profile/dereksp))

### Bugfixes
* Fixed some audio and repairability issues with traffic bollards

## v0.7.4 - 2017-11-04

### Bugfixes
* Fixed technology error that appeared when Decoratives setting was set to disabled

## v0.7.3 - 2017-10-27

### Added
* New gfx variants for chain-link fence so it looks more realistic

### Bugfixes
* Major fixes to make signs more robust in multiplayer games
    * Signs are now indestructible and unminable while the player that placed the sign is selecting an icon
    * Icon selection GUI now has a 'Cancel' button
    * Only one sign can be placed at a time (by the same player), preventing blank signs from being placed
    * Icons are now indestructible and can only be removed by removing the sign
    * Icons are now correctly removed when a sign is destroyed, preventing orphaned icons from being left on the game surface

## v0.7.2 - 2017-10-26

### Added
* New gravel styles - Iron, Copper and Coal Gravel (placed using raw iron, copper and coal ores)
* New _Traffic bollard_ decorative item (unlocked via _Plastics_ technology)
* Landscaping technology now allows placement of decorative rock entities
* Better handling for when third party mods that affect Dectorio are added or removed

### Bugfixes
* Added some additional locale strings to fix issues with Creative Mode mod

## v0.7.1 - 2017-10-21

### Bugfixes
* Fixed migration error for existing saves without Alien Biomes mod

## v0.7.0 - 2017-10-20

Please take note of the concrete recipe changes in this release. You may need to adjust parts of your factory.

### Added
* New in-game settings for configuring Dectorio (replaces the old settings that were configured via config.lua)
* Landscaping support for Alien Biomes mod

### Changed
* Concrete recipe no longer requires iron sticks and reverts to the vanilla iron ore recipe
* Concrete walls now require iron sticks to craft
* Adjusted flooring layer priority so they appear correctly when placed adjacent to each other (order is now ground > gravel > stone path > wood floor > concrete)
* Tweaked minimap colours for some flooring styles

## v0.6.2 - 2017-10-10

### Added
* Polish translation (thanks to [Tomirad](https://github.com/Tomirad))

## v0.6.1 - 2017-10-05

### Changed
* Reverted Landfill crafting time back to vanilla recipe

### Bugfixes
* Fixed error in migration script that would cause a crash when painted concrete was disabled
* Fixed that signs would render icons incorrectly when placed on alternate surfaces (ie. when using Factorissimo)
* Fixed GUI bug that would crash headless server when placing signs with certain other mods enabled

## v0.6.0 - 2017-07-21

### Added
* Wooden and steel signs (unlocked via new _Signs_ technology)
* _Glowing lamp_ which will glow bright colours over a large radius when passed a signal from the circuit network
* Added more variations to the edge gfx for the gravel tiles
* New icon based signals for easier circuit network logic
* Signal colour for Steam

### Changed
* Hazard concrete now places as the vanilla hazard-concrete tile (fixes blueprint imports and issues when Dectorio is removed)
* Hazard concrete keeps the Dectorio look, however you can set a config.lua flag to change it to use the vanilla look, if preferred
* Balancing - halved crafting time of painted concrete

## v0.5.14 - 2017-07-18

### Added
* German translation (thanks to [seeba8](https://github.com/seeba8))

## v0.5.13 - 2017-07-12

### Bugfixes
* Notifications will no longer warn about incompatible mods when those components of Dectorio are disabled

## v0.5.12 - 2017-06-01

### Added
* New painted concrete types - Caution (orange/white), Danger (red/yellow), Defect (blue/white) and Operations (black/white)

### Changed
* Adjusted radiation and safety concrete variants to be less bright

### Bugfixes
* Fixed hazard-right-side variant not correctly masked
* Fixed painted concrete on different layer to normal concrete

## v0.5.11 - 2017-05-31

### Added
* New flooring - Gravel (placed using raw stone)
* Stone wall can now be upgraded to concrete wall

### Changed
* Adjusted map colours for flooring types to better distinguish the floors
* Landscaping items will no longer appear in blueprints (configurable in config.lua)
* Wooden walls can now be used as fuel

## v0.5.10 - 2017-05-29

### Added
* New gate type - Hazard gate (black/yellow striped gates)

### Changed
* Doubled wood requirement for Wooden floorboards
* Wooden floorboards can now be used as fuel

## v0.5.9 - 2017-05-26

### Bugfixes
* Fixed compatibility issues with other mods that rely on base Hazard concrete items or recipes

## v0.5.8 - 2017-05-25

### Added
* Landscaping items to place water and green water tiles (requires _Earthworks_ technology)
* Tweaked Landfill recipe to take longer to craft
* Notifications for incompatible mods and when the mod is updated

### Changed
* Stone and concrete wall are now acid resistant
* Balancing - increased max health and physical resistance of concrete wall
* Balancing - adjusted gates to match health and resistances of concrete wall

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
