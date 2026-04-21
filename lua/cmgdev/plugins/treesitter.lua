vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
}, { confirm = false })

local ts = require("nvim-treesitter")
local tsto = require("nvim-treesitter-textobjects")

local parsers = {
    "json", "javascript", "typescript", "tsx", "go", "gomod", "gowork", 
    "yaml", "html", "python", "http", "markdown", "markdown_inline", "bash",
    "lua", "vim", "dockerfile", "gitignore", "vimdoc", "rust",
}

local setup_treesitter = {
    sync_install = false,
    auto_install = true,
}

local setup_treesitter_to = {
    lookahead = true,
    include_surrounding_whitespace = false,
}

ts.setup(setup_treesitter)
tsto.setup(setup_treesitter_to)
ts.install(parsers)

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local success, _ = pcall(vim.treesitter.start, bufnr)
        if success then
            vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
