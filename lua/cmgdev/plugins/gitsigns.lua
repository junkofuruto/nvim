return {
    "lewis6991/gitsigns.nvim",
    config = function() 
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '-' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            signs_staged = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '-' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            numhl = true,
            linehl = false,
            word_diff = false,
            signs_staged_enable = true,
            attach_to_untracked = false,
            current_line_blame = false,
            max_file_length = 40000
        })
    end
}
