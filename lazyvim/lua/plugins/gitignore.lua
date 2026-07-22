return {
  "wintermute-cell/gitignore.nvim",
  config = function()
    require("gitignore")
    vim.g.gitignore_nvim_overwrite = false
  end,
}
