vim.pack.add({
    "https://github.com/folke/snacks.nvim"
}, { confirm = false })

require("snacks").setup({
    image = { enabled = false },

    quickfile = {
        enabled = true,
        exclude = { "latex" },
    },

    picker = {
        enabled = true,
        matchers = {
            fuzzy = true,
            ignorecase = true,
            smartcase = true,
            frecency = true,
            cwd_bonus = true,
        },
        formatters = {
            file = {
                filename_first = true,
            },
        },
        layout = {
            preset = "telescope",
            cycle = false,
        },
    },
})

vim.keymap.set("n", "<leader>gl", function() require("snacks").lazygit.log() end, { desc = "[CMGDEV] Git Log" })
vim.keymap.set("n", "<leader>gs", function() require("snacks").picker.git_status() end, { desc = "[CMGDEV] Git Status" })
vim.keymap.set("n", "<leader>gb", function() require("snacks").picker.git_branches() end, { desc = "[CMGDEV] Select and Switch Git Branches" })
vim.keymap.set("n", "<leader>pf", function() require("snacks").picker.files({ hidden = true }) end, { desc = "[CMGDEV] Treesitter Find File" })
vim.keymap.set("n", "<leader>pg", function() require("snacks").picker.grep() end, { desc = "[CMGDEV] Grep Word" })
vim.keymap.set("n", "<leader>pt", function() require("snacks").picker.todo_comments() end, { desc = "[CMGDEV] Find all TODO statements" })
vim.keymap.set("n", "<leader>km", function() require("snacks").picker.keymaps({ layout = "ivy" }) end, { desc = "[CMGDEV] Search Keymaps" })
