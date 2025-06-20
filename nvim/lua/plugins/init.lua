return {
  'NMAC427/guess-indent.nvim',
  'tpope/vim-fugitive',

  require 'plugins.nvim-cmp',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lspconfig',
  require 'plugins.conform',
  require 'plugins.treesitter',
  require 'plugins.lualine',
  require 'plugins.debug',
  require 'plugins.lint',
  require 'plugins.autopairs',
  require 'plugins.nvim-tree',
  require 'plugins.gitsigns',
  require 'plugins.harpoon',
  require 'plugins.catpuccin',

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = true } },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'User FilePost',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      scope = {
        enabled = false,
      },
    },
  },
}
