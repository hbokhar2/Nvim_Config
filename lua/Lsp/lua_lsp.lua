local config = {
	cmd = {'lua-language-server'},
	filetypes = {'lua'},
	root_markers = {{'.luarc.json', '.luarc.jsonc'}, '.git'},
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			telemetry = {
				enable = false,
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		}
	}
}

vim.lsp.config('lua_ls', config)
vim.lsp.enable('lua_ls')

return config
