local plugins = {
    {
      "neovim/nvim-lspconfig",

      dependencies = {
       "jose-elias-alvarez/null-ls.nvim",
       config = function()
         require "custom.configs.null-ls"
       end,
     },

      config = function ()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
      end,
    },
    {
      "rust-lang/rust.vim",
      ft = "rust",
      init = function ()
        vim.g.rustfmt_autosave = 1
      end
    },
    {
      "christoomey/vim-tmux-navigator",
      lazy = false
    },-- Lua
    {
      "nvim-telescope/telescope.nvim",
      opts = require("custom.configs.telescope")
    },
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function ()
        require("custom.configs.harpoon")
      end
    },
  {
    "tpope/vim-fugitive",
    lazy = false
  }
 }

return plugins
