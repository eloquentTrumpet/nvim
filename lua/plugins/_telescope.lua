require("_common")

-- telescope
local M = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	-- or                          , branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-tree/nvim-web-devicons",
		"debugloop/telescope-undo.nvim",
		-- Key bindings
		"folke/which-key.nvim",
	},
	-- lazy = false,
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				initial_mode = "normal",
				mappings = {
					["n"] = {
						["q"] = actions.close,
						["D"] = actions.delete_buffer,
					},
				},
			},
		})

		-- To get telescope-file-browser loaded and working with telescope,
		-- you need to call load_extension, somewhere after setup function:
		telescope.load_extension("file_browser")

		telescope.load_extension("undo")

		-- which-key
		local name = "telescope"
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			name = name,
			[";"] = {
				name = "telescope",
				["f"] = { builtin.find_files, label("find_files") },
				["F"] = { telescope.extensions.file_browser.file_browser, label("file_browser") },
				["r"] = { builtin.live_grep, label("live_grep") },
				[";"] = { builtin.resume, label("resume") },
				["e"] = { builtin.diagnostics, label("diagnostics") },
				["b"] = { builtin.buffers, label("buffers") },
				["B"] = { builtin.builtin, label("builtin") },
				["i"] = { builtin.lsp_incoming_calls, label("lsp_incoming_calls") },
				["o"] = { builtin.lsp_outgoing_calls, label("lsp_outgoing_calls") },
				["d"] = { builtin.lsp_definitions, label("lsp_definitions") },
				["k"] = { builtin.lsp_references, label("lsp_references") },
				["t"] = { builtin.lsp_type_definitions, label("lsp_type_definitions") },
				["g"] = { builtin.lsp_implementations, label("lsp_implementations") },
				["c"] = { actions.delete_buffer, label("delete_buffer") },
			},
		})
	end,
}

return { M }
