return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        image = { enabled = false },
        quickfile = {
            enabled = true,
            exclude = { "latex" }
        },
        picker = {
            enabled = true,
            matchers = {
                fuzzy = true,
                ignorecase = true,
                smartcase = true,
                frecency = true,
                cwd_bonus = true
            },
            formatters = {
                file = {
                    filename_first = true
                }
            },
            layout = {
                preset = "telescope",
                cycle = false
            }
        },
        dashboard = {
            enabled = true,
            sections = {
                {
                    section = "terminal",
                    cmd = "aic /home/prmt/.config/nvim/assets/header.jpg -C -c -d 75,50",
                    height = 50,
                    width = 75,
                    random = false,
                }
            }
        }
    },
    keys = {
        { "<leader>gl", function() require("snacks").lazygit.log() end,                      desc = "[CMGDEV] Git Log" },
        { "<leader>gs", function() require("snacks").picker.git_status() end,                desc = "[CMGDEV] Git Status" },
        { "<leader>gb", function() require("snacks").picker.git_branches() end,              desc = "[CMGDEV] Select and Switch Git Branches" },
        { "<leader>pf", function() require("snacks").picker.files() end,                     desc = "[CMGDEV] Treesitter Find File" },
        { "<leader>pg", function() require("snacks").picker.grep() end,                      desc = "[CMGDEV] Grep Word" },
        { "<leader>pt", function() require("snacks").picker.todo_comments() end,             desc = "[CMGDEV] Find all TODO statements" },
        { "<leader>km", function() require("snacks").picker.keymaps({ layout = "ivy" }) end, desc = "[CMGDEV] Search Keymaps" }
    }
}
