vim.g.netrw_banner = 0
vim.g.editorconfig = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.fixeol = true
vim.opt.termguicolors = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 20
vim.opt.signcolumn = "yes"
vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.updatetime = 50
vim.opt.hlsearch = false

vim.opt.mouse = ""

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
