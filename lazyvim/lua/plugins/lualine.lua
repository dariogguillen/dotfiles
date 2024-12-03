return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      globalstatus = false,
    },
    sections = {
      lualine_y = {
        { "encoding" },
        { "fileformat" },
        { "filetype", colored = true, icon_only = true },
      },
      lualine_z = {
        { "progress", padding = { left = 0, right = 1 } },
        { "location", padding = { left = 0, right = 1 } },
      },
    },
  },
}
