return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require("telescope.builtin")

        vim.keymap.set("n", "<leader>fd", telescope.lsp_document_symbols, { desc = "[CMGDEV] Show File Definitions" })
    end
}
