require("_common")

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
		-- vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts) -- <leader>wf
		-- vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts) -- <leader>wb

		-- Visual-mode commands
		vim.keymap.set("v", "√", ":MoveBlock(1)<CR>", opts) -- <A-j>
		vim.keymap.set("v", "ª", ":MoveBlock(-1)<CR>", opts) -- <A-k>
		vim.keymap.set("v", "˛", ":MoveHBlock(-1)<CR>", opts) -- <A-h>
		vim.keymap.set("v", "ﬁ", ":MoveHBlock(1)<CR>", opts) -- <A-l>

		-- which-key
		local name = "Move"
		local label = LABEL(name)
		local wk = require("which-key")

		-- local moveLinePlus = "MoveLine(1)"
		-- local moveLineMinus = "MoveLine(-1)"
		-- local moveCharPlus = "MoveHChar(1)"
		-- local moveCharMinus = "MoveHChar(-1)"
		-- wk.register({
		-- 	name = name,
		-- 	["√"] = { CMD(moveLinePlus), label(moveLinePlus), mode = { "n" } },
		-- 	["ª"] = { CMD(moveLineMinus), label(moveLineMinus), mode = { "n" } },
		-- 	["ﬁ"] = { CMD(moveCharPlus), label(moveCharPlus), mode = { "n" } },
		-- 	["˛"] = { CMD(moveCharMinus), label(moveCharMinus), mode = { "n" } },
		-- })
		-- local moveBlockPlus = "MoveBlock(1)"
		-- local moveBlockMinus = "MoveBlock(-1)"
		-- local moveHBlockPlus = "MoveHBlock(1)"
		-- local moveHBlockMinus = "MoveHBlock(-1)"
		-- wk.register({
		-- 	name = name,
		-- 	["√"] = { CMD(moveBlockPlus), label(moveBlockPlus), mode = { "v" } },
		-- 	["ª"] = { CMD(moveBlockMinus), label(moveBlockMinus), mode = { "v" } },
		-- 	["ﬁ"] = { CMD(moveHBlockPlus), label(moveHBlockPlus), mode = { "v" } },
		-- 	["˛"] = { CMD(moveHBlockMinus), label(moveHBlockMinus), mode = { "v" } },
		-- })
		local moveWordPlus = "MoveWord(1)"
		local moveWordMinus = "MoveWord(-1)"
		wk.register({
			["w"] = {
				name = name,
				["f"] = { CMD(moveWordPlus), label(moveWordPlus), mode = { "n" } },
				["b"] = { CMD(moveWordMinus), label(moveWordMinus), mode = { "n" } },
			},
		}, { prefix = "<leader>" })
	end,
}

return { M }
