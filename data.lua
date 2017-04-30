--data.lua

require("prototypes.item.items")
require("prototypes.recipe.recipes")
require("prototypes.tile.tiles")
require("prototypes.technology.technology")


-- Remove base Hazard concrete (as it's replaced by painted concrete)
data.raw["technology"]["concrete"].effects = {{
        type = "unlock-recipe",
        recipe = "concrete"
      }}
data.raw["tile"]["hazard-concrete-left"] = nil
data.raw["tile"]["hazard-concrete-right"] = nil
data.raw["recipe"]["hazard-concrete"] = nil
data.raw["item"]["hazard-concrete"] = nil