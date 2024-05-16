require("_common")

-- fugitive
local M = {
	"tpope/vim-fugitive",
	dependencies = {
		-- Key bindings
		"folke/which-key.nvim",
	},
	config = function()
		-- which-key
		local name = "fugitive"
		local gitBlame = "Git blame"
		local gitDiff = "Git diff"
		local gitLog = "Git log"
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			["f"] = {
				name = name,
				["b"] = { CMD(gitBlame), label(gitBlame) },
				["d"] = { CMD(gitDiff), label(gitDiff) },
				["l"] = { CMD(gitLog), label(gitLog) },
			},
		}, { prefix = "<leader>" })
	end,
}

return { M }
