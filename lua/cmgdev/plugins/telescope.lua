vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
}, { confirm = false })

local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>fd", telescope.lsp_document_symbols, { desc = "[CMGDEV] Show File Definitions" })
