vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.hlsearch = false;
vim.opt.scrolloff = 22;

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.keymap.set('n', '<leader>t', ':tabnew<CR>')
vim.keymap.set('n', '<C-Tab>', ':tabnext')
vim.keymap.set('n', '<C-S-Tab>', ':tabprevious')

