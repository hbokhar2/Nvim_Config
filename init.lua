local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{"Failed to clone lazy.nvim:\n", "ErrorMsg"},
			{out, "WarningMsg"},
			{"\nPress any key to exit..."},
		}, true, {})
		vim.fn.getchar()
		os.exit(10)
	end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " 
require("config.editor_options")
require("lazy").setup({
	spec = {
		{import = "plugins"},
	},
	install = {colorscheme = { "zaibatsu" }},
	checker = {enabled = true},
})

vim.cmd('colorscheme zaibatsu')
vim.api.nvim_set_hl(0, 'Normal', {bg = '#000000'})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg = '#000000'})
vim.api.nvim_set_hl(0, 'SignColumn', {bg = '#000000'})
vim.api.nvim_set_hl(0, 'EndOfBuffer', {bg = '#000000'})
vim.api.nvim_set_hl(0, 'LineNr', {bg = '#000000'})
vim.api.nvim_set_hl(0, 'CursorLineNr', {bg = '#000000'})

vim.g.did_ftplugin_ada = 1
require("config.keybinds")

vim.api.nvim_create_user_command("ClangdCompileCommands", function()
	local clients = vim.lsp.get_active_clients()
	for _, client in ipairs(clients) do
		if client.name == "clangd" then
			local config = client.config
			print("Clangd cmd: " .. table.concat(config.cmd, " "))
			if config.cmd then
				for _, arg in ipairs(config.cmd) do
					if arg:match("compile%-commands%-dir") then
						print("Using compile_commands.json in: " .. arg:match("=(.+)"))
					end
				end
			end
		end
	end
end, {})
