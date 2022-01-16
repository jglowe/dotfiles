--------------------------------------------------------------------------------
--
--                     _                 _   _
--                    | |               | | | |
--                    | | ___   __ _  __| | | |_   _  __ _
--                    | |/ _ \ / _` |/ _` | | | | | |/ _` |
--                    | | (_) | (_| | (_| |_| | |_| | (_| |
--                    |_|\___/ \__,_|\__,_(_)_|\__,_|\__,_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- The function to load plugins
--------------------------------------------------------------------------------

local load_plugin = function(plugin)
    if vim.v.vim_did_enter == 1 then
        -- Modifies 'runtimepath' _and_ sources files.
        vim.cmd('packadd ' .. plugin)
    else
        -- Just modifies 'runtimepath'; Vim will source the files later as part
        -- of |load-plugins| process.
        vim.cmd('packadd! ' .. plugin)
    end
end

local load = function(plugin)
    -- keep track of the plugins that are loaded and prevent them from being
    -- loaded twice
    if _G.plugin__loaded_plugins == nil then
        _G.plugin__loaded_plugins = {plugin = true}
        load_plugin(plugin)
    else
        if _G.plugin__loaded_plugins[plugin] == nil or
            _G.plugin__loaded_plugins[plugin] == false then

            _G.plugin__loaded_plugins[plugin] = true
            load_plugin(plugin)
        end
    end

end

return load
