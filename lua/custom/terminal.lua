local M = {}

	function M.open_terminal()
		vim.api.nvim_create_autocmd('TermOpen', {
			callback = function()
				vim.opt.number = false
				vim.opt.relativenumber = false
			end
		})
	end

return M
