vim.lsp.config["pylsp"] = {
    filetypes = {"python"},
    root_markers = { ".git", "pyproject.toml", "setup.py" },
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    ignore = {"W391"},
                    maxLineLength = 100
                },
                pyflakes = { enabled = true },
                mccabe = { enabled = true },
                pylint = { enabled = false }
            }
        }
    }
}
