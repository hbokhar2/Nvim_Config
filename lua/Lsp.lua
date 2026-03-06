local Keybinds = require('Keybinds')

require('Lsp.lua_lsp')
require('Lsp.c_cxx_lsp')

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

-- Shared LspAttach for ALL LSP clients
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then return end

		local opts = { buffer = ev.buf }

		-- Setup keybinds
		Keybinds.setup_lsp_keybinds(ev, client)

		-- Enable auto-completion
		if client.supports_method('textDocument/completion') then
			vim.opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}
			vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
			vim.keymap.set('i', '<C-Space>', vim.lsp.completion.get, opts)
		end
	end
})
