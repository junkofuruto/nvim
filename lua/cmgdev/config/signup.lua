local signup = require("signup")

signup.setup({
    silent = false,
    icons = {
        parameter = "",
        method = "",
        documentaion = "",
        type = "󰌗",
        default = "󰁔"
    },
    colors = {
      parameter = "#86e1fc",
      method = "#c099ff",
      documentation = "#4fd6be",
      default_value = "#a80888",
      type = "#f6c177",
    },
    active_parameter = true,
    border = "rounded",
    dock_border = "rounded",
    trigger_chars = { "(", ",", ")" },
    dock_mode = {
        enabled = false,
        position = "bottom",
        side = "right"
    }
})

