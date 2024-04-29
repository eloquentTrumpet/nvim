require("_common")

-- treesj
local M = {
	"Wansmer/treesj",
	-- keys = { "tm", "tj", "ts" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local treesj = require("treesj")
		treesj.setup({
			use_default_keymaps = false,
		})

		-- which-key
		local name = "treesj"
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			name = name,
			["t"] = {
				name = name,
				["m"] = { treesj.toggle, label("Toggle") },
				["j"] = { treesj.join, label("Join") },
				["s"] = { treesj.split, label("Split") },
			},
		}, { prefix = "<leader>" })
	end,
}

return { M }
