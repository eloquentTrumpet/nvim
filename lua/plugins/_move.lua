-- move

local M = {
	"fedepujol/move.nvim",
	dependencies = {
		-- Key bindings
		"folke/which-key.nvim",
	},
	config = function()
		require("move").setup({
			line = {
				enable = true, -- Enables line movement
				indent = true, -- Toggles indentation
			},
			block = {
				enable = true, -- Enables block movement
				indent = true, -- Toggles indentation
			},
			word = {
				enable = true, -- Enables word movement
			},
			char = {
				enable = true, -- Enables char movement
			},
		})
		local opts = { noremap = true, silent = true }
		-- Normal-mode commands
		vim.keymap.set("n", "√", ":MoveLine(1)<CR>", opts) -- <A-j>
		vim.keymap.set("n", "ª", ":MoveLine(-1)<CR>", opts) -- <A-k>
		vim.keymap.set("n", "˛", ":MoveHChar(-1)<CR>", opts) -- <A-h>
		vim.keymap.set("n", "ﬁ", ":MoveHChar(1)<CR>", opts) -- <A-l>
		vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts) -- <leader>wf
		vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts) -- <leader>wb

		-- Visual-mode commands
		vim.keymap.set("v", "√", ":MoveBlock(1)<CR>", opts) -- <A-j>
		vim.keymap.set("v", "ª", ":MoveBlock(-1)<CR>", opts) -- <A-k>
		vim.keymap.set("v", "˛", ":MoveHBlock(-1)<CR>", opts) -- <A-h>
		vim.keymap.set("v", "ﬁ", ":MoveHBlock(1)<CR>", opts) -- <A-l>
	end,
}

return { M }
