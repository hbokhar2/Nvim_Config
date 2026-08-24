return {

	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			keymap = {
				builtin = {
					["preview-up"] = "<PageUp>",
					["preview-down"] = "<PageDown>",
				},
				fzf = {
					["tab"] = "down",
					["shift-tab"] = "up",
				},
			}
		}
	}

}
