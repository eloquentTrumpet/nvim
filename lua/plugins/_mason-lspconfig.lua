-- mason-lspconfig

local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		-- dependencies for nvim-lspconfig
		"hrsh7th/cmp-nvim-lsp",
		-- cmp-nvim-lsp has dependency to nvim-cmp
		"hrsh7th/nvim-cmp",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		-- New stuff
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"hrsh7th/cmp-nvim-lua",
		-- vsnip
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",

		"https://gitlab.com/schrieveslaach/sonarlint.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()

		-- After setting up mason-lspconfig you may set up servers via lspconfig
		-- Setup language servers.
		local lspconfig = require("lspconfig")
		-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
		local cmp_nvim_lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- typescript-language-server
		lspconfig.tsserver.setup({
			capabilities = cmp_nvim_lsp_capabilities,
		})

		-- vscode-eslint-language-server (hrsh7th/vscode-langservers-extracted)
		lspconfig.eslint.setup({
			capabilities = cmp_nvim_lsp_capabilities,
		})

		-- css-languageserver (hrsh7th/vscode-langservers-extracted)
		lspconfig.cssls.setup({
			capabilities = cmp_nvim_lsp_capabilities,
		})

		-- cssmodules_ls
		-- npm install --global cssmodules-language-server
		lspconfig.cssmodules_ls.setup({
			capabilities = cmp_nvim_lsp_capabilities,
			on_attach = function(client)
				-- avoid accepting `definitionProvider` responses from this LSP
				client.server_capabilities.definitionProvider = false
				-- custom_on_attach(client)
			end,
		})

		-- luals/lua-language-server
		lspconfig.lua_ls.setup({
			capabilities = cmp_nvim_lsp_capabilities,
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
						Lua = {
							runtime = {
								-- Tell the language server which version of Lua you're using
								-- (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
									-- "${3rd}/luv/library"
									-- "${3rd}/busted/library",
								},
								-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
								-- library = vim.api.nvim_get_runtime_file("", true)
							},
						},
					})

					client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
				end
				return true
			end,
		})

		require("sonarlint").setup({
			server = {
				cmd = {
					"sonarlint-language-server",
					-- Ensure that sonarlint-language-server uses stdio channel
					"-stdio",
					"-analyzers",
					-- paths to the analyzers you need, using those for python and java in this example
					vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarcfamily.jar"),
					vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarjs.jar"),
					vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonartext.jar"),
				},
			},
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"python",
				"cpp",
				"java",
				"css",
				"scss",
				"tsx",
			},
		})

		-- cmp
		local cmp = require("cmp")
		-- require('lspkind')
		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<s-tab>"] = cmp.mapping.select_prev_item(),
				["<tab>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				-- ['<C-s>'] = cmp.mapping.complete({
				--   config = {
				--     sources = {
				--       { name = 'vsnip' }
				--     }
				--   }
				-- })
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "calc" },
				{ name = "nvim_lua" },
				{ name = "vsnip" }, -- For vsnip users.
				-- { name = 'luasnip' }, -- For luasnip users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
				-- { name = 'snippy' }, -- For snippy users.
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "nvim_lsp_document_symbol" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}

return { M }
