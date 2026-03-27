return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			keymap = {
				builtin = {
					-- Keybinds for FZF local to just neogim
					["preview-up"] = "<PageUp>",
					["preview-down"] = "<PageDown>",
				},
				fzf = {
					-- FZF binds globally including outside of neovim 
					["tab"] = "down",
					["shift-tab"] = "up",
				},
			}
		}
	}
}
