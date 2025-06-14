local o = vim.o
local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '
-- Set to true if you have a Nerd Font installed and selected in the terminal
g.have_nerd_font = true

-- number line
o.ruler = false
o.number = true
o.relativenumber = true
-- tab
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
-- search
o.ignorecase = true
o.smartcase = true
o.mouse = 'a'
-- Enable break indent
o.breakindent = true
-- Save undo history
o.undofile = true
-- Keep signcolumn on by default
o.signcolumn = 'yes'
-- Decrease update time
o.updatetime = 250
-- Decrease mapped sequence wait time
o.timeoutlen = 300
-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
o.list = true
-- Preview substitutions live, as you type!
o.inccommand = 'split'
-- Show which line your cursor is on
o.cursorline = true
o.cursorlineopt = 'number'
-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
o.confirm = true
o.laststatus = 3
o.showmode = false
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

opt.listchars = { tab = '» ', trail = '·', nbsp = '·' }
opt.fillchars = { eob = ' ' }
opt.termguicolors = true

-- Style LSP floating windows with rounded visible borders
local function style_float_windows()
  local bg_color = '#1e222a' -- Dark background
  local border_color = '#3e4452' -- Slightly lighter than bg for visible border
  local text_color = '#c8d3f5'
  local blend_value = 0 -- 0 = no transparency

  vim.api.nvim_set_hl(0, 'NormalFloat', {
    bg = bg_color,
    fg = text_color,
    blend = blend_value,
  })

  vim.api.nvim_set_hl(0, 'FloatBorder', {
    bg = bg_color,
    fg = border_color,
    blend = blend_value,
  })
end

-- Apply rounded border style to LSP handlers
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

-- Apply styles on colorscheme change and on startup
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = style_float_windows,
})

style_float_windows()
