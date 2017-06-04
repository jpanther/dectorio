-- sign-icons.lua

if DECT.ENABLED["signs"] then

    for i, icon in pairs(DECT.CONFIG.SIGN_ICONS) do
        for _, obj in pairs(data.raw[icon]) do
            if obj.icons == nil and obj.icon ~= nil then
                new_icon = {
                    type = "simple-entity",
                    name = "dect-icon-"..obj.name,
                    flags = {"placeable-off-grid", "not-on-map"},
                    selectable_in_game = false,
                    render_layer = "higher-object-above",
                    pictures = {
                        {
                            filename = obj.icon,
                            priority = "medium",
                            width = 32,
                            height = 32,
                            scale = 0.7,
                            shift = {-0.02, -0.22}
                        }
                    }
                }
                data:extend({new_icon})
            end
        end
    end

end