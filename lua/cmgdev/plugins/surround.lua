vim.pack.add({
    "https://github.com/nvim-mini/mini.surround"
}, { confirm = false })

require("mini.surround").setup({
    custom_surroundings = nil,
    highlight_duration = 300,
    mappings = {
        add = 'sa', 
        delete = 'sd', 
        replace = 'sr', 
    },
    respect_selection_type = false,
    search_method = 'cover',
    silent = false
})
