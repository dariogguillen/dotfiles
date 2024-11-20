return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = false })
        end,
        desc = "NeoTree (root dir)",
      },
      {
        "<leader>es",
        function()
          require("neo-tree.command").execute({ action = "show", toggle = true })
        end,
        desc = "Show NeoTree",
      },
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          leave_dirs_open = true,
        },
        group_empty_dirs = true,
      },
    },
  },
}
