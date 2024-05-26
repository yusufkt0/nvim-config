local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
   lspconfig.ccls.setup {
       init_options = {
           compilationDatabaseDirectory = "build",
           index = {
               threads = 0
           },
           clang = {
               excludeArgs = {"-frounding-math"}
           }
       }
   }
