local icons = {
  Text = '󰉿',
  Variable = '󰜢',
  Snippet = '',
  Function = '󰊕',
  Keyword = '󰌋',
  Field = '',
  Property = '',
  Enum = '',
  Class = '',
  Method = '',
  Module = '',
  Array = '',
}

return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*', -- Or point to the exact v2 tag
  dependencies = {
    { 'saghen/blink.compat', opts = { enable_events = true } },
    {
      'supermaven-inc/supermaven-nvim',
      opts = {
        keymaps = { accept_suggestion = nil }, -- Handled by blink
        disable_inline_completion = true, -- Handled in menu
      },
    },
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
    },
    'folke/lazydev.nvim',
    {
      'windwp/nvim-autopairs',
      opts = {
        fast_wrap = {},
        disable_filetype = { 'TelescopePrompt', 'vim' },
      },
    },
  },

  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'none', -- Disables Blink defaults so there are no key conflicts

      -- Show/hide completion menu & documentation (Replaces <C-Space> and <C-e>)
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },

      -- Confirm selection with Enter (Replaces ConfirmBehavior.Insert)
      ['<CR>'] = { 'accept', 'fallback' },

      -- Navigate next item OR jump forward in LuaSnip (Replaces nvim-cmp <Tab>)
      ['<Tab>'] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.select_next()
          elseif cmp.snippet_active() then
            return cmp.snippet_forward()
          end
        end,
        'fallback',
      },

      -- Navigate previous item OR jump backward in LuaSnip (Replaces nvim-cmp <S-Tab>)
      ['<S-Tab>'] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.select_prev()
          elseif cmp.snippet_active() then
            return cmp.snippet_backward()
          end
        end,
        'fallback',
      },

      -- Direct item navigation (Replaces <C-n> / <C-p>)
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },

      -- Scroll documentation window (Replaces <C-d> / <C-f>)
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_up', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono',
      -- Maps your custom icons to Blink's completion item kinds
      kind_icons = icons,
    },

    completion = {
      -- Enables auto-brackets on completion (Replaces nvim-autopairs cmp hook)
      accept = {
        auto_brackets = { enabled = true },
      },

      menu = {
        border = 'rounded',
        draw = {
          columns = {
            { 'kind_icon', 'kind', gap = 1 },
            { 'label', 'label_description', gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = { border = 'rounded' },
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev', 'supermaven' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
        supermaven = {
          name = 'supermaven',
          module = 'blink.compat.source', -- Points to blink.compat
          score_offset = 100,
          transform_items = function(_, items)
            for _, item in ipairs(items) do
              item.kind_icon = '󰧑'
              item.kind_name = 'Supermaven' -- Optional: label text
            end
            return items
          end,
        },
      },
    },

    -- Faster fuzzy matching using the Rust binary (Falls back to lua if toolchain missing)
    fuzzy = { implementation = 'prefer_rust' },

    snippets = { preset = 'luasnip' },
    signature = { enabled = true },
  },
}
