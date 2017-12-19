-- tile/tiles

-- Some variables to reference base tiles
local base_dirt = data.raw["tile"]["dry-dirt"]
local base_stone_path = data.raw["tile"]["stone-path"]
local base_concrete = data.raw["tile"]["concrete"]
local base_hazard_left = data.raw["tile"]["hazard-concrete-left"]
local base_hazard_right = data.raw["tile"]["hazard-concrete-right"]

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
		main = base_concrete.variants.main,
		inner_corner_mask = base_concrete.variants.inner_corner_mask,
		outer_corner_mask = base_concrete.variants.outer_corner_mask,
		side_mask = base_concrete.variants.side_mask,
		u_transition_mask = base_concrete.variants.u_transition_mask,
		o_transition_mask = base_concrete.variants.o_transition_mask,
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
base_stone_path.decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"]
base_concrete.decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"]

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
			collision_mask = { "ground-tile" },
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
			vehicle_friction_modifier = base_stone_path.vehicle_friction_modifier
		}
	})

end

if DECT.ENABLED["concrete"] then

	data:extend({
		{
			type = "tile",
			name = "dect-concrete-grid",
			needs_correction = false,
			transition_merges_with_tile = "concrete",
			minable = { hardness = 0.2, mining_time = 0.5, result = "dect-concrete-grid" },
			mined_sound = base_concrete.mined_sound,
			collision_mask = { "ground-tile" },
			walking_speed_modifier = 1.4,
			layer = 62,
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
			variants = {
				main = {
					{
						picture = "__Dectorio__/graphics/terrain/concrete/grid/concrete-grid.png",
						count = 16,
						size = 1,
						hr_version = {
							picture = "__Dectorio__/graphics/terrain/concrete/grid/hr-concrete-grid.png",
							count = 16,
							size = 1
						}
					},
					{
						picture = "__Dectorio__/graphics/terrain/concrete/grid/concrete-grid.png",
						count = 4,
						size = 4,
						hr_version = {
							picture = "__Dectorio__/graphics/terrain/concrete/grid/hr-concrete-grid.png",
							count = 4,
							size = 4
						},
						probability = 1,
					},
				},
				inner_corner_mask = base_concrete.variants.inner_corner_mask,
				outer_corner_mask = base_concrete.variants.outer_corner_mask,
				side_mask = base_concrete.variants.side_mask,
				u_transition_mask = base_concrete.variants.u_transition_mask,
				o_transition_mask = base_concrete.variants.o_transition_mask,
			},
			walking_sound = base_concrete.walking_sound,
			map_color = base_concrete.map_color,
			ageing = 0,
			vehicle_friction_modifier = base_concrete.vehicle_friction_modifier
		}
	})

end

if DECT.ENABLED["gravel"] then

	data:extend({
		{
			type = "tile",
			name = "dect-stone-gravel",
			needs_correction = false,
			minable = { hardness = 0.2, mining_time = 0.5, result = "stone" },
			mined_sound = { filename = "__core__/sound/axe-mining-ore-3.ogg" },
			collision_mask = { "ground-tile" },
			walking_speed_modifier = 1.1,
			layer = 60,
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
			variants = tile_variants("stone", "gravel"),
			walking_sound = base_dirt.walking_sound,
			map_color={r=146, g=146, b=146},
			ageing=0,
			vehicle_friction_modifier = dirt_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-iron-ore-gravel",
			needs_correction = false,
			minable = { hardness = 0.2, mining_time = 0.5, result = "iron-ore" },
			mined_sound = { filename = "__core__/sound/axe-mining-ore-3.ogg" },
			collision_mask = { "ground-tile" },
			walking_speed_modifier = 1.1,
			layer = 60,
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
			variants = tile_variants("iron", "gravel"),
			walking_sound = base_dirt.walking_sound,
			map_color={r=114, g=137, b=163},
			ageing=0,
			vehicle_friction_modifier = dirt_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-copper-ore-gravel",
			needs_correction = false,
			minable = { hardness = 0.2, mining_time = 0.5, result = "copper-ore" },
			mined_sound = { filename = "__core__/sound/axe-mining-ore-3.ogg" },
			collision_mask = { "ground-tile" },
			walking_speed_modifier = 1.1,
			layer = 60,
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
			variants = tile_variants("copper", "gravel"),
			walking_sound = base_dirt.walking_sound,
			map_color={r=163, g=118, b=115},
			ageing=0,
			vehicle_friction_modifier = dirt_vehicle_speed_modifier
		},
		{
			type = "tile",
			name = "dect-coal-gravel",
			needs_correction = false,
			minable = { hardness = 0.2, mining_time = 0.5, result = "coal" },
			mined_sound = { filename = "__core__/sound/axe-mining-ore-3.ogg" },
			collision_mask = { "ground-tile" },
			walking_speed_modifier = 1.1,
			layer = 60,
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
			variants = tile_variants("coal", "gravel"),
			walking_sound = base_dirt.walking_sound,
			map_color={r=84, g=84, b=84},
			ageing=0,
			vehicle_friction_modifier = dirt_vehicle_speed_modifier
		}
	})

	-- Move stone path up a layer so it sits atop gravel
	base_stone_path.layer = 61
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
					minable = { hardness = 0.2, mining_time = 0.5, result = "dect-paint-"..variant },
					mined_sound = base_concrete.mined_sound,
					collision_mask = { "ground-tile" },
					walking_speed_modifier = 1.4,
					layer = 63,
					decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
					variants = tile_variants_material("concrete", variant.."-"..direction.this),
 					walking_sound = base_concrete.walking_sound,
					map_color={r=105, g=105, b=105},
					ageing=0,
					vehicle_friction_modifier = base_concrete.vehicle_friction_modifier
				}
			})
		end
	end

	-- Move all the base concretes up a layer so it sits atop stone path
	base_concrete.layer = 62
	base_hazard_left.layer = 63
	base_hazard_right.layer = 63

	-- Use the Dectorio look and feel for Hazard concrete
	if not DECT.CONFIG.SETTINGS["vanilla_hazard_concrete"] then
		base_hazard_left.variants = tile_variants_material("concrete", "hazard-left")
		base_hazard_right.variants = tile_variants_material("concrete", "hazard-right")
	end

end
