require("_common")

-- ChatGPT
local M = {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local cmd = "fish " .. vim.fn.expand("$HOME") .. "/dev/ChatGPT/"
		require("chatgpt").setup({
			-- api_host_cmd = 'echo -n ""',
			api_key_cmd = cmd .. "api_key.fish",
			api_type_cmd = cmd .. "api_type.fish",
			azure_api_base_cmd = cmd .. "azure_api_base.fish",
			azure_api_engine_cmd = cmd .. "azure_api_engine.fish",
			-- azure_api_version_cmd = "echo 2023-05-15",
			openai_params = {
				model = "gpt-3.5-turbo",
				frequency_penalty = 0,
				presence_penalty = 0,
				max_tokens = 4096,
				temperature = 0,
				top_p = 1,
				n = 1,
			},
		})

		-- which-key
		local name = "ChatGPT"
		local ChatGPTEditWithInstruction = "ChatGPTEditWithInstruction"
		local grammar_correction = "grammar_correction"
		local translate = "translate"
		local keywords = "keywords"
		local docstring = "docstring"
		local addTests = "add_tests"
		local optimizeCode = "optimize_code"
		local summerize = "summerize"
		local fixBugs = "fix_bugs"
		local explainCode = "explain_code"
		local roxygenEdit = "roxygen_edit"
		local code_readability_analysis = "code_readability_analysis"
		local chatGPTRun = CMD_FUNC("ChatGPTRun")
		local label = LABEL(name)
		local wk = require("which-key")
		wk.register({
			name = name,
			["C"] = {
				name = name,
				mode = { "n", "v" },
				["c"] = { CMD(name), label(name) },
				["C"] = { CMD("ChatGPTCompleteCode"), label("ChatGPTCompleteCode"), mode = { "n", "v" } },
				["e"] = { CMD(ChatGPTEditWithInstruction), label(ChatGPTEditWithInstruction), mode = { "n", "v" } },
				["g"] = { chatGPTRun(grammar_correction), label(grammar_correction), mode = { "n", "v" } },
				["t"] = { chatGPTRun(translate), label(translate), mode = { "n", "v" } },
				["k"] = { chatGPTRun(keywords), label(keywords), mode = { "n", "v" } },
				["d"] = { chatGPTRun(docstring), label(docstring), mode = { "n", "v" } },
				["a"] = { chatGPTRun(addTests), label(addTests), mode = { "n", "v" } },
				["o"] = { chatGPTRun(optimizeCode), label(optimizeCode), mode = { "n", "v" } },
				["s"] = { chatGPTRun(summerize), label(summerize), mode = { "n", "v" } },
				["f"] = { chatGPTRun(fixBugs), label(fixBugs), mode = { "n", "v" } },
				["x"] = { chatGPTRun(explainCode), label(explainCode), mode = { "n", "v" } },
				["r"] = { chatGPTRun(roxygenEdit), label(roxygenEdit), mode = { "n", "v" } },
				["l"] = { chatGPTRun(code_readability_analysis), label(code_readability_analysis), mode = { "n", "v" } },
				["A"] = { CMD("ChatGPTActAs"), label("ChatGPTActAs"), mode = { "n", "v" } },
			},
		}, { prefix = "<leader>" })
	end,
}

return { M }
