return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
        "hrsh7th/nvim-cmp"
    },
    config = function()
        local cmp = require("cmp")
        local autopairs = require("nvim-autopairs")
        local autopairs_cmp = require("nvim-autopairs.completion.cmp")

        autopairs.setup({
            check_ts = true
        })

        cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done())
    end
}
