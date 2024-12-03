return {
  "wintermute-cell/gitignore.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim", -- optional: for multi-select
  },
  config = function()
    require("gitignore")
    vim.g.gitignore_nvim_overwrite = false
  end,
}
