DECT = require("config")

local function unlockTechAndRecipes() 
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

script.on_init(unlockTechAndRecipes)
script.on_configuration_changed(unlockTechAndRecipes)