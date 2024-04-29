require("_common")

-- smart-splits
local M = {
	"mrjones2014/smart-splits.nvim",
	config = function()
		local smartSplits = require("smart-splits")
		smartSplits.setup({})
		-- recommended mappings
		-- resizing splits
		-- these keymaps will also accept a range,
		-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
		vim.keymap.set("n", "˘", smartSplits.resize_left)
		vim.keymap.set("n", "¬", smartSplits.resize_down)
		vim.keymap.set("n", "º", smartSplits.resize_up)
		vim.keymap.set("n", "ﬂ", smartSplits.resize_right)
		-- moving between splits
		vim.keymap.set("n", "<C-h>", smartSplits.move_cursor_left)
		vim.keymap.set("n", "<C-j>", smartSplits.move_cursor_down)
		vim.keymap.set("n", "<C-k>", smartSplits.move_cursor_up)
		vim.keymap.set("n", "<C-l>", smartSplits.move_cursor_right)
		vim.keymap.set("n", "<C-\\>", smartSplits.move_cursor_previous)
		-- swapping buffers between windows
		-- vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
		-- vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
		-- vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
		-- vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

		-- which-key
		local name = "smart-splits"
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			["<leader>"] = {
				name = name,
				["h"] = { smartSplits.swap_buf_left, label("swap_buf_left") },
				["j"] = { smartSplits.swap_buf_down, label("swap_buf_down") },
				["k"] = { smartSplits.swap_buf_up, label("swap_buf_up") },
				["l"] = { smartSplits.swap_buf_right, label("swap_buf_right") },
			},
		}, { prefix = "<leader>" })
	end,
}

return { M }
