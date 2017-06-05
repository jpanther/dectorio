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

--control.lua

DECT = require("config")

-- Send chat notification to all players or force
local function notification(txt, force)
    if force ~= nil then
        force.print(txt)
    else
        for k, p in pairs(game.players) do
            game.players[k].print(txt)
        end
    end
end

-- Initialise global vars
local function init_global()
    global = global or {}
    global.mod_incompatibility = nil
    global.icons = nil
    global.signs = global.signs or {}
    global.sign_last_built = global.sign_last_built or {}

    if global.icons == nil then
    	local prototypes = {
    		["item"] = game.item_prototypes,
    		["fluid"] = game.fluid_prototypes
    	}
    	local icons = {}
    	for protokey, prototype in pairs(prototypes) do
			for _, obj in pairs(prototype) do
				for _, category in pairs(DECT.CONFIG.SIGN_CATEGORIES) do
					local new_icon = {name=obj.name, type=protokey}
					if protokey == "fluid" and category == "fluid" then
						table.insert(icons, new_icon)
					elseif protokey == "item" and obj.type == category then
						local match = false
						for _, icon_be_gone in pairs(DECT.CONFIG.SIGN_BLACKLIST) do
							if string.find(obj.name, tostring(icon_be_gone)) then
								match = true
							end
						end
						if not match then
							table.insert(icons, new_icon)
						end
					end
				end
			end
		end
	    global.icons = icons
    end
end

-- Check if any technologies or recipes need to be enabled
local function unlock_tech_and_recipes() 
	for _,force in pairs(game.forces) do

		local tech = force.technologies
		local rec = force.recipes

		if DECT.ENABLED["landscaping"] then
			if rec["dect-base-dirt"].enabled then
				tech["dect-landscaping"].researched = true
			end
			if tech["dect-landscaping"].researched then
				rec["dect-base-dirt"].enabled = true
				rec["dect-base-sand"].enabled = true
				rec["dect-base-sand-dark"].enabled = true
				rec["dect-base-grass"].enabled = true
				rec["dect-base-grass-dry"].enabled = true
				rec["dect-base-red-desert"].enabled = true
				rec["dect-base-red-desert-dark"].enabled = true
			end		
			if tech["landfill"].researched then
				rec["dect-base-water"].enabled = true
				rec["dect-base-water-green"].enabled = true
			end	
		end
		if DECT.ENABLED["wood-floor"] then
			if rec["dect-wood-floor"].enabled then
				tech["dect-wood-floor"].researched = true
			end
			if tech["dect-wood-floor"].researched then
				rec["dect-wood-floor"].enabled = true
			end
		end
		if DECT.ENABLED["painted-concrete"] then
			if rec["dect-paint-hazard"].enabled then
				tech["dect-concrete-paint"].researched = true
			end
			if tech["dect-concrete-paint"].researched then
				for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
					rec["dect-paint-"..variant].enabled = true
				end
			end
			if DECT.CONFIG["disable_hazard_concrete"] then
				rec["hazard-concrete"].enabled = false
			elseif tech["concrete"].researched then
				rec["hazard-concrete"].enabled = true
			end
		end
		if DECT.ENABLED["walls"] then
			if rec["stone-wall"].enabled then
				tech["stone-walls"].researched = true
			end	
			if rec["dect-concrete-wall"].enabled then
				tech["dect-advanced-walls"].researched = true
			end
			if tech["stone-walls"].researched then
				rec["dect-wood-wall"].enabled = true
				rec["stone-wall"].enabled = true
			end
			if tech["dect-advanced-walls"].researched then
				rec["dect-chain-wall"].enabled = true
				rec["dect-concrete-wall"].enabled = true
				rec["dect-concrete-wall-from-stone-wall"].enabled = true
			end
			if tech["gates"].researched then
				rec["dect-hazard-gate"].enabled = true
			end
		end
		if DECT.ENABLED["signs"] then
			if rec["dect-sign-wood"].enabled then
				tech["dect-signs"].researched = true
			end
			if tech["dect-signs"].researched then
				rec["dect-sign-wood"].enabled = true
			end
		end
	end
