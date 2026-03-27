return {
	{
		"oskarnurm/koda.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("koda").setup({
				transparent = true
			})
			vim.cmd("colorscheme koda-dark")
		end,
	}
}

--	{
--		"bluz71/vim-moonfly-colors",
--		name = "moonfly",
--		lazy = false,
--		priority = 1000,
--		config = function()
--			vim.g.moonflyTransparent = true
--			vim.cmd("colorscheme moonfly")
--		end,
--	}

--	{
--		"scottmckendry/cyberdream.nvim",
--		lazy = false,
--		priority = 1000,
--		config = function()
--			require("cyberdream").setup({
--				variant = "auto",
--				transparent = true,
--				italic_comments = true, -- Optional: just an example of other fields
--				hide_fillchars = true,  -- Optional
--			})
--
--			-- You also need to actually TELL Neovim to use the colorscheme
--			vim.cmd("colorscheme cyberdream")
--		end
--	}
