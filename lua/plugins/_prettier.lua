-- prettier

local M = {
  'MunifTanjim/prettier.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
  },
  opts = {
    bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
    filetypes = {
      'lua',
      'css',
      'graphql',
      'html',
      'javascript',
      'javascriptreact',
      'json',
      'less',
      'markdown',
      'scss',
      'typescript',
      'typescriptreact',
      'yaml',
      'tsx',
    },
  }
}

return { M }
