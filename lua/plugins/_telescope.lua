-- telescope

local M = {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  -- or                          , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-tree/nvim-web-devicons',
    -- Key bindings
    'folke/which-key.nvim',
  },
  -- lazy = false,
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

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

    -- To get telescope-file-browser loaded and working with telescope,
    -- you need to call load_extension, somewhere after setup function:
    telescope.load_extension('file_browser')

    -- which-key
    local wk = require('which-key')
    local prefix = 'tlscp   '
    wk.register({
      [';'] = {
        name = 'telescope',
        ['f'] = { builtin.find_files, prefix .. 'find_files' },
        ['F'] = { telescope.extensions.file_browser.file_browser, prefix .. 'file_browser' },
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
    })
  end,
}

return { M }
