local meld = require("meld")
-- tile/tiles

-- Some variables to reference base tiles
local base_dirt = data.raw["tile"]["dry-dirt"]
local base_stone_path = data.raw["tile"]["stone-path"]
local base_concrete = data.raw["tile"]["concrete"]
local base_hazard_left = data.raw["tile"]["hazard-concrete-left"]
local base_hazard_right = data.raw["tile"]["hazard-concrete-right"]
local base_refined_concrete = data.raw["tile"]["refined-concrete"]
local base_refined_hazard_left = data.raw["tile"]["refined-hazard-concrete-left"]
local base_refined_hazard_right = data.raw["tile"]["refined-hazard-concrete-right"]

local set_modifier = DECT.CONFIG.SETTINGS["painted_concrete_speed_modifier"]

-- Sort out the layers
local tile_layer = {
	gravel = 60,
	stone = 61,
	concrete = 62,
	paint = 63,
	-- 64 transition layer
	refined = 65,
	refined_paint = 66,
	-- 67 transition layer
	grid = 68,
	wood = 69
}

-- Return tile variants array for given set and variant
local function tile_variants(set, variant)
	return {
		main = {
			{
				picture = "__Dectorio__/graphics/terrain/" .. set .. "/" .. variant .. "/" .. set .. "1.png",
				count = 16,
				size = 1
			},
			{
				picture = "__Dectorio__/graphics/terrain/" .. set .. "/" .. variant .. "/" .. set .. "2.png",
				count = 4,
				size = 2,
				probability = 0.39
			},
			{
				picture = "__Dectorio__/graphics/terrain/" .. set .. "/" .. variant .. "/" .. set .. "4.png",
				count = 4,
				size = 4,
				probability = 1
			}
		},
		transition =
		{
			overlay_layout =
			{
				inner_corner = {
					spritesheet = "__Dectorio__/graphics/terrain/" .. set .. "/" .. variant .. "/" .. set .. "-inner-corner.png",
					count = 8
				},
				outer_corner = {
					spritesheet = "__Dectorio__/graphics/terrain/" .. set .. "/" .. variant .. "/" .. set .. "-outer-corner.png",
					count = 1
				},
				side = {
					spritesheet = "__Dectorio__/graphics/terrain/" .. set .. "/" .. variant .. "/" .. set .. "-side.png",
					count = 8
				},
				u_transition = {
					spritesheet = "__Dectorio__/graphics/terrain/" .. set .. "/" .. variant .. "/" .. set .. "-u.png",
					count = 8
				},
				o_transition = {
					spritesheet = "__Dectorio__/graphics/terrain/" .. set .. "/" .. variant .. "/" .. set .. "-o.png",
					count = 1
				}
			}
		}
	}
end

-- Return tile variants array for given set and variant
local function tile_variants_material(set, variant)
	return {
		main = base_concrete.variants.main,
		transition = {
			overlay_layout =
			{
				inner_corner = base_concrete.variants.transition.overlay_layout.inner_corner,
				outer_corner = base_concrete.variants.transition.overlay_layout.outer_corner,
				side = base_concrete.variants.transition.overlay_layout.side,
				u_transition = base_concrete.variants.transition.overlay_layout.u_transition,
				o_transition = base_concrete.variants.transition.overlay_layout.o_transition,
			}
		},
		material_background = {
			picture = "__Dectorio__/graphics/terrain/" .. set .. "/" .. variant .. "/" .. set .. ".png",
			count = 8,
			hr_version = {
				picture = "__Dectorio__/graphics/terrain/" .. set .. "/" .. variant .. "/hr-" .. set .. ".png",
				count = 8,
				scale = 0.5
			}
		}
	}
end

-- Modify decorations on base tiles
local decorative_removal_probability = DECT.CONFIG.SETTINGS["decorative_removal_probability"]
base_stone_path.decorative_removal_probability = decorative_removal_probability
base_concrete.decorative_removal_probability = decorative_removal_probability
base_hazard_left.decorative_removal_probability = decorative_removal_probability
base_hazard_right.decorative_removal_probability = decorative_removal_probability
base_refined_concrete.decorative_removal_probability = decorative_removal_probability
base_refined_hazard_left.decorative_removal_probability = decorative_removal_probability
base_refined_hazard_right.decorative_removal_probability = decorative_removal_probability

