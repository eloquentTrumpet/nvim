-- telescope

local M = {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  -- or                          , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Key bindings
    'folke/which-key.nvim',
  },
  -- lazy = false,
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    -- local function telescope_buffer_dir()
    --   return vim.fn.expand('%:p:h')
    -- end

    telescope.setup {
      defaults = {
        initial_mode = 'normal',
        mappings = {
          ['n'] = {
            ['q'] = actions.close,
            ['c'] = actions.delete_buffer
          },
        },
      },
    }

    -- which-key
    local wk = require('which-key')
    local prefix = 'telescope : '
    wk.register({
      [';'] = {
        name = 'telescope',
        ['f'] = { builtin.find_files, prefix .. 'find_files' },
        ['r'] = { builtin.live_grep, prefix .. 'live_grep' },
        [';'] = { builtin.resume, prefix .. 'resume' },
        ['e'] = { builtin.diagnostics, prefix .. 'diagnostics' },
        ['b'] = { builtin.buffers, prefix .. 'buffers' },
        ['B'] = { builtin.builtin, prefix .. 'builtin' },
        ['i'] = { builtin.lsp_incoming_calls, prefix .. 'lsp_incoming_calls' },
        ['o'] = { builtin.lsp_outgoing_calls, prefix .. 'lsp_outgoing_calls' },
        ['d'] = { builtin.lsp_definitions, prefix .. 'lsp_definitions' },
        ['k'] = { builtin.lsp_references, prefix .. 'lsp_references' },
        ['t'] = { builtin.lsp_type_definitions, prefix .. 'lsp_type_definitions' },
        ['g'] = { builtin.lsp_implementations, prefix .. 'lsp_implementations' },
        ['c'] = { actions.delete_buffer, prefix .. 'delete_buffer'}
      },
      -- ['s'] = {
      --   name = 'telescope file_browser',
      --   ['f'] = { file_browser, prefix .. 'file_browser'}
      -- }
    })
  end,
}

return { M }
