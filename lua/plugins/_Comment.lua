require("_common")

-- Comment
local M = {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	-- lazy = false,
	config = function()
		local config = {
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		}
		require("Comment").setup(config)
	end,
}

return { M }
