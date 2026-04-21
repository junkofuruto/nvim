vim.pack.add({
    "https://github.com/f-person/git-blame.nvim",
}, { confirm = false })

require("gitblame").setup({
    enabled = true,
    date_format = "%r",
    message_template = "<author> <date> > <summary>",

    highlight_group = "GitBlame",          
    show_in_visual = false,                
})
