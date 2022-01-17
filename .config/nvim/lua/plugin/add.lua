--------------------------------------------------------------------------------
--
--                                _     _   _
--                               | |   | | | |
--                       __ _  __| | __| | | |_   _  __ _
--                      / _` |/ _` |/ _` | | | | | |/ _` |
--                     | (_| | (_| | (_| |_| | |_| | (_| |
--                      \__,_|\__,_|\__,_(_)_|\__,_|\__,_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- Adds a plugin via git
--------------------------------------------------------------------------------

local add = function(plugin)
    local settings = require("plugin.get_settings")()
    local slash_index = string.find(plugin, "/")
    local plugin_name = string.sub(plugin, slash_index + 1, string.len(plugin))
    local plugin_destination = vim.fn.stdpath("config") .. "/pack/all/opt/" ..
                                   plugin_name

    if vim.fn.isdirectory(plugin_destination) == 0 then
        local git_executable = settings.git.executable
        local git_options = settings.git.options
        local git_command = settings.git.command
        local plugin_url = "https://github.com/" .. plugin .. ".git"
        local output = vim.fn.system(
                           git_executable .. " " .. git_options .. " " ..
                               git_command .. " " .. plugin_url .. " " ..
                               plugin_destination)
        print(output)
    else
        print("Plugin is already there")
    end

end

return add
