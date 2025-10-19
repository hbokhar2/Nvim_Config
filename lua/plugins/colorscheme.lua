return {
}

--[[
return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = false,
				theme = "wave",
				overrides = function(colors)
					return {

						Normal       = { bg = "#010101" },
						NormalFloat  = { bg = "#010101" },
						SignColumn   = { bg = "#010101" },
						LineNr       = { bg = "#010101" },
						CursorLineNr = { bg = "#010101" },
						StatusLine   = { bg = "#010101" },
						VertSplit    = { bg = "#010101" },

						["@type.builtin"]      = { fg = KanagawaPalette.lightSteelBlue, bold = false, link = "" },
						["@type"]              = { fg = KanagawaPalette.lightSteelBlue, bold = true, link = "" },

					}
				end,
			})

			vim.cmd.colorscheme("kanagawa")

		end,
	}
} ]]--

--[[{
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.moonflyTransparent = true
		vim.cmd("colorscheme moonfly")
	end,
} ]]--

--[[  {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "latte", -- latte, frappe, macchiato, mocha
			transparent_background = false,
			float = {
				transparent = false,
				solide = false,
			}
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}, ]]--
--[[  {
	"EdenEast/nightfox.nvim",
	name = "dawnfox",
	priority = 1000,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = "italic",
					keywords = "bold",
					functions = "italic,bold",
					strings = "NONE",
				},
			},
		})
		vim.cmd.colorscheme("terrafox")
	end,
} ]]--
