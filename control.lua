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

-- Initialise global vars
local function init_global()
    global = global or {}
    global.mod_incompatibility = nil
end

-- Send chat notification to all players or force
local function notification(txt, force)
    if force ~= nil then
        force.print(txt)
    else
        for k, p in pairs (game.players) do
            game.players[k].print(txt)
        end
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
				rec["dect-paint-hazard"].enabled = true
				rec["dect-paint-emergency"].enabled = true
				rec["dect-paint-radiation"].enabled = true
				rec["dect-paint-safety"].enabled = true
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

-- Fire events!
script.on_init(function(data)
    on_init(data)
end)

script.on_configuration_changed(function(data)
    on_configuration_changed(data)
end)