--------------------------
-- COPYRIGHT & LICENSE  --
--------------------------

-- Dectorio, a Factorio mod
-- Copyright (c) 2017 James "PantherX" Panther

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- A copy of the GNU General Public License is packaged along with
-- this program.  You can also see <http://www.gnu.org/licenses/>.

--------------------------

--data.lua

require("prototypes.entity.entities")
require("prototypes.item.items")
require("prototypes.recipe.recipes")
require("prototypes.tile.tiles")
require("prototypes.technology.technology")
require("prototypes.signal.signal")


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

-- Change stone wall tech
data.raw["technology"]["stone-walls"].icon = "__Dectorio__/graphics/technology/stone-brick-walls.png"
data.raw["technology"]["stone-walls"].icon_size = 128
data.raw["item"]["stone-wall"].icon = "__Dectorio__/graphics/icons/stone-brick-wall.png"

-- Change gates to use concrete-wall
data.raw["technology"]["gates"].prerequisites = {"concrete-walls", "military-2"}
data.raw["recipe"]["gate"].ingredients = {{"concrete-wall", 1}, {"steel-plate", 2}, {"electronic-circuit", 2}}