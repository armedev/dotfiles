return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local parsers = {
      'bash',
      'c',
      'css',
      'diff',
      'git_config',
      'git_rebase',
      'gitcommit',
      'gitignore',
      'go',
      'html',
      'ini',
      'javascript',
      'json',
      'julia',
      'lua',
      'luadoc',
      'make',
      'markdown',
      'markdown_inline',
      'pymanifest',
      'python',
      'query',
      'r',
      'requirements',
      'rust',
      'ssh_config',
      'tmux',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'xml',
      'yaml',
    }

    local filetypes = vim.list_extend(vim.deepcopy(parsers), { 'jsonc' })

    require('nvim-treesitter').install(parsers)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
  -- opts = {
  --   ensure_installed = ,
  --   auto_install = true,
  --   highlight = {
  --     enable = true,
  --     additional_vim_regex_highlighting = { 'ruby' },
  --   },
  --   indent = { enable = true, disable = { 'ruby' } },
  -- },
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
