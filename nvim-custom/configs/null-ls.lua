local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions

local sources = {
  formatting.prettierd,
  formatting.black,
  formatting.rustywind, -- for tailwind classes
  lint.textlint,
  lint.stylelint,
  lint.eslint_d,
  codeactions.eslint_d
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
   debug = true,
   sources = sources,
  on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format({async = false})
                end,
            })
        end
    end,
}
