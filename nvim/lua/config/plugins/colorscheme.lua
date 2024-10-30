return {
	-- 	-- "vague2k/vague.nvim",
	-- 	-- "slugbyte/lackluster.nvim",
	-- 	-- "AlexvZyl/nordic.nvim",
	-- 	-- "gmr458/cold.nvim",
	-- 	"HoNamDuong/hybrid.nvim",
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Example config in lua
			vim.g.nord_contrast = false
			vim.g.nord_borders = true
			vim.g.nord_disable_background = true
			vim.g.nord_italic = true
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = false

			-- Load the colorscheme
			require("nord").set()

			-- Toggle background transparency
			local bg_transparent = true

			local toggle_transparency = function()
				bg_transparent = not bg_transparent
				vim.g.nord_disable_background = bg_transparent
				vim.cmd([[colorscheme nord]])
			end

			vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
		end,
	},
	-- {
	--
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("cyberdream").setup({
	-- 			transparent = true,
	-- 			italic_comments = true,
	-- 			borderless_telescope = false,
	-- 			theme = {
	-- 				saturation = 0.8, -- accepts a value between 0 and 1. 0 = greyscale
	-- 			},
	-- 		})
	-- 		vim.cmd([[colorscheme cyberdream]])
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		local options = {
	-- 			dim_inactive = true,
	-- 			-- transparent = true,
	-- 		}
	--
	-- 		require("nightfox").setup({
	-- 			options = options,
	-- 		})
	-- 		-- load the colorscheme here
	-- 		vim.cmd([[colorscheme nordfox]])
	-- 	end,
	-- },
}
