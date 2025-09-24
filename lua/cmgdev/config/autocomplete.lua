local signature = require("autocomplete.signature")
local buffer = require("autocomplete.buffer")
local cmd = require("autocomplete.cmd")

signature.setup({
    border = nil,
    width = 80,
    heigth = 25,
    debounce_delay = 100
})

buffer.setup({
    border = nil,
    entry_mapper = nil,
    debounce_delay = 100
})

cmd.setup()