if DECT.ENABLED["landscaping"] then
	-- Make tiles unblueprintable
	local base_tiles = DECT.CONFIG.BASE_TILES
	for _, tile in pairs(base_tiles) do
		data.raw["tile"][tile].can_be_part_of_blueprint = DECT.CONFIG.SETTINGS["landscaping_blueprintable"]
	end
end

if DECT.ENABLED["wood-floor"] then
	data:extend(
		{
			{
				type = "tile",
				name = "dect-wood-floor",
				needs_correction = false,
				minable = {mining_time = 0.1, result = "dect-wood-floor"},
				mined_sound = {filename = "__Dectorio__/sound/deconstruct-wood.ogg"},
				collision_mask = {layers = {ground_tile = true}},
				walking_speed_modifier = 1.2,
				layer = tile_layer.wood,
				decorative_removal_probability = decorative_removal_probability,
				variants = tile_variants("wood", "boards"),
				walking_sound = {
					{filename = "__Dectorio__/sound/walking/wood-01.ogg", volume = 0.95},
					{filename = "__Dectorio__/sound/walking/wood-02.ogg", volume = 0.95},
					{filename = "__Dectorio__/sound/walking/wood-03.ogg", volume = 0.95},
					{filename = "__Dectorio__/sound/walking/wood-04.ogg", volume = 0.95}
				},
				map_color = {r = 139, g = 69, b = 19},
				vehicle_friction_modifier = base_stone_path.vehicle_friction_modifier
			}
		}
	)
end

if DECT.ENABLED["concrete"] then
	local grid_concrete = table.deepcopy(base_hazard_left)
	meld(grid_concrete, {
		name = "dect-concrete-grid",
		order = "a[artificial]-b[tier-2]-b[concrete-grid]",
		next_direction = meld.delete(),
		minable = { mining_time = 0.1, result = "dect-concrete-grid" },
		layer = tile_layer.grid,
		decorative_removal_probability = decorative_removal_probability,
		walking_speed_modifier = base_concrete.walking_speed_modifier * set_modifier,
		vehicle_friction_modifier = base_concrete.vehicle_friction_modifier * set_modifier,
		placeable_by = { item = "dect-concrete-grid", count = 1 },
		variants = { material_background = { picture = "__Dectorio__/graphics/terrain/concrete/grid/hr-concrete.png" } },
		map_color = { r = 130, g = 130, b = 130 },
	})
	data:extend { grid_concrete }

	-- Correct the offset so that concrete border is drawn on top of painted concrete
	--base_concrete.transition_overlay_layer_offset = tile_layer.paint - tile_layer.concrete + 1
	--base_refined_concrete.transition_overlay_layer_offset = tile_layer.refined_paint - tile_layer.refined + 1
end

if DECT.ENABLED["gravel"] then
	for _, variant in pairs(DECT.CONFIG.GRAVEL_VARIANTS) do
		data:extend(
			{
				{
					type = "tile",
					name = "dect-" .. variant.name .. "-gravel",
					needs_correction = false,
					minable = {mining_time = 0.1, result = variant.name},
					mined_sound = {filename = "__core__/sound/axe-mining-ore-3.ogg"},
					collision_mask = {layers = {ground_tile = true}},
					walking_speed_modifier = 1.1,
					layer = tile_layer.gravel,
					decorative_removal_probability = decorative_removal_probability,
					variants = tile_variants(variant.name, "gravel"),
					walking_sound = base_dirt.walking_sound,
					map_color = variant.color,
					vehicle_friction_modifier = dirt_vehicle_speed_modifier
				}
			}
		)
	end

	-- Move stone path up a layer so it sits atop gravel
	base_stone_path.layer = tile_layer.stone
end

