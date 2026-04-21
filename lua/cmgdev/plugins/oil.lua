vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/refractalize/oil-git-status.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
}, { confirm = false })

local oil = require("oil")
local oilgit = require("oil-git-status")

oil.setup({
    default_file_explorer = true,
    delete_to_trash = true,
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime"
    },
    view_options = {
        show_hidden = true
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

oilgit.setup({
    win_options = {
        signcolumn = "yes:2",
    }
})

vim.keymap.set("n", "<leader>pe", oil.open, { desc = "[CMGDEV] Open File Explorer" })
