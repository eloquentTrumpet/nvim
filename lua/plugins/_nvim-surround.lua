require("_common")

local M = {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		-- keymaps = {
		--     insert = "<C-g>s",         -- <Plug>(nvim-surround-insert)
		--     insert_line = "<C-g>S",    -- <Plug>(nvim-surround-insert-line)
		--     normal = "ys",             -- <Plug>(nvim-surround-normal)
		--     normal_cur = "yss",        -- <Plug>(nvim-surround-normal-cur)
		--     normal_line = "yS",        -- <Plug>(nvim-surround-normal-line)
		--     normal_cur_line = "ySS",   -- <Plug>(nvim-surround-normal-cur-line)
		--     visual = "S",              -- <Plug>(nvim-surround-visual)
		--     visual_line = "gS",        -- <Plug>(nvim-surround-visual-line)
		--     delete = "ds",             -- <Plug>(nvim-surround-delete)
		--     change = "cs",             -- <Plug>(nvim-surround-change)
		--     change_line = "cS",        -- <Plug>(nvim-surround-change-line)
		-- },
		require("nvim-surround").setup({
			keymaps = {
				insert = false,
				insert_line = false,
				normal = false,
				normal_cur = false,
				normal_line = false,
				normal_cur_line = false,
				visual = false,
				visual_line = false,
				delete = false,
				change = false,
				change_line = false,
			},
		})

		local name = "surround"
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			mode = { "n" },
			name = name,
			["s"] = { "<Plug>(nvim-surround-normal)", label("normal") },
			["S"] = { "<Plug>(nvim-surround-normal-line)", label("normal_line") },
			["d"] = { "<Plug>(nvim-surround-delete)", label("delete") },
			["c"] = { "<Plug>(nvim-surround-change)", label("change") },
			["C"] = { "<Plug>(nvim-surround-change-line)", label("change_line") },
		}, { prefix = "s" })

		wk.register({
			mode = { "i" },
			name = "surround",
			["s"] = { "<Plug>(nvim-surround-insert)", label("insert") },
			["S"] = { "<Plug>(nvim-surround-insert-line)", label("insert_line") },
		}, { prefix = "<C-g>" })

		wk.register({
			mode = { "v" },
			name = "surround",
			["s"] = { "<Plug>(nvim-surround-visual)", label("visual") },
			["S"] = { "<Plug>(nvim-surround-visual-line)", label("visual_line") },
		}, { prefix = "s" })
	end,
}

return { M }
