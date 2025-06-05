local map = vim.keymap.set
-- Keybinds to make split navigation easier with tmux
--  Use CTRL+<hjkl> to switch between windows
map('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'Move focus to the upper window' })

-- harpoon
local harpoon_list = require('harpoon'):list()
map('n', '<leader>a', function()
  harpoon_list:add()
end, { desc = 'add harpoon' })
map('n', '<leader>A', function()
  harpoon_list:prepend()
end, { desc = 'prepend harpoon' })
map('n', '<leader>n', function()
  harpoon_list:next()
end, { desc = 'next harpoon' })
map('n', '<leader>N', function()
  harpoon_list:prev()
end, { desc = 'previous harpoon' })
map('n', '<leader>e', function()
  local harpoon = require 'harpoon'
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'list harpoons' })

-- fugitive git
map('n', '<leader>G', '<cmd> Git <CR>', { desc = 'Open fugititve git' })

-- telescope
local telescope = require 'telescope.builtin'
map('n', '<leader>sh', telescope.help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sk', telescope.keymaps, { desc = '[S]earch [K]eymaps' })
map('n', '<leader>sf', telescope.find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>ss', telescope.builtin, { desc = '[S]earch [S]elect Telescope' })
map('n', '<leader>sw', telescope.grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', telescope.live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', telescope.diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', telescope.resume, { desc = '[S]earch [R]esume' })
map('n', '<leader>s.', telescope.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map('n', '<leader><leader>', telescope.buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>gt', telescope.git_status, { desc = 'Telescope [G]it S[t]atus' })
map('n', '<leader>s/', function()
  telescope.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

--conform
map('n', '<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = '[F]ormat buffer' })

-- MISC
map('n', '<leader>lo', '<cmd> copen<CR>', { desc = 'Quickfix list open' })
map('n', ']]', '<cmd> cn<CR>', { desc = 'Quickfix list next' })
map('n', '[[', '<cmd> cp<CR>', { desc = 'Quickfix list prev' })
map('n', '<leader>X', '<cmd>%bd<CR>', { desc = 'Close All open buffer' })
map('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })
map('n', '<Esc>', ':noh<CR>')
map('n', '<C-s>', '<cmd>w<CR>', { desc = 'general save file' })
map('n', '<leader>b', '<cmd>enew<CR>', { desc = 'buffer new' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- TIP: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
