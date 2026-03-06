vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.setqflist()
	vim.cmd("copen")
end, { desc = "Open diagnostics list" })

local M = {}

function M.setup_lsp_keybinds(ev, client)
	local opts = { buffer = ev.buf }
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

return M
