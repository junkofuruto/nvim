local cmp = require("cmp")

cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p"] = cmp.mapping.scroll_docs(-4),
        ["<C-n"] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort()
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})
