--Black Background
--vim.api.nvim_set_hl(0, 'Normal', {bg = '#000000'})
--vim.api.nvim_set_hl(0, 'NormalFloat', {bg = '#000000'})
--vim.api.nvim_set_hl(0, 'SignColumn', {bg = '#000000'})
--vim.api.nvim_set_hl(0, 'EndOfBuffer', {bg = '#000000'})
--vim.api.nvim_set_hl(0, 'LineNr', {bg = '#000000'})
--vim.api.nvim_set_hl(0, 'CursorLineNr', {bg = '#000000'})

--Transparent Background
local transparent_groups = {
	"Normal",
	"NormalNC",
	"NormalFloat",
	"LineNr",
	"CursorLineNr",
	"SignColumn",
	"StatusLine",
	"StatusLineNC",
	"EndOfBuffer",
	"FloatBorder",
	"WinSeparator",
}

for _, group in ipairs(transparent_groups) do
	vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
end

vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = false
vim.opt.number = true
vim.opt.relativenumber = true
