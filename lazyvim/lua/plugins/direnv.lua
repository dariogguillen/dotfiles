return {
  {
    "direnv/direnv.vim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Auto-allow direnv for known projects
      vim.g.direnv_auto = 1
      -- Silent direnv messages
      vim.g.direnv_silent_load = 1
    end,
  },
}