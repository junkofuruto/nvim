return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "nvim-treesitter/nvim-treesitter",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
        "saadparwaiz1/cmp_luasnip",
        "roobert/tailwindcss-colorizer-cmp.nvim"
    },
    config = function()
        local _, luasnip = pcall(require, "luasnip")
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local colorizer = require("tailwindcss-colorizer-cmp").formatter

        local lsp_kinds = {
            Class = " ",
            Color = " ",
            Constant = " ",
            Constructor = " ",
            Enum = " ",
            EnumMember = " ",
            Event = " ",
            Field = " ",
            File = " ",
            Folder = " ",
            Function = " ",
            Interface = " ",
            Keyword = " ",
            Method = " ",
            Module = " ",
            Operator = " ",
            Property = " ",
            Reference = " ",
            Snippet = " ",
            Struct = " ",
            Text = " ",
            TypeParameter = " ",
            Unit = " ",
            Value = " ",
            Variable = " ",
        }

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = { completeopt = "menu,menuone,noinsert" },
            snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
            window = {
                documentation = { border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"} },
                completion = { border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"} }
            },
            sources = cmp.config.sources({
                { name = "luasnip" },
                { name = "lazydev" },
                { name = "nvim_lsp"},
                { name = "buffer" },
                { name = "path" },
                { name = "spell",
                option = {
                    enable_in_context = function()
                        local ft = vim.bo.filetype
                        return ft == "markdown" or ft == "text"
                    end,
                },
            },
        }),
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = string.format("%s %s", lsp_kinds[vim_item.kind] or "", vim_item.kind)
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[LaTeX]",
                })[entry.source.name]
                vim_item = lspkind.cmp_format({
                    maxwidth = 25,
                    ellipsis_char = "...",
                })(entry, vim_item)

                if entry.source.name == "nvim_lsp" then
                    vim_item = colorizer(entry, vim_item)
                end

                return vim_item
            end
        },
        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-f>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
        },
    })

    vim.keymap.set("i", "<C-u>", function() end, { desc = "[CMGDEV] NVIM CMP Scroll Docs Up", noremap = true, silent = true })
    vim.keymap.set("i", "<C-d>", function() end, { desc = "[CMGDEV] NVIM CMP Scroll Docs Down", noremap = true, silent = true })
    vim.keymap.set("i", "<C-n>", function() end, { desc = "[CMGDEV] NVIM CMP Select Next Item", noremap = true, silent = true })
    vim.keymap.set("i", "<C-p>", function() end, { desc = "[CMGDEV] NVIM CMP Select Previous Item", noremap = true, silent = true })
    vim.keymap.set("i", "<C-y>", function() end, { desc = "[CMGDEV] NVIM CMP Confirm Selection", noremap = true, silent = true })
    vim.keymap.set("i", "<C-f>", function() end, { desc = "[CMGDEV] NVIM CMP Trigger Code Completion", noremap = true, silent = true })
    vim.keymap.set("i", "<C-e>", function() end, { desc = "[CMGDEV] NVIM CMP Abort Code Completion", noremap = true, silent = true })
end
}
