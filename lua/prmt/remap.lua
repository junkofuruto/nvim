vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex);
vim.keymap.set('n', '<leader>wc', ':quit<CR>');
vim.keymap.set('n', '<leader>wsh', ':split<CR>');
vim.keymap.set('n', '<leader>wsv', ':vsplit<CR>');
vim.keymap.set('n', '<leader>wl', '<C-w>h');
vim.keymap.set('n', '<leader>wu', '<C-w>j');
vim.keymap.set('n', '<leader>wd', '<C-w>k');
vim.keymap.set('n', '<leader>wr', '<C-w>l');

vim.keymap.set('i', '<C-d>', '<Esc>YpA');
vim.keymap.set('i', '<C-z>', '<Esc>uA');

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'Q', '<nop>') -- KILL YOURSELF

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

