local config = {

	cmd = { "pyright-langserver", "--stdio" },

	filetypes = { "python" },

	root_dir = function(bufnr, on_dir)
		local filename = vim.api.nvim_buf_get_name(bufnr)
		local root = vim.fs.root(filename, {
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			"Pipfile",
			".git",
		})
		on_dir(root or vim.fs.dirname(filename))
	end,

	settings = {
		python = {
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
				typeCheckingMode = "basic",
			},
		},
	},

}

vim.lsp.config('pyright', config)
vim.lsp.enable('pyright')
