local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
	-- stylua: ignore
	-- keys = {
	--   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	--   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	--   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	--   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	--   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	-- },
  config = function ()
    local name = "flash"
    local label = LABEL(name)
    local wk = require("which-key")
    wk.register({
      name = name,
      ["s"] = {
      name = name,
        ["s"] = { function() require("flash").jump() end, label("jump"), mode = {"n", "x", "o"}},
        ["S"] = { function() require("flash").treesitter() end, label("treesitter"), mode = {"n", "x", "o"}},
        ["r"] = { function() require("flash").remote() end, label("remote"), mode = {"o"}},
        ["R"] = { function() require("flash").treesitter_search() end, label("treesitter_search"), mode = {"x", "o"}},
        ["t"] = { function() require("flash").toggle() end, label("toggle"), mode = {"n", "x", "o"}},
      },
    }, {prefix = "<leader>"})
  end
,
}

return { M }
