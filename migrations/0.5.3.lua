for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if settings.startup["dectorio-landscaping"].value then
		if tech["dect-landscaping"].researched and rec["dect-base-dirt"] then
			rec["dect-base-dirt"].enabled = true
			rec["dect-base-sand"].enabled = true
			rec["dect-base-sand-dark"].enabled = true
			rec["dect-base-grass"].enabled = true
			rec["dect-base-grass-dry"].enabled = true
			rec["dect-base-red-desert"].enabled = true
			rec["dect-base-red-desert-dark"].enabled = true
		end		
	end
	if settings.startup["dectorio-flooring"].value then
		if tech["dect-wood-floor"].researched then
			rec["dect-wood-floor"].enabled = true
		end
	end
	if settings.startup["dectorio-painted-concrete"].value then
		if tech["dect-concrete-paint"].researched then
			rec["hazard-concrete"].enabled = true
			rec["dect-paint-emergency"].enabled = true
			rec["dect-paint-radiation"].enabled = true
			rec["dect-paint-safety"].enabled = true
		end
	end
	if settings.startup["dectorio-walls"].value then
		if tech["stone-walls"].researched then
			rec["stone-wall"].enabled = true
		end
		if tech["dect-advanced-walls"].researched then
			rec["dect-concrete-wall"].enabled = true
		end
	end
	
end