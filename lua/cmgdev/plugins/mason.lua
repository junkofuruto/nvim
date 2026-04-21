vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/neovim/nvim-lspconfig",
}, { confirm = false })

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

mason_lspconfig.setup({
    automatic_installation = true,
    ensure_installed = {
        "lua_ls",
        "gopls",
        "html",
        "tailwindcss",
        "rust_analyzer",
    },
})

mason_tool_installer.setup({
    ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "pylint",
        "clangd",
        "eslint_d",
        "gofumpt",
        "biome",
    },
})
