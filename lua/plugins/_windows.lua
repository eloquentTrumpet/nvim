require("_common")

-- windows.nvi m
local M = {
	"anuvyklack/windows.nvim",
	dependencies = {
		"anuvyklack/middleclass",
	},
	config = function()
		require("windows").setup({
			autowidth = {
				enable = false,
			},
		})
		-- which-key
		local name = "Windows"
		local windowsMaximize = "WindowsMaximize"
		local windowsMaximizeVertically = "WindowsMaximizeVertically"
		local windowsMaximizeHorizontally = "WindowsMaximizeHorizontally"
		local windowsEqualize = "WindowsEqualize"
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			name = name,
			["z"] = { CMD(windowsMaximize), label(windowsMaximize) },
			["_"] = { CMD(windowsMaximizeVertically), label(windowsMaximizeVertically) },
			["|"] = { CMD(windowsMaximizeHorizontally), label(windowsMaximizeHorizontally) },
			["="] = { CMD(windowsEqualize), label(windowsEqualize) },
		}, { prefix = "<C-w>" })
	end,
}

return { M }
