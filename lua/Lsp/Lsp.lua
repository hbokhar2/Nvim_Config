require('Lsp.lua_lsp')
require('Lsp.c_cxx_lsp')
require('Lsp.py_lsp')

-- Configure diagnostics with modern signs
vim.diagnostic.config({
	virtual_text = {
		prefix = '●',
		spacing = 4,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = 'E',
			[vim.diagnostic.severity.WARN] = 'W',
			[vim.diagnostic.severity.HINT] = 'H',
			[vim.diagnostic.severity.INFO] = 'I',
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
})

