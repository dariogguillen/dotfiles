return {
	{

		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = true,
				italic_comments = true,
				borderless_telescope = false,
				theme = {
					saturation = 0.8, -- accepts a value between 0 and 1. 0 = greyscale
				},
			})
			vim.cmd([[colorscheme cyberdream]])
		end,
	},
	{
		"mawkler/modicator.nvim",
		dependencies = "scottmckendry/cyberdream.nvim",
		init = function()
			-- These are required for Modicator to work
			vim.o.cursorline = false
			vim.o.number = true
			vim.o.termguicolors = true
		end,
		opts = {},
	},
}
