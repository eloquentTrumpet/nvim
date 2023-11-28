-- undotree

local M = {
  'mbbill/undotree',
  dependencies = {
    -- Key bindings
    'folke/which-key.nvim',
  },
  config = function()
    local wk = require('which-key')
    wk.register({
      u = { '<CMD>UndotreeToggle<CR>', 'undotree' }, -- create a binding with label
    }, { prefix = '<leader>' })
  end,
}

return { M }
