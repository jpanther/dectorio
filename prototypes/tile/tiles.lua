-- tile/tiles

-- Return tile variants array for given set and variant
local function tile_variants(set, variant)
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
			count = 8
		},
		outer_corner = {
			picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."-outer-corner.png",
			count = 1
		},
		side = {
			picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."-side.png",
			count = 8
		},
		u_transition = {
			picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."-u.png",
			count = 8
		},
		o_transition = {
			picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set.."-o.png",
			count = 1
		}
	}
end

-- Return tile variants array for given set and variant
local function tile_variants_material(set, variant)
	return {
		main = data.raw["tile"]["concrete"].variants.main,
		inner_corner_mask = data.raw["tile"]["concrete"].variants.inner_corner_mask,
		outer_corner_mask = data.raw["tile"]["concrete"].variants.outer_corner_mask,
		side_mask = data.raw["tile"]["concrete"].variants.side_mask,
		u_transition_mask = data.raw["tile"]["concrete"].variants.u_transition_mask,
		o_transition_mask = data.raw["tile"]["concrete"].variants.o_transition_mask,
		material_background = {
			picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/"..set..".png",
			count = 8,
			hr_version = {
				picture = "__Dectorio__/graphics/terrain/"..set.."/"..variant.."/hr-"..set..".png",
				count = 8,
				scale = 0.5
			}
		}
	}
end

-- Modify decorations on base tiles
data.raw["tile"]["stone-path"].decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"]
data.raw["tile"]["concrete"].decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"]

if DECT.ENABLED["landscaping"] then

	-- Make tiles unblueprintable
	local base_tiles = DECT.CONFIG.BASE_TILES
	for _, tile in pairs(base_tiles) do
		data.raw["tile"][tile].can_be_part_of_blueprint = DECT.CONFIG.SETTINGS["landscaping_blueprintable"]
	end

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
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
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
			name = "dect-stone-gravel",
			needs_correction = false,
			minable = {hardness = 0.2, mining_time = 0.5, result = "stone"},
			mined_sound = { filename = "__core__/sound/axe-mining-ore-3.ogg" },
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.1,
			layer = 60,
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
			variants = tile_variants("stone", "gravel"),
			walking_sound = data.raw["tile"]["dry-dirt"].walking_sound,
			map_color={r=146, g=146, b=146},
			ageing=0,
			vehicle_friction_modifier = dirt_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-iron-ore-gravel",
			needs_correction = false,
			minable = {hardness = 0.2, mining_time = 0.5, result = "iron-ore"},
			mined_sound = { filename = "__core__/sound/axe-mining-ore-3.ogg" },
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.1,
			layer = 60,
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
			variants = tile_variants("iron", "gravel"),
			walking_sound = data.raw["tile"]["dry-dirt"].walking_sound,
			map_color={r=114, g=137, b=163},
			ageing=0,
			vehicle_friction_modifier = dirt_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-copper-ore-gravel",
			needs_correction = false,
			minable = {hardness = 0.2, mining_time = 0.5, result = "copper-ore"},
			mined_sound = { filename = "__core__/sound/axe-mining-ore-3.ogg" },
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.1,
			layer = 60,
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
			variants = tile_variants("copper", "gravel"),
			walking_sound = data.raw["tile"]["dry-dirt"].walking_sound,
			map_color={r=163, g=118, b=115},
			ageing=0,
			vehicle_friction_modifier = dirt_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-coal-gravel",
			needs_correction = false,
			minable = {hardness = 0.2, mining_time = 0.5, result = "coal"},
			mined_sound = { filename = "__core__/sound/axe-mining-ore-3.ogg" },
			collision_mask = {"ground-tile"},
			walking_speed_modifier = 1.1,
			layer = 60,
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
			variants = tile_variants("coal", "gravel"),
			walking_sound = data.raw["tile"]["dry-dirt"].walking_sound,
			map_color={r=84, g=84, b=84},
			ageing=0,
			vehicle_friction_modifier = dirt_vehicle_speed_modifier
		}
	})

	-- Move stone path up a layer so it sits atop gravel
	data.raw["tile"]["stone-path"].layer = 61
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
					transition_merges_with_tile = "concrete",
					minable = {hardness = 0.2, mining_time = 0.5, result = "dect-paint-"..variant},
					mined_sound = data.raw["tile"]["concrete"].mined_sound,
					collision_mask = {"ground-tile"},
					walking_speed_modifier = 1.4,
					layer = 62,
					decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
					variants = tile_variants_material("concrete", variant.."-"..direction.this),
 					walking_sound = data.raw["tile"]["concrete"].walking_sound,
					map_color={r=105, g=105, b=105},
					ageing=0,
					vehicle_friction_modifier = concrete_vehicle_speed_modifier
				}
			})
		end
	end

	-- Move concrete up a layer so it sits atop stone path
	data.raw["tile"]["concrete"].layer = 62

	-- Adjust base hazard concrete
	local base_tile_hazard_left = data.raw["tile"]["hazard-concrete-left"]
	local base_tile_hazard_right = data.raw["tile"]["hazard-concrete-right"]

	base_tile_hazard_left.layer = 62
	base_tile_hazard_right.layer = 62

	-- Use the Dectorio look and feel for Hazard concrete
	if not DECT.CONFIG.SETTINGS["vanilla_hazard_concrete"] then
		base_tile_hazard_left.variants = tile_variants_material("concrete", "hazard-left")
		base_tile_hazard_right.variants = tile_variants_material("concrete", "hazard-right")
	end

end
