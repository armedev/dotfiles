return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          n = {
            ['O'] = require('telescope.actions').cycle_history_next,
            ['o'] = require('telescope.actions').cycle_history_prev,
          },
        },
      },
      pickers = {
        lsp_references = {
          initial_mode = 'normal',
        },
        lsp_implementations = {
          initial_mode = 'normal',
        },
        lsp_definitions = {
          initial_mode = 'normal',
        },
        lsp_document_symbols = {
          initial_mode = 'normal',
        },
        lsp_type_definitions = {
          initial_mode = 'normal',
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
