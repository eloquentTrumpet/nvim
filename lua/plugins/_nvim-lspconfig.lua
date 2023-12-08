-- nvim-lspconfig

local M = {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    -- cmp-nvim-lsp has dependency to nvim-cmp
    'hrsh7th/nvim-cmp',
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    -- vsnip
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  },
  -- lazy = false,
  config = function()
    -- Setup language servers.
    local lspconfig = require('lspconfig')
    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local cmp_nvim_lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- typescript-language-server
    lspconfig.tsserver.setup {
      capabilities = cmp_nvim_lsp_capabilities,
    }

    -- vscode-eslint-language-server (hrsh7th/vscode-langservers-extracted)
    lspconfig.eslint.setup {
      capabilities = cmp_nvim_lsp_capabilities,
    }

    -- css-languageserver (hrsh7th/vscode-langservers-extracted)
    lspconfig.cssls.setup {
      capabilities = cmp_nvim_lsp_capabilities,
    }

    -- cssmodules_ls 
    -- npm install --global cssmodules-language-server
    lspconfig.cssmodules_ls.setup {
      capabilities = cmp_nvim_lsp_capabilities,
      on_attach = function (client)
        -- avoid accepting `definitionProvider` responses from this LSP
        client.server_capabilities.definitionProvider = false
        -- custom_on_attach(client)
      end,
    }

    -- luals/lua-language-server
    lspconfig.lua_ls.setup {
      capabilities = cmp_nvim_lsp_capabilities,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
          client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            }
          })

          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
      end
    }

    -- cmp
    local cmp = require('cmp')
    -- require('lspkind')
    cmp.setup({
      -- formatting = {
      --   format = lspkind.cmp_format({
      --     mode = 'symbol', -- show only symbol annotations
      --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      --     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      --
      --     -- The function below will be called before any actual modifications from lspkind
      --     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      --     before = function (entry, vim_item)
      --       -- ...
      --       return vim_item
      --     end
      --   })
      -- },
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
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
        ['<s-tab>'] = cmp.mapping.select_prev_item(),
        ['<tab>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ['<C-s>'] = cmp.mapping.complete({
        --   config = {
        --     sources = {
        --       { name = 'vsnip' }
        --     }
        --   }
        -- })
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
}

return { M }
