-- indent-blankline

local M = {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    local highlight = {
      'indentBlanklineScopeColor',
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "indentBlanklineScopeColor", { fg = "#830d15" })
    end)

    require('ibl').setup { 
      scope = {
        show_start = false,
        show_end = false,
        highlight = highlight,
      },
      indent = {
        char = '│',
      },
    }
  end
}

return { M }
