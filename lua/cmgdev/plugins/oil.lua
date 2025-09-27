return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require("oil")

        oil.setup({
            default_file_explorer = true,
            delete_to_trash = true,
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime"
            },
            win_options = {
                wrap = true,
                signcolumn = "yes:2"
            },
            keymaps = {
                ["<C-h>"] = false,
                ["<C-c>"] = false,
                ["q"] = "actions.close"
            }
        })

        vim.keymap.set("n", "<leader>pe", oil.open, { desc = "[CMGDEV] Open File Explorer" })
    end
}
