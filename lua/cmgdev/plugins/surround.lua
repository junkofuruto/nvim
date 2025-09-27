return {
    "nvim-mini/mini.surround",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
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
    }
}
