require("_common")

-- noetest
local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- adapters
		"nvim-neotest/neotest-jest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})

		-- which-key
		local name = "Neotest"
		local cmd = CMD_FUNC(name)
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			name = name,
			["n"] = {
				name = name,
				["r"] = { cmd("run"), label("Run the nearest test") },
			},
		}, { prefix = "<leader>" })
	end,
}

return { M }
