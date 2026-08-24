vim.g.mapleader = " "

local M = {}

function M.setup_lsp_keybinds(ev, client)
	local opts = { buffer = ev.buf }

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)

	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.setqflist()
		vim.cmd("copen")
	end, { desc = "Open diagnostics list" })
	vim.keymap.set('n', 'gr',         vim.lsp.buf.references, opts)
	vim.keymap.set('i', '<C-n>', function()
		if vim.fn.pumvisible() == 1 then
			return '<C-n>'
		else
			return '<C-x><C-o>'
		end
	end, { expr = true, replace_keycodes = true, buffer = ev.buf, desc = "Smart LSP Completion" })
end

function M.setup_fzf_keybinds()
	vim.keymap.set("n", "<leader>f", function()
		require("fzf-lua").files()
	end, { desc = "Search files within PWD" })

	vim.keymap.set("n", "<leader>g", function()
		require("fzf-lua").live_grep()
	end, { desc = "Grep search" })

	vim.keymap.set("n", "<leader>h", function()
		require("fzf-lua").help_tags()
	end, { desc = "Search help tags" })
end
M.setup_fzf_keybinds()

function M.setup_terminal_keybinds()
end
M.setup_terminal_keybinds()

return M
