local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyrepo = "https://github.com/folke/lazy.nvim.git"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        { import = "cmgdev.plugins" },
        { import = "cmgdev.plugins.lsp" },
    },
    {
        checker = {
            enabled = true,
            notify = false,
        },
        change_detection = {
            notify = false
        },
        ui = {
            size = { width = 0.6, heigth = 0.8 },
            wrap = true,
            border = "none",
            title_pos = "center",
        },
        install = {
            missing = true,
            colorscheme = { "ayu" }
        }
    }
)

vim.cmd("ShowkeysToggle")
