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

--- HACK: Override `vim.lsp.util.stylize_markdown` to use Treesitter.
---@param bufnr integer
---@param contents string[]
---@param opts table
---@return string[]
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.stylize_markdown = function(bufnr, contents, opts)
  contents = vim.lsp.util._normalize_markdown(contents, {
    width = vim.lsp.util._make_floating_popup_size(contents, opts),
  })
  vim.bo[bufnr].filetype = 'markdown'
  vim.treesitter.start(bufnr)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)

  return contents
end
