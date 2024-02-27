---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'catppuccin',
 nvdash = {
    load_on_startup = true,

    header = {
    [[       ███╗   ██╗██╗   ██╗██╗███╗   ███╗       ]],
    [[       ████╗  ██║██║   ██║██║████╗ ████║       ]],
    [[       ██╔██╗ ██║██║   ██║██║██╔████╔██║       ]],
    [[       ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║       ]],
    [[       ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║       ]],
    [[       ══╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝       ]]
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
      { "Quit", ":q", ":q" },
    },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
