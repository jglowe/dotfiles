--------------------------------------------------------------------------------
--
--                 __      _     _ _               _
--                / _|    | |   | (_)             | |
--               | |_ ___ | | __| |_ _ __   __ _  | |_   _  __ _
--               |  _/ _ \| |/ _` | | '_ \ / _` | | | | | |/ _` |
--               | || (_) | | (_| | | | | | (_| |_| | |_| | (_| |
--               |_| \___/|_|\__,_|_|_| |_|\__, (_)_|\__,_|\__,_|
--                                          __/ |
--                                         |___/
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains all the folding settings
--------------------------------------------------------------------------------

vim.cmd([[augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END]])

-- Folding code defaults
vim.opt.foldmethod = "syntax"
