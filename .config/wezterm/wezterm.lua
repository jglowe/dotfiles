local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font 'MesloLGS Nerd Font Mono'
config.color_scheme = 'Classic Dark (base16)'
config.color_scheme = 'Eighties (base16)'

return config
