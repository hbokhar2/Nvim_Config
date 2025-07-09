--FzF Keybinds
vim.keymap.set("n", "<leader>f", require("fzf-lua").files, {desc = "Search files within PWD"})
vim.keymap.set("n", "<leader>g", require("fzf-lua").grep)
vim.keymap.set("n", "<leader>h", require("fzf-lua").help_tags, {desc = "Search help tags"})

-- LSP Navigation
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set('n', 'gr', function() require('fzf-lua').lsp_references() end, { desc = "Find references" })
vim.keymap.set('n', 'gi', function() require('fzf-lua').lsp_implementations() end, { desc = "Find implementations" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show documentation" })

--Error View
vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.setqflist()
  vim.cmd("copen")
end, { desc = "Open diagnostics list" })

--Home
vim.keymap.set("n", "<Home>", "<cmd>Alpha<CR>")
