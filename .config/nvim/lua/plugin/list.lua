--------------------------------------------------------------------------------
--
--                         _ _     _     _
--                        | (_)   | |   | |
--                        | |_ ___| |_  | |_   _  __ _
--                        | | / __| __| | | | | |/ _` |
--                        | | \__ \ |_ _| | |_| | (_| |
--                        |_|_|___/\__(_)_|\__,_|\__,_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- List the plugins that are loaded in a popup gui
--------------------------------------------------------------------------------

local load_plugin = require("plugin.load")

load_plugin("plenary.nvim")

local list = function()
    local plugin_list = {}
    for plugin, loaded in pairs(_G.plugin__loaded_plugins) do
        if loaded then
            table.insert(plugin_list, plugin)
        end
    end
    table.sort(plugin_list)

    table.insert(plugin_list, 1, "Installed Plugins")
    table.insert(plugin_list, 2, "")

    local popup = require("plenary.popup")
    local win_id = popup.create(plugin_list,
                                {border = true, padding = {0, 3, 0, 3}})

    print(win_id)
end

return list

