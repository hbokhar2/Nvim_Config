local config = {
	cmd = {
		'clangd',
		'--query-driver=/usr/bin/gcc,/usr/bin/g++,/usr/bin/c++',
		'--background-index',
		'--clang-tidy',
		'--completion-style=detailed'
	},

	filetypes = {
		"c",
		"cpp",
		"cxx",
		"h",
		"hpp"
	},

	root_markers = {
		".clangd",
		".git"
	}
}

vim.lsp.config('clangd', config)
vim.lsp.enable('clangd')
