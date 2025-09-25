local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>pe", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pf", telescope.find_files, { })
vim.keymap.set("n", "<leader>pg", telescope.git_files, { })
vim.keymap.set("n", "<leader>pd", telescope.lsp_workspace_symbols, { })
vim.keymap.set("n", "<leader>fd", telescope.lsp_document_symbols, { })

vim.keymap.set("n", "<C-h", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l", ":wincmd l<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set("n", "C-d", "<C-d>zz")
vim.keymap.set("n", "C-u", "<C-u>zz")

vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
