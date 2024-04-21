-- lspsaga

local M = {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		-- Key bindings
		"folke/which-key.nvim",
		-- 'nvim-treesitter/nvim-treesitter',
	},
	config = function()
		require("nvim-treesitter")
		require("lspsaga").setup()

		local divider = " : "
		local lspsaga = "Lspsaga"
		local finder = "finder"
		local diagnostics = "Diagnostics"
		local callhierarchy = "Callhierarchy"

		local cmd = function(cmd)
			return "<cmd>" .. cmd .. "<CR>"
		end

		local wk = require("which-key")

		wk.register({
			["K"] = { cmd("Lspsaga hover_doc"), lspsaga .. divider .. "hover_doc" },
		})

		wk.register({
			["g"] = {
				name = lspsaga,
				-- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
				["h"] = { cmd("Lspsaga finder"), lspsaga .. divider .. "finder" },
				["H"] = {
					name = lspsaga .. divider .. finder,
					["i"] = { cmd("Lspsaga finder imp"), lspsaga .. divider .. finder .. divider .. "implementation" },
					["r"] = { cmd("Lspsaga finder ref"), lspsaga .. divider .. finder .. divider .. "references" },
				},
				-- keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
				["a"] = { cmd("Lspsaga code_action"), lspsaga .. divider .. "code_action" },
				-- keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
				["r"] = { cmd("Lspsaga rename"), lspsaga .. divider .. "rename" },
				-- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
				["R"] = { cmd("Lspsaga rename ++project"), lspsaga .. divider .. "rename ++project" },
				-- keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
				["p"] = { cmd("Lspsaga peek_definition"), lspsaga .. divider .. "peek_definition" },
				-- keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
				["d"] = { cmd("Lspsaga goto_definition"), lspsaga .. divider .. "goto_definition" },
				-- keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
				["t"] = { cmd("Lspsaga peek_type_definition"), lspsaga .. divider .. "peek_type_definition" },
				-- keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")
				["T"] = { cmd("Lspsaga goto_type_definition"), lspsaga .. divider .. "goto_type_definition" },
				["o"] = { cmd("Lspsaga outline"), lspsaga .. divider .. "Outline" },
				["C"] = {
					name = lspsaga .. divider .. callhierarchy,
					-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
					["i"] = { cmd("Lspsaga incoming_calls"), callhierarchy .. divider .. "incoming_calls" },
					-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
					["o"] = { cmd("Lspsaga outgoing_calls"), callhierarchy .. divider .. "outgoing_calls" },
				},
			},
		})

		wk.register({
			["s"] = {
				name = lspsaga .. divider .. diagnostics,
				-- keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
				["l"] = { cmd("Lspsaga show_line_diagnostics"), diagnostics .. divider .. "show_line_diagnostics" },
				-- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
				["b"] = { cmd("Lspsaga show_buf_diagnostics"), diagnostics .. divider .. "show_buf_diagnostics" },
				-- keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
				["w"] = {
					cmd("Lspsaga show_workspace_diagnostics"),
					diagnostics .. divider .. "show_workspace_diagnostics",
				},
				-- keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
				["c"] = { cmd("Lspsaga show_cursor_diagnostics"), diagnostics .. divider .. "show_cursor_diagnostics" },
			},
			-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
			["[e"] = { cmd("Lspsaga diagnostic_jump_prev"), diagnostics .. divider .. "diagnostic_jump_prev" },
			-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
			["e]"] = { cmd("Lspsaga diagnostic_jump_next"), diagnostics .. divider .. "diagnostic_jump_next" },
		})
	end,
}

return { M }
