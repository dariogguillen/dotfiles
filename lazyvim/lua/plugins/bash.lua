-- Bash/shell: LazyVim no tiene un extra dedicado, así que registramos aquí el
-- LSP (bashls) y el formateador (shfmt). Ambos vienen por Nix (neovim.nix) y
-- LazyVim los toma del PATH (Mason off).
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
    },
  },
}
