local keymaps = require("options.keybinds")

require('lsp.lua_lsp')
require('lsp.c_cxx_lsp')
require('lsp.py_lsp')
require('lsp.cmake_lsp')

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

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then return end

		keymaps.setup_lsp_keybinds(ev, client)

		if client.supports_method('textDocument/completion') then
			vim.opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end

	end
})
