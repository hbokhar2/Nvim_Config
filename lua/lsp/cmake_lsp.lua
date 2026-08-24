local config = {

	cmd = {
		'cmake-language-server',
	},

	filetypes = {
		"cmake",
	},

	root_dir = function(bufnr, on_dir)
		local file_name = vim.api.nvim_buf_get_name(bufnr)
		on_dir(file_name)
	end,

}

vim.lsp.config('cmake', config)
vim.lsp.enable('cmake')
