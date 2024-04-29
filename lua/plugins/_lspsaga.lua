require("_common")

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

		-- which-key
		local name = "Lspsaga"
		local finderImp = "finder imp"
		local finderRef = "finder ref"
		local code_action = "code_action"
		local rename = "rename"
		local rename_project = "rename ++project"
		local peek_definition = "peek_definition"
		local goto_definition = "goto_definition"
		local peek_type_definition = "peek_type_definition"
		local goto_type_definition = "goto_type_definition"
		local hover_doc = "hover_doc"
		local outline = "outline"
		local incoming_calls = "incoming_calls"
		local outgoing_calls = "outgoing_calls"
		local lspSaga = CMD_FUNC(name)
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			[","] = {
				name = name,
				["h"] = { lspSaga("finder"), label("finder") },
				["H"] = {
					name = label("finder"),
					["i"] = { lspSaga(finderImp), label(finderImp) },
					["r"] = { lspSaga(finderRef), label(finderRef) },
				},
				["a"] = { lspSaga(code_action), label(code_action) },
				["r"] = { lspSaga(rename), label(rename) },
				["R"] = { lspSaga(rename_project), label(rename_project) },
				["p"] = { lspSaga(peek_definition), label(peek_definition) },
				["d"] = { lspSaga(goto_definition), label(goto_definition) },
				["t"] = { lspSaga(peek_type_definition), label(peek_type_definition) },
				["T"] = { lspSaga(goto_type_definition), label(goto_type_definition) },
				["K"] = { lspSaga(hover_doc), label(hover_doc) },
				["o"] = { lspSaga(outline), label(outline) },
				["c"] = {
					name = label("Callhierarchy"),
					["i"] = { lspSaga(incoming_calls), label(incoming_calls) },
					["o"] = { lspSaga(outgoing_calls), label(outgoing_calls) },
				},
			},
			-- },
		})

		local show_line_diagnostics = "show_line_diagnostics"
		local show_buf_diagnostics = "show_buf_diagnostics"
		local show_workspace_diagnostics = "show_workspace_diagnostics"
		local show_cursor_diagnostics = "show_cursor_diagnostics"
		local diagnostic_jump_prev = "diagnostic_jump_prev"
		local diagnostic_jump_next = "diagnostic_jump_next"
		wk.register({
			["s"] = {
				name = label("Diagnostics"),
				["l"] = { lspSaga(show_line_diagnostics), label(show_line_diagnostics) },
				["b"] = { lspSaga(show_buf_diagnostics), label(show_buf_diagnostics) },
				["w"] = { lspSaga(show_workspace_diagnostics), label(show_workspace_diagnostics) },
				["c"] = { lspSaga(show_cursor_diagnostics), label(show_cursor_diagnostics) },
			},
			["[e"] = { lspSaga(diagnostic_jump_prev), label(diagnostic_jump_prev) },
			["e]"] = { lspSaga(diagnostic_jump_next), label(diagnostic_jump_next) },
		})
	end,
}

return { M }
