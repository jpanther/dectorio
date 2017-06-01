for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if settings.startup["dectorio-painted-concrete"].value then
		if tech["dect-concrete-paint"].researched then
			rec["dect-paint-danger"].enabled = true
			rec["dect-paint-caution"].enabled = true
			rec["dect-paint-defect"].enabled = true
			rec["dect-paint-operations"].enabled = true
		end
	end
		
end