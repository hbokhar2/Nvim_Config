local config = {
	cmd = {
		'clangd',
		"--enable-config",
		"--query-driver=/nix/store/*/bin/*",
		'--background-index',
		'--clang-tidy',
		'--completion-style=detailed'
	},

	filetypes = {
		"c",
		"cpp",
	},

	root_markers = {
		".clangd",
		".git"
	}
}

vim.lsp.config('clangd', config)
vim.lsp.enable('clangd')
