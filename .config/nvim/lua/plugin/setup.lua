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
            options = "",
            command = "clone"
        }
    }

    if settings ~= nil then
        for key, value in pairs(settings) do
            defaults[key] = value
        end
    end

    _G.plugin__settings = defaults
end

return setup
