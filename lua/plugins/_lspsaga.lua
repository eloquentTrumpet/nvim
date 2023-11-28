-- lspsaga


local M = {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    -- Key bindings
    'folke/which-key.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('nvim-treesitter')
    require('lspsaga').setup({})

    local keymap = vim.keymap.set
    -- Diagnostic jump with filters such as only jumping to an error
    keymap('n', '[E', function()
      require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
    keymap('n', ']E', function()
      require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)
    -- Hover Doc
    -- If there is no hover doc,
    -- there will be a notification stating that
    -- there is no information available.
    -- To disable it just use ":Lspsaga hover_doc ++quiet"
    -- Pressing the key twice will enter the hover window
    keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
    local divider = ' : ';
    local lspsaga = 'Lspsaga'
    local diagnostics = 'Diagnostics';
    local outline = 'Outline';
    local callhierarchy = 'Callhierarchy';

    local wk = require('which-key')

    wk.register({
      ['g'] = {
        name = lspsaga,
        -- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
        ['h'] = { '<cmd>Lspsaga finder<CR>', lspsaga .. divider .. 'finder' },
        -- keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
        ['a'] = { '<cmd>Lspsaga code_action<CR>', lspsaga .. divider ..'code_action' },
        -- keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
        ['r'] = { '<cmd>Lspsaga rename<CR>', lspsaga .. divider .. 'rename' },
        -- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
        ['R'] = { '<cmd>Lspsaga rename ++project<CR>', lspsaga .. divider .. 'rename ++project' },
        -- keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
        ['p'] = { '<cmd>Lspsaga peek_definition<CR>', lspsaga .. divider .. 'peek_definition' },
        -- keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
        ['d'] = { '<cmd>Lspsaga goto_definition<CR>', lspsaga .. divider .. 'goto_definition' },
        -- keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
        ['t'] = { '<cmd>Lspsaga peek_type_definition<CR>', lspsaga .. divider .. 'peek_type_definition' },
        -- keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")
        ['T'] = { '<cmd>Lspsaga goto_type_definition<CR>', lspsaga .. divider .. 'goto_type_definition' },
      },
    })

    wk.register({
      ['s'] = {
        name = lspsaga .. divider .. diagnostics,
        -- keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
        ['l'] = { '<cmd>Lspsaga show_line_diagnostics<CR>', diagnostics .. divider .. 'show_line_diagnostics' },
        -- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
        ['b'] = { '<cmd>Lspsaga show_buf_diagnostics<CR>', diagnostics .. divider .. 'show_buf_diagnostics' },
        -- keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
        ['w'] = { '<cmd>Lspsaga show_workspace_diagnostics<CR>', diagnostics .. divider .. 'show_workspace_diagnostics' },
        -- keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
        ['c'] = { '<cmd>Lspsaga show_cursor_diagnostics<CR>', diagnostics .. divider .. 'show_cursor_diagnostics' },
      },
      -- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
      ['[e'] = { '<cmd>Lspsaga diagnostic_jump_prev<CR>', diagnostics .. divider .. 'diagnostic_jump_prev' },
      -- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
      ['e]'] = { '<cmd>Lspsaga diagnostic_jump_next<CR>', diagnostics .. divider .. 'diagnostic_jump_next' },
    })

    wk.register({
      -- keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")
      ['<leader>'] = {
        ['o'] = { '<cmd>Lspsaga outline<CR>', lspsaga .. divider .. outline },
        name = lspsaga .. divider .. outline,
      },
    })

    wk.register({
      ['<leader>'] = {
        ['c'] = {
          name = lspsaga .. divider .. callhierarchy,
          -- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
          ['i'] = { '<cmd>Lspsaga incoming_calls<CR>', callhierarchy .. divider .. 'incoming_calls' },
          -- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
          ['o'] = { '<cmd>Lspsaga outgoing_calls<CR>', callhierarchy .. divider .. 'outgoing_calls' }
        }
      }
    })
  end,
}

return { M }
