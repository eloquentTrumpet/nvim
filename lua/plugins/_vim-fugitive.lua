-- fugitive

local M = {
  'tpope/vim-fugitive',
  dependencies = {
    -- Key bindings
    'folke/which-key.nvim',
  },
  config = function()
    -- which-key
    local wk = require('which-key')
    local prefix = 'fugitive -> '
    wk.register({
      g = {
        name = 'fugitive (Git)',                   -- optional group name
        b = { '<CMD>Git blame<CR>', prefix .. 'Git blame' }, -- create a binding with label
        d = { '<CMD>Git blame<CR>', prefix .. 'Git diff' },   -- create a binding with label
        l = { '<CMD>Git blame<CR>', prefix .. 'Git log' },     -- create a binding with label
      },
    }, { prefix = '<leader>' })
  end,
}

return { M }
