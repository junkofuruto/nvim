local gitblame = require("gitblame")

gitblame.setup({
    enabled = true,
    date_format = "%r",
    message_template = "<author> <date> > <summary>"
})
