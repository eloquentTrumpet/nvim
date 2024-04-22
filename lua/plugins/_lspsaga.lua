-- lspsaga
local default_config = {
	ui = {
		border = "rounded",
		devicon = true,
		foldericon = true,
		title = true,
		expand = "⊞",
		collapse = "⊟",
		code_action = "💡",
		actionfix = " ",
		lines = { "┗", "┣", "┃", "━", "┏" },
		kind = nil,
		imp_sign = "󰳛 ",
	},
	hover = {
		max_width = 0.9,
		max_height = 0.8,
		open_link = "gx",
		open_cmd = "!chrome",
	},
	diagnostic = {
		show_code_action = true,
		show_layout = "float",
		show_normal_height = 10,
		jump_num_shortcut = true,
		max_width = 0.8,
		max_height = 0.6,
		max_show_width = 0.9,
		max_show_height = 0.6,
		text_hl_follow = true,
		border_follow = true,
		extend_relatedInformation = false,
		diagnostic_only_current = false,
		keys = {
			exec_action = "o",
			quit = "q",
			toggle_or_jump = "<CR>",
			quit_in_show = { "q", "<ESC>" },
		},
	},
	code_action = {
		num_shortcut = true,
		show_server_name = false,
		extend_gitsigns = false,
		only_in_cursor = true,
		max_height = 0.3,
		keys = {
			quit = "q",
			exec = "<CR>",
		},
	},
	lightbulb = {
		enable = true,
		-- sign = true,
		sign = false,
		debounce = 10,
		sign_priority = 40,
		virtual_text = true,
		enable_in_insert = true,
	},
	scroll_preview = {
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	request_timeout = 2000,
	finder = {
		max_height = 0.5,
		left_width = 0.4,
		methods = {},
		default = "ref+imp",
		layout = "float",
		silent = false,
		filter = {},
		fname_sub = nil,
		sp_inexist = false,
		sp_global = false,
		ly_botright = false,
		keys = {
			shuttle = "[w",
			toggle_or_open = "o",
			vsplit = "s",
			split = "i",
			tabe = "t",
			tabnew = "r",
			quit = "q",
			close = "<C-c>k",
		},
	},
	definition = {
		width = 0.6,
		height = 0.5,
		save_pos = false,
		keys = {
			edit = "<C-c>o",
			vsplit = "<C-c>v",
			split = "<C-c>i",
			tabe = "<C-c>t",
			tabnew = "<C-c>n",
			quit = "q",
			close = "<C-c>k",
		},
	},
	rename = {
		in_select = true,
		auto_save = false,
		project_max_width = 0.5,
		project_max_height = 0.5,
		keys = {
			quit = "<C-k>",
			exec = "<CR>",
			select = "x",
		},
	},
	symbol_in_winbar = {
		enable = true,
		separator = " › ",
		hide_keyword = false,
		ignore_patterns = nil,
		show_file = true,
		folder_level = 1,
		color_mode = true,
		dely = 300,
	},
	outline = {
		win_position = "right",
		win_width = 30,
		auto_preview = true,
		detail = true,
		auto_close = true,
		close_after_jump = false,
		layout = "normal",
		max_height = 0.5,
		left_width = 0.3,
		keys = {
			toggle_or_jump = "o",
			quit = "q",
			jump = "e",
		},
	},
	callhierarchy = {
		layout = "float",
		left_width = 0.2,
		keys = {
			edit = "e",
			vsplit = "s",
			split = "i",
			tabe = "t",
			close = "<C-c>k",
			quit = "q",
			shuttle = "[w",
			toggle_or_req = "u",
		},
	},
	implement = {
		enable = false,
		sign = true,
		lang = {},
		virtual_text = true,
		priority = 100,
	},
	-- beacon = {
	--   enable = true,
	--   frequency = 7,
	-- },
	-- floaterm = {
	--   height = 0.7,
	--   width = 0.7,
	-- },
}

local M = {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		-- Key bindings
		"folke/which-key.nvim",
		-- 'nvim-treesitter/nvim-treesitter',
	},
	config = function()
		require("nvim-treesitter")
		require("lspsaga").setup(default_config)

		local keymap = vim.keymap.set
		-- Diagnostic jump with filters such as only jumping to an error
		keymap("n", "[E", function()
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end)
		keymap("n", "]E", function()
			require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end)

		local divider = " : "
		local lspsaga = "Lspsaga"
		local finder = "finder"
		local diagnostics = "Diagnostics"
		local outline = "Outline"
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

		wk.register({
			-- keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")
			["<leader>"] = {
				["o"] = { cmd("Lspsaga outline"), lspsaga .. divider .. outline },
				name = lspsaga .. divider .. outline,
			},
		})

		wk.register({
			["<leader>"] = {
				["c"] = {
					name = lspsaga .. divider .. callhierarchy,
					-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
					["i"] = { cmd("Lspsaga incoming_calls"), callhierarchy .. divider .. "incoming_calls" },
					-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
					["o"] = { cmd("Lspsaga outgoing_calls"), callhierarchy .. divider .. "outgoing_calls" },
				},
			},
		})
	end,
}

return { M }
