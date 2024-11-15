return {
  "neovim/nvim-lspconfig",
  event = {},
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      pyright = {},
    },
  },
}
