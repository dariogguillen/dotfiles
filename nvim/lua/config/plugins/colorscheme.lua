return {
	{
		"EdenEast/nightfox.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			local options = {
				dim_inactive = true,
				-- transparent = true,
			}

			require("nightfox").setup({
				options = options,
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme nordfox]])
		end,
	},
}
