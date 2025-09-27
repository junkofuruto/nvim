return {
    "nvim-mini/mini.trailspace",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local trailspace = require("mini.trailspace")

        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "*",
            callback = function()
                local buftype = vim.bo.buftype
                local filetype = vim.bo.filetype
                local filename = vim.fn.expand('%')

                if buftype == "" and
                    filetype ~= "netrw" and
                    filetype ~= "oil" and
                    filename ~= "" and
                    not vim.bo.readonly then
                    trailspace.trim()
                end
            end
        })
    end
}
