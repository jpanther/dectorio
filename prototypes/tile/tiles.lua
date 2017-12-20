-- tile/tiles

-- Some variables to reference base tiles
local base_dirt = data.raw["tile"]["dry-dirt"]
local base_stone_path = data.raw["tile"]["stone-path"]
local base_concrete = data.raw["tile"]["concrete"]
local base_hazard_left = data.raw["tile"]["hazard-concrete-left"]
local base_hazard_right = data.raw["tile"]["hazard-concrete-right"]

-- Sort out the layers
local tile_layer = {
	gravel = 60,
	stone = 61,
	concrete = 62,
	grid = 63,
	paint = 64,
	-- no layer 65 - need to leave gap to account for concrete transition layer
	wood = 66,
}

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
			layer = tile_layer.wood,
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
			layer = tile_layer.grid,
			decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
			variants = tile_variants_material("concrete", "grid"),
			walking_sound = base_concrete.walking_sound,
			map_color={r=130, g=130, b=130},
			ageing = 0,
			vehicle_friction_modifier = base_concrete.vehicle_friction_modifier
		}
	})

	-- Correct the offset so that concrete border is drawn on top of painted concrete
	base_concrete.transition_overlay_layer_offset = tile_layer.paint - tile_layer.concrete + 1

end

if DECT.ENABLED["gravel"] then

	for _, variant in pairs(DECT.CONFIG.GRAVEL_VARIANTS) do
	data:extend({
			{
				type = "tile",
				name = "dect-"..variant.name.."-gravel",
				needs_correction = false,
				minable = { hardness = 0.2, mining_time = 0.5, result = variant.name },
				mined_sound = { filename = "__core__/sound/axe-mining-ore-3.ogg" },
				collision_mask = { "ground-tile" },
				walking_speed_modifier = 1.1,
				layer = tile_layer.gravel,
				decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
				variants = tile_variants(variant.name, "gravel"),
				walking_sound = base_dirt.walking_sound,
				map_color = variant.color,
				ageing = 0,
				vehicle_friction_modifier = dirt_vehicle_speed_modifier
			}
		})
	end

	-- Move stone path up a layer so it sits atop gravel
	base_stone_path.layer = tile_layer.stone
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
					name = "dect-paint-"..variant.name.."-"..direction.this,
					needs_correction = false,
					next_direction = "dect-paint-"..variant.name.."-"..direction.next,
					transition_merges_with_tile = "concrete",
					minable = { hardness = 0.2, mining_time = 0.5, result = "dect-paint-"..variant.name },
					mined_sound = base_concrete.mined_sound,
					collision_mask = { "ground-tile" },
					walking_speed_modifier = 1.4,
					layer = tile_layer.paint,
					decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"],
					variants = tile_variants_material("concrete", variant.name.."-"..direction.this),
 					walking_sound = base_concrete.walking_sound,
					map_color = variant.color,
					ageing = 0,
					vehicle_friction_modifier = base_concrete.vehicle_friction_modifier
				}
			})
		end
	end

	-- Move all the base concretes up a layer so it sits atop stone path
	base_concrete.layer = tile_layer.concrete
	base_hazard_left.layer = tile_layer.paint
	base_hazard_right.layer = tile_layer.paint

	-- Use the Dectorio look and feel for Hazard concrete
	if not DECT.CONFIG.SETTINGS["vanilla_hazard_concrete"] then
		base_hazard_left.variants = tile_variants_material("concrete", "hazard-left")
		base_hazard_right.variants = tile_variants_material("concrete", "hazard-right")
	end

end
