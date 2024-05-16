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
			["n"] = {
				name = name,
				["r"] = { cmd("run"), label("Run the nearest test") },
			},
		}, { prefix = "<leader>" })
	end,
}

return { M }

-- keys = {
--     { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
--     { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
--     { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
--     { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
--     { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
--     { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
--     { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
-- },
