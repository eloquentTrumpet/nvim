local M = {
	"mfussenegger/nvim-dap",
	config = function()
		-- require("dap")
		vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
	end,
}

return { M }
