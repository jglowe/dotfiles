--------------------------------------------------------------------------------
--
--        o8o               o8o      .       oooo
--        `"'               `"'    .o8       `888
--       oooo  ooo. .oo.   oooo  .o888oo      888  oooo  oooo   .oooo.
--       `888  `888P"Y88b  `888    888        888  `888  `888  `P  )88b
--        888   888   888   888    888        888   888   888   .oP"888
--        888   888   888   888    888 . .o.  888   888   888  d8(  888
--       o888o o888o o888o o888o   "888" Y8P o888o  `V88V"V8P' `Y888""8o
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : roman
--
-- Settings for neovim
--------------------------------------------------------------------------------

require("base")

if vim.opt.loadplugins:get() then
    require("yapm").setup()
    require("plugin")
end

-- Automatic, language-dependent indentation, syntax coloring and other
-- functionality.
--
-- Must come *after* the `:packadd!` calls above otherwise the contents of
-- package "ftdetect" directories won't be evaluated.
vim.cmd.filetype("indent plugin on")
vim.opt.syntax = "on"
