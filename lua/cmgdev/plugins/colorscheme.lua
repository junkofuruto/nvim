return {
    {
        "Shatur/neovim-ayu",
        name = "ayu",
        config = function()
            require("ayu").setup({
                overrides = {
                    Comment = { italic = false },
                }
            })

            vim.cmd.colorscheme("ayu-dark")

            vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
            vim.api.nvim_set_hl(0, "ColorColumn", { bg = "None" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "None" })
            vim.api.nvim_set_hl(0, "Folded", { bg = "None" })
            vim.api.nvim_set_hl(0, "FoldColumn", { bg = "None" })
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "None" })
            vim.api.nvim_set_hl(0, "CursorColumn", { bg = "None" })
            vim.api.nvim_set_hl(0, "VertSplit", { bg = "None" })
        end
    }
}
