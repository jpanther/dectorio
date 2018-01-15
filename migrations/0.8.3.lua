for index, force in pairs(game.forces) do

	force.reset_recipes()
	force.reset_technologies()

	local tech = force.technologies
	local rec = force.recipes

	if settings.startup["dectorio-landscaping"].value then
		if tech["dect-landscaping"].researched then
			rec["dect-base-tree-01"].enabled = true
			rec["dect-base-tree-02"].enabled = true
			rec["dect-base-tree-03"].enabled = true
			rec["dect-base-tree-04"].enabled = true
			rec["dect-base-tree-05"].enabled = true
			rec["dect-base-tree-06"].enabled = true
			rec["dect-base-tree-07"].enabled = true
			rec["dect-base-tree-08"].enabled = true
			rec["dect-base-tree-09"].enabled = true
			rec["dect-base-dead-dry-hairy-tree"].enabled = true
			rec["dect-base-dead-grey-trunk"].enabled = true
			rec["dect-base-dead-tree-desert"].enabled = true
			rec["dect-base-dry-hairy-tree"].enabled = true
			rec["dect-base-dry-tree"].enabled = true
		end
	end
end
