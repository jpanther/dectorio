--tiles.lua

-- Return tile variants array for given set and variant
local function tile_variants(set, variant)
	local sprite_count = {
		inner_corner = 32, 
		outer_corner = 16,
		side = 16,
		u_transition = 16,
		o_transition = 1
	}
	if set == "wood" or set == "stone" then
		sprite_count = {
			inner_corner = 8, 
			outer_corner = 1,
			side = 8,
			u_transition = 8,
			o_transition = 1
		}
	end
	return {
		main = {
			{
				picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."1.png",
				count = 16,
				size = 1
			},
			{
				picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."2.png",
				count = 4,
				size = 2,
				probability = 0.39,
			},
			{
				picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."4.png",
				count = 4,
				size = 4,
				probability = 1,
			},
		},
		inner_corner = {
			picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."-inner-corner.png",
			count = sprite_count.inner_corner
		},
		outer_corner = {
			picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."-outer-corner.png",
			count = sprite_count.outer_corner
		},
		side = {
			picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."-side.png",
			count = sprite_count.side
		},
		u_transition = {
			picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."-u.png",
			count = sprite_count.u_transition
		},
		o_transition = {
			picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."-o.png",
			count = sprite_count.o_transition
		}
	}
end

-- Modify decorations on base tiles
data.raw["tile"]["stone-path"].decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"]
data.raw["tile"]["concrete"].decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"]

if DECT.ENABLED["landscaping"] then

	-- Make tiles unblueprintable
	data.raw["tile"]["dirt"].can_be_part_of_blueprint = DECT.CONFIG["landscaping_blueprintable"]
	data.raw["tile"]["sand"].can_be_part_of_blueprint = DECT.CONFIG["landscaping_blueprintable"]
	data.raw["tile"]["sand-dark"].can_be_part_of_blueprint = DECT.CONFIG["landscaping_blueprintable"]
	data.raw["tile"]["grass"].can_be_part_of_blueprint = DECT.CONFIG["landscaping_blueprintable"]
	data.raw["tile"]["grass-dry"].can_be_part_of_blueprint = DECT.CONFIG["landscaping_blueprintable"]
	data.raw["tile"]["red-desert"].can_be_part_of_blueprint = DECT.CONFIG["landscaping_blueprintable"]
	data.raw["tile"]["red-desert-dark"].can_be_part_of_blueprint = DECT.CONFIG["landscaping_blueprintable"]
	data.raw["tile"]["water"].can_be_part_of_blueprint = DECT.CONFIG["landscaping_blueprintable"]
	data.raw["tile"]["water-green"].can_be_part_of_blueprint = DECT.CONFIG["landscaping_blueprintable"]

end

if DECT.ENABLED["wood-floor"] then

	data:extend({
		{
			type = "tile",
			name = "dect-wood-floor",
			needs_correction = false,
			minable = {hardness = 0.2, mining_time = 0.5, result = "dect-wood-floor"},
			mined_sound = { filename = "__Dectorio__/sound/deconstruct-wood.ogg" },
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.2,
			layer = 63,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants = tile_variants("wood", "boards"),
			walking_sound = {
				{ filename = "__Dectorio__/sound/walking/wood-01.ogg", volume = 0.95 },
				{ filename = "__Dectorio__/sound/walking/wood-02.ogg", volume = 0.95 },
				{ filename = "__Dectorio__/sound/walking/wood-03.ogg", volume = 0.95 },
				{ filename = "__Dectorio__/sound/walking/wood-04.ogg", volume = 0.95 }
			},
			map_color={r=139, g=69, b=19},
			ageing=0,
			vehicle_friction_modifier = stone_path_vehicle_speed_modifier
		}
	})

end

if DECT.ENABLED["gravel"] then

	data:extend({
		{
			type = "tile",
			name = "dect-gravel",
			needs_correction = false,
			minable = {hardness = 0.2, mining_time = 0.5, result = "stone"},
			mined_sound = { filename = "__core__/sound/axe-mining-ore-3.ogg" },
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.1,
			layer = 62,
			decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
			variants = tile_variants("stone", "gravel"),
			walking_sound = data.raw["tile"]["dirt"].walking_sound,
			map_color={r=169, g=169, b=169},
			ageing=0,
			vehicle_friction_modifier = dirt_vehicle_speed_modifier
		}
	})

end

if DECT.ENABLED["painted-concrete"] then

	local directions = {
		{this="left", next="right"},
		{this="right", next="left"}
	}
	for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
		for _, direction in pairs(directions) do
			data:extend({
				{
					type = "tile",
					name = "dect-paint-"..variant.."-"..direction.this,
					needs_correction = false,
					next_direction = "dect-paint-"..variant.."-"..direction.next,
					minable = {hardness = 0.2, mining_time = 0.5, result = "dect-paint-"..variant},
					mined_sound = data.raw["tile"]["concrete"].mined_sound,
					collision_mask = {"ground-tile"},
					walking_speed_modifier = 1.4,
					layer = 61,
					decorative_removal_probability = DECT.CONFIG["decorative_removal_probability"],
					variants = tile_variants("concrete", variant.."-"..direction.this),
					walking_sound = data.raw["tile"]["concrete"].walking_sound,
					map_color={r=105, g=105, b=105},
					ageing=0,
					vehicle_friction_modifier = concrete_vehicle_speed_modifier
				}
			})
		end
	end

	if not DECT.CONFIG["vanilla_hazard_concrete"] then
		-- Use the Dectorio look and feel for Hazard concrete
		local base_tile_hazard_left = data.raw["tile"]["hazard-concrete-left"]
		local base_tile_hazard_right = data.raw["tile"]["hazard-concrete-right"]
		
		base_tile_hazard_left.variants = tile_variants("concrete", "hazard-left")
		base_tile_hazard_right.variants = tile_variants("concrete", "hazard-right")
	end

end