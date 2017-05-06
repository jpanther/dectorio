--data.lua

require("prototypes.entity.entities")
require("prototypes.item.items")
require("prototypes.recipe.recipes")
require("prototypes.tile.tiles")
require("prototypes.technology.technology")


--------------------------
-- Changes to base game --
--------------------------

-- Modify base concrete recipe to replace iron ore with iron sticks
data.raw["recipe"]["concrete"].ingredients = {
			{"stone-brick", 5},
			{"iron-stick", 2},
			{type="fluid", name="water", amount=100}
		}

-- Remove base Hazard concrete (as it's replaced by painted concrete)
data.raw["technology"]["concrete"].effects = {{
        type = "unlock-recipe",
        recipe = "concrete"
      }}
data.raw["tile"]["hazard-concrete-left"] = nil
data.raw["tile"]["hazard-concrete-right"] = nil
data.raw["recipe"]["hazard-concrete"] = nil
data.raw["item"]["hazard-concrete"] = nil

-- Move base landfill tech underneath landscaping
data.raw["technology"]["landfill"].prerequisites = {"landscaping"}

-- Remove base Stone wall (as it's replaced by Stone brick wall)
data.raw["technology"]["stone-walls"].effects = {{
        type = "unlock-recipe",
        recipe = "stone-brick-wall"
    }}
data.raw["technology"]["stone-walls"].icon = "__Dectorio__/graphics/technology/stone-brick-walls.png"
data.raw["technology"]["stone-walls"].icon_size = 128
data.raw["technology"]["gates"].prerequisites = {"concrete-walls", "military-2"}
data.raw["recipe"]["gate"].ingredients = {{"concrete-wall", 1}, {"steel-plate", 2}, {"electronic-circuit", 2}}
data.raw["recipe"]["stone-wall"] = nil
data.raw["wall"]["stone-wall"] = nil
data.raw["item"]["stone-wall"] = nil