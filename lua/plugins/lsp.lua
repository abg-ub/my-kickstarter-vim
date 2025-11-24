-- lua/config/lsp.lua

-- Use the new Neovim 0.11+ LSP API
local lspconfig = vim.lsp
local configs = require("lspconfig.configs")  -- new way
local util = require("lspconfig.util")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Register ts_ls only once
if not configs.ts_ls then
  configs.ts_ls = {
    default_config = {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
      single_file_support = true,
      capabilities = capabilities,
    },
  }
end

-- Start the language server for TypeScript / JavaScript
vim.lsp.start({
  name = "ts_ls",
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = util.root_pattern("tsconfig.json", "package.json", ".git")(vim.fn.getcwd()),
  capabilities = capabilities,
})
