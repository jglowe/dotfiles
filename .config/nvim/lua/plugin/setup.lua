--------------------------------------------------------------------------------
--
--                            _                _
--                           | |              | |
--                   ___  ___| |_ _   _ _ __  | |_   _  __ _
--                  / __|/ _ \ __| | | | '_ \ | | | | |/ _` |
--                  \__ \  __/ |_| |_| | |_) || | |_| | (_| |
--                  |___/\___|\__|\__,_| .__(_)_|\__,_|\__,_|
--                                     | |
--                                     |_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- Setup the plugin library
--------------------------------------------------------------------------------
local setup = function(settings)
    local defaults = {
        git = {
            executable = "git",
            add = {
                options = "--git-dir=$HOME/.dotfiles/ --work-tree=$HOME",
                repo_path = vim.env.HOME,
                packages_path = ".config/nvim/pack/all/opt"
            },
            update = {command = "pull", options = ""}
        }
    }

    if settings ~= nil then
        for key, value in pairs(settings) do defaults[key] = value end
    end

    _G.plugin__settings = defaults

    vim.cmd("command! -nargs=1 PluginAdd    lua require('plugin').add(<f-args>)")
    vim.cmd(
        "command! -nargs=? PluginUpdate lua require('plugin').update(<f-args>)")
    vim.cmd("command!          PluginList   lua require('plugin').list()")
end

return setup
