vim.pack.add({
    "https://github.com/mbbill/undotree",
}, { confirm = false })

vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "[CMGDEV] Toggle Undotree" })
