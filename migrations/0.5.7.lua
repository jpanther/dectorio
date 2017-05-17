for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if settings.startup["dectorio-walls"].value then
		if tech["stone-walls"].researched then
			rec["dect-wood-wall"].enabled = true
		end
	end
		
end