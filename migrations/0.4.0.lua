for k,force in pairs(game.forces) do
 	force.recipes["stone-brick-wall"].enabled = force.technologies["stone-walls"].researched
end