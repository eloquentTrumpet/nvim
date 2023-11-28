-- Config for neo-tree

local M = {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information

    -- Key bindings
    'folke/which-key.nvim',
  },
  config = function()
    local wk = require('which-key')
    local prefix = 'neo-tree : ';
    wk.register({
      t = { '<CMD>Neotree left toggle<CR>', prefix .. "Neo-tree left" },  -- create a binding with label
      f = { '<CMD>Neotree float toggle<CR>', prefix .. "Neo-tree float" }, -- additional options for creating the keymap
    }, { prefix = "<leader>" })
  end,
}

return { M }