end

-- Check game for known incompatibile mods
local function check_incompatible_mods()
    for mod, version in pairs(game.active_mods) do
        if DECT.INCOMPATIBLE.MODS[mod] then 
            return true
        end
    end
    return false
end

-- Notify player of incompatible mods
local function incompability_detected()
    for mod, version in pairs(game.active_mods) do
        if DECT.INCOMPATIBLE.MODS[mod] then 
            notification({"dect-notify-incompatible", {"dect-notify-dectorio"}})
            notification({DECT.INCOMPATIBLE.MODS[mod], {"dect-notify-dectorio"}, mod})
            notification({"dect-notify-modportal", {"dect-notify-dectorio"}})      
        end
    end
end

local function on_init(data)
	init_global()

	if global.mod_incompatibility == true then
        incompability_detected()
    end

	unlock_tech_and_recipes()
end

local function on_configuration_changed(data)
	init_global()

	-- Notify version and updates
    if data.mod_changes ~= nil and data.mod_changes["Dectorio"] ~= nil and data.mod_changes["Dectorio"].old_version == nil then
        notification({"dect-notify-version", {"dect-notify-dectorio"}, data.mod_changes["Dectorio"].new_version})
    elseif data.mod_changes ~= nil and data.mod_changes["Dectorio"] ~= nil and data.mod_changes["Dectorio"].old_version ~= nil then
    	unlock_tech_and_recipes()
        local oldver = data.mod_changes["Dectorio"].old_version
        local newver = data.mod_changes["Dectorio"].new_version
        notification({"dect-notify-newversion", {"dect-notify-dectorio"}, oldver, newver})
    end
    
    -- Check for incompatible mods and notify
    if data.mod_changes ~= nil then
        global.mod_incompatibility = check_incompatible_mods()
        if global.mod_incompatibility == true then
            incompability_detected()
        end
    end
end

local function showGui_sign(player)
	if player.gui.center["dect-gui-sign"] then
		player.gui.center["dect-gui-sign"].destroy()
	end
	local gui_frame = player.gui.center.add({type="frame", name="dect-gui-sign", caption={"dect-gui-sign-title"}, direction="horizontal"})
	local gui_table = gui_frame.add({type="table", name="dect-icons-table", colspan = math.ceil(#global.icons / 14), style="dect-icon-table"})
	for _, icon in pairs(global.icons) do
		gui_table.add({type="sprite-button", name="dect-icon-"..icon.name, sprite=icon.type.."/"..icon.name, style="dect-icon-button", tooltip={"",icon.name}})
	end
end

local function create_sign(icon, position, parent)
	local offset = {x=0, y=0.75}
	local icon_entity = game.surfaces[1].create_entity({name=icon, position={position.x-offset.x, position.y-offset.y}})
	table.insert(global.signs, {sign=parent, objects={icon_entity}})
end

-- Fire events!
script.on_init(function(data)
    on_init(data)
end)

script.on_configuration_changed(function(data)
    on_configuration_changed(data)
end)

script.on_event(defines.events.on_built_entity, function(event)
	local player = game.players[event.player_index]
	if event.created_entity.name == "dect-sign-wood" then
		global.sign_last_built[event.player_index] = event.created_entity
		showGui_sign(player)
	end
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
	if event.entity.name == "dect-sign-wood" then
		for i=1, #global.signs do
			if event.entity == global.signs[i].sign then
				for j=1, #global.signs[i].objects do
					global.signs[i].objects[j].destroy();
				end
				table.remove(global.signs, i)
				break
			end
		end
		if gui ~= nil then
			gui.destroy()
			gui = nil
		end
	end
end)

script.on_event(defines.events.on_gui_click, function(event)
	if event.element.parent then
		if event.element.parent.name == "dect-icons-table" then
			for _, icon in pairs(global.icons) do
				if event.element.name == "dect-icon-"..icon.name then
					create_sign("dect-icon-"..icon.name, global.sign_last_built[event.player_index].position, global.sign_last_built[event.player_index])
					event.element.parent.parent.destroy()
					gui = nil
					break
				end
			end
		end
	end
end)