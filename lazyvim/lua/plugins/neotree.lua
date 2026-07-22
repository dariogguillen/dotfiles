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
            show_prompt = true,
            filter_rules = {
              include_current_win = false,
              autoselect_one = false,
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
    init = function()
      local group = vim.api.nvim_create_augroup("NeoTreeAutoClose", { clear = true })
      vim.api.nvim_create_autocmd("BufEnter", {
        group = group,
        callback = function()
          local layout = vim.fn.winlayout()
          if layout[1] == "leaf" and vim.bo[vim.api.nvim_win_get_buf(layout[2])].filetype == "neo-tree" then
            vim.cmd("quit")
          end
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistenceSavePre",
        group = group,
        callback = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      })
    end,
    opts = {
      git_status = {
        group_empty_dirs = true,
        follow_current_file = { enabled = true },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {},
        },
        follow_current_file = {
          leave_dirs_open = true,
        },
        group_empty_dirs = false,
      },
    },
  },
}
