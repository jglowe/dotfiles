--------------------------------------------------------------------------------
--
--                       _   _   _                   _
--                      | | | | (_)                 | |
--              ___  ___| |_| |_ _ _ __   __ _ ___  | |_   _  __ _
--             / __|/ _ \ __| __| | '_ \ / _` / __| | | | | |/ _` |
--             \__ \  __/ |_| |_| | | | | (_| \__ \_| | |_| | (_| |
--             |___/\___|\__|\__|_|_| |_|\__, |___(_)_|\__,_|\__,_|
--                                        __/ |
--                                       |___/
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains the non plugin settings that aren't associated with
-- another logical unit of my config
--------------------------------------------------------------------------------

-- turn absolute line numbers on
vim.opt.number = true
-- vim.opt.relativenumber = true

-- Enables file undo after files close
vim.opt.undofile = true
vim.opt.undodir = vim.env.HOME .. "/.config/nvim/undodir"

-- Makes backspace to behave like most text editors
vim.opt.backspace = "indent,eol,start"

-- Search settings
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Colors columns beyond the textwidth background to show the line limit
local focused_colorcolumn = '+' .. table.concat({
  '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12',
  '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23',
  '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34',
  '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45',
  '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56',
  '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67',
  '68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78',
  '79', '80', '81', '82', '83', '84', '85', '86', '87', '88', '89',
  '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '100',
  '101', '102', '103', '104', '105', '106', '107', '108', '109', '110',
  '111', '112', '113', '114', '115', '116', '117', '118', '119', '120',
  '121', '122', '123', '124', '125', '126', '127', '128', '129', '130',
  '131', '132', '133', '134', '135', '136', '137', '138', '139', '140',
  '141', '142', '143', '144', '145', '146', '147', '148', '149', '150',
  '151', '152', '153', '154', '155', '156', '157', '158', '159', '160',
  '161', '162', '163', '164', '165', '166', '167', '168', '169', '170',
  '171', '172', '173', '174', '175', '176', '177', '178', '179', '180',
  '181', '182', '183', '184', '185', '186', '187', '188', '189', '190',
  '191', '192', '193', '194', '195', '196', '197', '198', '199', '200',
  '201', '202', '203', '204', '205', '206', '207', '208', '209', '210',
  '211', '212', '213', '214', '215', '216', '217', '218', '219', '220',
  '221', '222', '223', '224', '225', '226', '227', '228', '229', '230',
  '231', '232', '233', '234', '235', '236', '237', '238', '239', '240',
  '241', '242', '243', '244', '245', '246', '247', '248', '249', '250',
  '251', '252', '253', '254'
}, ',+')
vim.opt.colorcolumn = focused_colorcolumn
vim.opt.textwidth = 80

-- Sets the path to include the files in this subdirectory
vim.opt.path = vim.opt.path + "**"

vim.g.mapleader = " "

vim.opt.fillchars      = {
  diff                 = '∙', -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
  eob                  = ' ', -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0)
                              --          to suppress ~ at EndOfBuffer
  fold                 = '·', -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  vert                 = '┃', -- BOX DRAWINGS HEAVY VERTICAL
                              --            (U+2503, UTF-8: E2 94 83)
}

-- Pane navigation
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", { noremap = true })

-- Sets the update time to be more responsive
vim.opt.updatetime = 100

vim.opt.mouse = "a"

vim.opt.paste = false
vim.opt.pastetoggle = "<F2>"
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"


