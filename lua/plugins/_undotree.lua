require("_common")

-- undotree
local M = {
	"mbbill/undotree",
	dependencies = {
		-- Key bindings
		"folke/which-key.nvim",
	},
	config = function()
		-- which-key
		local name = "undotree"
		local undotreeToggle = "UndotreeToggle"
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			["u"] = { CMD(undotreeToggle), label(undotreeToggle) },
		}, { prefix = "<leader>" })
	end,
}

return { M }
