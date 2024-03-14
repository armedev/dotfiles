local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"


lspconfig.rust_analyzer.setup({
  on_attach= on_attach,
  capabilities= capabilities,
  filetypes= {"rust"},
  root_dir= lspconfig.util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allfeatures = true,
      }
    }
  }
})

lspconfig.eslint.setup({
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  capabilities=capabilities,
  root_dir=lspconfig.util.root_pattern(".eslintrc",".eslintrc.*")
})

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities=capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- dart lsp

lspconfig.dartls.setup{
  cmd = { 'dart', 'language-server', '--protocol=lsp' },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'dart' },
  root_dir = lspconfig.util.root_pattern 'pubspec.yaml',
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    outline = true,
    flutterOutline = true,
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
}

-- all other lsps

local servers = { "html", "tailwindcss", "cssls", "docker_compose_language_service", "graphql", "jsonls", "yamlls","jedi_language_server", "bashls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
