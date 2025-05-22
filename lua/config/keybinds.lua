vim.keymap.set("n", "<leader>f", require("fzf-lua").files, {desc = "Search files within PWD"})
vim.keymap.set("n", "<leader>g", require("fzf-lua").grep)
vim.keymap.set("n", "<leader>h", require("fzf-lua").help_tags, {desc = "Search help tags"})
