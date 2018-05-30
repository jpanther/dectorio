for _, surface in pairs(game.surfaces) do
	local signs = surface.find_entities_filtered{name={"dect-sign-wood", "dect-sign-steel"}}
	for _, sign in pairs(signs) do
		if sign.minable == false then
			sign.destroy()
		end
	end
end

global.sign_last_built = {}
global.sign_gui = {}
