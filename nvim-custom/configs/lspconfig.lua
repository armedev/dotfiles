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

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities=capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" },
  settings = {
    implicitProjectConfiguration = {
      checkJs = true
    },
  }
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
