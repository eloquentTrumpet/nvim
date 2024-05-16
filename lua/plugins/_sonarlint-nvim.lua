local M = {
	"https://gitlab.com/schrieveslaach/sonarlint.nvim",
	config = function()
		require("sonarlint").setup({
			server = {
				cmd = {
					"sonarlint-language-server",
					-- Ensure that sonarlint-language-server uses stdio channel
					"-stdio",
					"-analyzers",
					-- paths to the analyzers you need, using those for python and java in this example
					vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarcfamily.jar"),
					vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarjs.jar"),
					vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonartext.jar"),
				},
			},
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"python",
				"cpp",
				"java",
				"css",
				"scss",
				"tsx",
				"json",
			},
		})
	end,
}

return { M }
