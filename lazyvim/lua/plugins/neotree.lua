return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            hint = "floating-big-letter",
            show_prompt = false,
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                -- if the buffer type is one of following, the window will be ignored
                buftype = { "terminal", "quickfix" },
              },
            },
          })
        end,
      },
    },
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      {
        "<leader>ee",
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
