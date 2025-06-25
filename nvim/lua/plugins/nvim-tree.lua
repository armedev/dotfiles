return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,
  opts = {
    filters = { dotfiles = false, git_ignored = false },
    disable_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    view = {
      width = 30,
      preserve_window_proportions = true,
    },
    renderer = {
      root_folder_label = false,
      highlight_git = true,
      icons = {
        glyphs = {
          default = '󰈚',
          folder = {
            default = '',
            empty = '',
            empty_open = '',
            open = '',
            symlink = '',
          },
          git = { unmerged = '' },
        },
      },
    },
  },
  keys = {
    { '<C-n>', ':NvimTreeToggle<CR>', desc = 'Nvim tree toggle', silent = true },
  },
}
