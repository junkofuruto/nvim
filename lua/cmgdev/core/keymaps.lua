vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-h>", ":wincmd h<CR>",
    { silent = true, noremap = true, desc = "[CMGDEV] Go to the left split window" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>",
    { silent = true, noremap = true, desc = "[CMGDEV] Go to the right split window" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>",
    { silent = true, noremap = true, desc = "[CMGDEV] Go to the upper split window" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>",
    { silent = true, noremap = true, desc = "[CMGDEV] Go to the down slpit window" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, noremap = true, desc = "[CMGDEV] Move selected down by 1" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, noremap = true, desc = "[CMGDEV] Move selected up by 1" })

vim.keymap.set("n", "J", "mzJ`z", { silent = true, noremap = true, desc = "[CMGDEV] Remove new lines from next line" })

vim.keymap.set("n", "n", "nzzzv", { silent = true, noremap = true, desc = "[CMGDEV] Next selection and center" })
vim.keymap.set("n", "N", "Nzzzv", { silent = true, noremap = true, desc = "[CMGDEV] Previous selection and center" })

vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true, desc = "[CMGDEV] Indent left" })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true, desc = "[CMGDEV] Indent right" })

vim.keymap.set("n", "Q", "<nop>", { silent = true, noremap = true, desc = "[CMGDEV] You dont need that lol" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { silent = true, noremap = true, desc = "[CMGDEV] Vertial split" })
vim.keymap.set("n", "<leader>sh", "<C-w>h", { silent = true, noremap = true, desc = "[CMGDEV] Horisontal split" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { silent = true, noremap = true, desc = "[CMGDEV] Make splits equal" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { silent = true, noremap = true, desc = "[CMGDEV] Close split" })

vim.api.nvim_set_keymap('n', '<C-b>', ':!tmux send-keys -t your-session-name C-b<CR>', { noremap = true, silent = true })
