vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8';
vim.opt.encoding = 'utf-8';
vim.opt.fileencoding = 'utf-8';

vim.opt.list = true
vim.opt.listchars = {
  eol = '↵',
  space = '·',
  tab = '│·',
  trail = '✚',
  extends = '◀',
  precedes = '▶'
}

vim.opt.backup = false;
vim.opt.showcmd = true;
vim.opt.cmdheight = 1;
vim.opt.laststatus = 2;
vim.opt.shell = 'fish';
vim.opt.inccommand = 'split';
vim.opt.ignorecase = true;
vim.opt.smarttab = true;
vim.opt.breakindent = true;
vim.opt.ai = true; -- Auto indent
vim.opt.si = true; -- Smart indent
vim.opt.wrap = true; -- No wrap lines
vim.opt.backspace = 'start,eol,indent';
vim.opt.path:append { '**' }; -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- Set leader key
vim.g.mapleader = ' ';

vim.opt.guicursor = '';

vim.opt.nu = true;
vim.opt.relativenumber = true;

vim.opt.autoindent = true;

vim.opt.title = true;

-- Set highlight search
vim.opt.hlsearch = true;

vim.opt.tabstop = 2;
vim.opt.softtabstop = 2;
vim.opt.shiftwidth = 2;
vim.opt.expandtab = true;

vim.opt.smartindent = true;

-- Set max code length line
vim.opt.colorcolumn = '120';

vim.opt.cursorline = true;

vim.opt.scrolloff = 8;


print('Loaded ~/.config/nvim/lua/_config.lua');
