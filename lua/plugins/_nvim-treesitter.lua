-- nvim-treesitter

local M = {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = function()
      require('nvim-treesitter.install').update({ with_sync = true })()
  end,
  opts = {
    ensure_installed = {
      'lua',
      'javascript',
      'typescript',
      'tsx',
      'html',
      'css',
      'scss',
      'json',
      'regex',
      'markdown',
      'markdown_inline',
      'git_config',
      'git_rebase',
      'gitignore',
      'fish',
      'c',
      'vim',
      'vimdoc',
      'query',
      'toml',
      'php',
      'yaml',
      'swift',
    },
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = true,
      disable = {},
    },
    autotag = {
      enable = true,
    }
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
      },
    }
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    -- parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
    parser_config.tsx.filetype_to_parsername = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
  end
}

return { M }
