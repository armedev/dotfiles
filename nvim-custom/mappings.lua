local M = {
  general = {
    n = {
      -- tmux
      ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "window left"},
      ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "window right"},
      ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", "window down"},
      ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", "window up"},

      -- harpoon
      ["<leader>a"] = {
        function ()
          require("harpoon"):list():append()
        end,
        "append harpoon"
      },
      ["<leader>A"] = {
        function ()
          require("harpoon"):list():prepend()
        end,
        "prepend harpoon"
      },
      ["<leader>N"] = {
        function ()
          require("harpoon"):list():prev()
        end,
        "previous harpoon"
      },
      ["<leader>n"] = {
        function ()
          require("harpoon"):list():next()
        end,
        "next harpoon"
      },
      ["<leader>e"] = {
        function ()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        "list harpoons"
      },

      -- quickfix list
      ["qo"] = { "<cmd> copen<CR>","Quickfix list open" },
      ["qn"] = { "<cmd> cn<CR>","Quickfix list next" },
      ["qp"] = { "<cmd> cp<CR>","Quickfix list prev" },
      ["<leader>G"] = {"<cmd> Git <CR>", "Open fugititve git"},
    },
  },
  telescope = {
    plugin = true,
    n = {
      ["<leader>fc"] = {
        function ()
          require("telescope.builtin").grep_string()
        end,
        "fuzzy find word under cursor"
      }
    },
    v = {
      ["<leader>fc"] = {
        function ()
          require("telescope.builtin").grep_string()
        end,
        "fuzzy find word under cursor"
      }
    },
    x = {
      ["<leader>fc"] = {
        function ()
          require("telescope.builtin").grep_string()
        end,
        "fuzzy find word under cursor"
      }
    }
  },
}

return M
