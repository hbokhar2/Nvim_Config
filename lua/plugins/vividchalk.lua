return {
	{
		"tpope/vim-vividchalk",
		pin = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("vividchalk")
		end,
	}
}
