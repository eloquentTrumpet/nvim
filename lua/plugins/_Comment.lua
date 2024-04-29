require("_common")

-- Comment
local default_config = {
	---Add a space b/w comment and the line
	padding = true,
	---Whether the cursor should stay at its position
	sticky = true,
	---Lines to be ignored while (un)comment
	ignore = nil,
	---LHS of toggle mappings in NORMAL mode
	-- toggler = {
	---Line-comment toggle keymap
	-- line = "<leader>cc",
	---Block-comment toggle keymap
	-- block = "<leader>bc",
	-- },
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	-- opleader = {
	---Line-comment keymap
	-- line = "<leader>c",
	---Block-comment keymap
	-- block = "<leader>b",
	-- },
	---LHS of extra mappings
	-- extra = {
	---Add comment on the line above
	-- above = "<leader>cO",
	---Add comment on the line below
	-- below = "<leader>co",
	---Add comment at the end of line
	-- eol = "<leader>cA",
	-- },
	---Enable keybindings
	---NOTE: If given `false` then the plugin won't create any mappings
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = false,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = false,
	},
	---Function to call before (un)comment
	pre_hook = nil,
	---Function to call after (un)comment
	post_hook = nil,
}

local M = {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	-- lazy = false,
	config = function()
		default_config.pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
		require("Comment").setup(default_config)

		-- which-key
		local name = "Comment"
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			["c"] = {
				name = name,
				["c"] = { "<Plug>(comment_toggle_linewise_current)", label("toggle linewise"), mode = { "n" } },
			},
		}, { prefix = "<leader>" })
		wk.register({
			["c"] = {
				name = name,
				mode = { "n", "v" },
				["c"] = { "<Plug>(comment_toggle_linewise_visual)", label("toggle linewise"), mode = { "x" } },
			},
		}, { prefix = "<leader>", mode = { "n" } })
	end,
}

return { M }
