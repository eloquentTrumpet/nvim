-- formatter

local M = {
	"mhartington/formatter.nvim",
	config = function()
		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			filetype = {
        ["*"] = {
          require("formatter.defaults").prettier
        },
			},
		})

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    augroup("__formatter__", { clear = true })
    autocmd("BufWritePost", { group = "__formatter__", command = ":FormatWrite", })

	end,
}

return { M }
