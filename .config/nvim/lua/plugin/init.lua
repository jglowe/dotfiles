--------------------------------------------------------------------------------
--
--                        _       _ _     _
--                       (_)     (_) |   | |
--                        _ _ __  _| |_  | |_   _  __ _
--                       | | '_ \| | __| | | | | |/ _` |
--                       | | | | | | |_ _| | |_| | (_| |
--                       |_|_| |_|_|\__(_)_|\__,_|\__,_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- The plugin module assembly
--------------------------------------------------------------------------------

local M = {}

M.add = require("plugin.add")
M.list = require("plugin.list")
M.load = require("plugin.load")
M.setup = require("plugin.setup")
M.state = require("plugin.state")
M.update = require("plugin.update")

return M
