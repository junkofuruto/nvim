vim.pack.add({
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/hrsh7th/nvim-cmp",
}, { confirm = false })

local cmp = require("cmp")
local autopairs = require("nvim-autopairs")
local autopairs_cmp = require("nvim-autopairs.completion.cmp")

autopairs.setup({
    check_ts = true,
})

cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done())
