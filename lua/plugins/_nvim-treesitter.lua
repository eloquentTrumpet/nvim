-- nvim-treesitter

local config = {
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	ensure_installed = {
		-- 'bash',
		-- 'comment',
		"css",
		-- 'diff',
		-- 'dockerfile',
		-- 'fish',
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"html",
		"http",
		-- 'java',
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"luadoc",
		"luap",
		"markdown",
		"markdown_inline",
		"python",
		-- 'query',
		"regex",
		"scss",
		-- 'sql',
		-- 'ssh_config',
		-- 'swift',
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"xml",
		"yaml",
	},
}

local M = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,

	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,

	config = function()
		require("nvim-treesitter.configs").setup(config)
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		-- parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
		parser_config.tsx.filetype_to_parsername =
			{ "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
	end,
}

return { M }