if DECT.ENABLED["painted-concrete"] then
	-- Adjust walking speeds on base hazard tiles
	for _, tile in pairs({ base_hazard_left, base_hazard_right, base_refined_hazard_left, base_refined_hazard_right }) do
		meld(tile, {
			decorative_removal_probability = decorative_removal_probability,
			walking_speed_modifier = tile.walking_speed_modifier * set_modifier,
			vehicle_friction_modifier = tile.vehicle_friction_modifier * set_modifier,
		})
	end

	-- Move all the base concretes up a layer so it sits atop stone path
	base_concrete.layer = tile_layer.concrete
	base_hazard_left.layer = tile_layer.paint
	base_hazard_right.layer = tile_layer.paint
	base_refined_concrete.layer = tile_layer.refined
	base_refined_hazard_left.layer = tile_layer.refined_paint
	base_refined_hazard_right.layer = tile_layer.refined_paint


	local directions = {
		{ this = "left",  next = "right" },
		{ this = "right", next = "left" }
	}
	for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
		for _, direction in pairs(directions) do
			-- Normal variant
			local colored_concrete = table.deepcopy(base_hazard_left)
			local modifier = variant.name .. "-" .. direction.this
			meld(colored_concrete, {
				name = "dect-paint-" .. modifier,
				order = "a[artificial]-b[tier-2]-b[" .. modifier .. "]",
				next_direction = "dect-paint-" .. variant.name .. "-" .. direction.next,
				minable = { mining_time = 0.1, result = "dect-paint-" .. variant.name },
				placeable_by = { item = "dect-paint-" .. variant.name, count = 1 },
				variants = {material_background = {picture = "__Dectorio__/graphics/terrain/concrete/" .. modifier .. "/hr-concrete.png"}},
				map_color = variant.color,
			})
			-- Refined variant
			local colored_refined_concrete = table.deepcopy(base_refined_hazard_left)
			meld(colored_refined_concrete, {
				name = "dect-paint-refined-" .. modifier,
				order = "a[artificial]-b[tier-2]-b[refined-" .. modifier .. "]",
				next_direction = "dect-paint-refined-" .. variant.name .. "-" .. direction.next,
				minable = { mining_time = 0.1, result = "dect-paint-refined-" .. variant.name },
				walking_speed_modifier = base_concrete.walking_speed_modifier * set_modifier,
				decorative_removal_probability = decorative_removal_probability,
				placeable_by = { item = "dect-paint-refined-" .. variant.name, count = 1 },
				variants = {material_background = {picture = "__Dectorio__/graphics/terrain/refined-concrete/" .. modifier .. "/hr-refined-concrete.png"}},
				map_color = variant.color,
				vehicle_friction_modifier = base_concrete.vehicle_friction_modifier * set_modifier
			})
			data:extend { colored_concrete, colored_refined_concrete }
		end
	end

	-- Make base colored refined concrete minable and adjust some properties to align them with others
	for _, color in pairs(DECT.CONFIG.BASE_COLORS) do
		local name = color.name .. "-refined-concrete"
		meld(data.raw.tile[name], {
			hidden = meld.delete(),
			layer = base_refined_hazard_left.layer,
			decorative_removal_probability = base_refined_hazard_left.decorative_removal_probability,
			minable = { mining_time = 0.1, result = "dect-" .. color.name .. "-refined-concrete" },
			placeable_by = { item = "dect-" .. color.name .. "-refined-concrete", count = 1 },
			transition_overlay_layer_offset = meld.delete(),
			transition_overlay_offset = meld.delete(),
			transition_merges_with_tile = "refined-concrete",
			transitions = meld.delete(),
			transitions_between_transitions = meld.delete(),
			variants = { transition = meld.overwrite(base_refined_hazard_left.variants.transition) }
		})
		if color.name == "red" then log(serpent.line(data.raw.tile[name])) end
	end
	-- Use the Dectorio look and feel for Hazard concrete
	if not DECT.CONFIG.SETTINGS["vanilla_hazard_concrete"] then
		meld(base_hazard_left, { variants = { material_background = { picture = "__Dectorio__/graphics/terrain/concrete/hazard-left/hr-concrete.png" } } })
		meld(base_hazard_right, { variants = { material_background = { picture = "__Dectorio__/graphics/terrain/concrete/hazard-right/hr-concrete.png" } } })
		meld(base_refined_hazard_left, { variants = { material_background = { picture = "__Dectorio__/graphics/terrain/refined-concrete/hazard-left/hr-refined-concrete.png" } } })
		meld(base_refined_hazard_right, { variants = { material_background = { picture = "__Dectorio__/graphics/terrain/refined-concrete/hazard-right/hr-refined-concrete.png" } } })
	end
end
