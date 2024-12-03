return {
  "hrsh7th/nvim-cmp",

  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-n>"] = function() end,
      ["<C-p>"] = function() end,
    })
  end,
}
