vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use { "Shatur/neovim-ayu", config = function() require("cmgdev.config.colortheme") end }

    use { "mbbill/undotree" }
    use { "mason-org/mason.nvim" }
	use { "nvim-lua/plenary.nvim" }
    use { "neovim/nvim-lspconfig" }
    use { "wbthomason/packer.nvim" }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }
    use { "nvim-telescope/telescope.nvim", tag = "0.1.8" }
    use { "f-person/git-blame.nvim", config = function() require("cmgdev.config.git-blame") end }
    use { "lewis6991/gitsigns.nvim", config = function() require("cmgdev.config.git-signs") end }
    use { "nvim-lualine/lualine.nvim", config = function() require("cmgdev.config.lualine") end }
    use { "folke/todo-comments.nvim", config = function() require("cmgdev.config.todo-comments") end }
    use { "nvim-treesitter/nvim-treesitter", config = function() require("cmgdev.config.treesitter") end }
    use { "mason-org/mason-lspconfig.nvim", config = function() require("cmgdev.config.mason-lspconfig") end }
end)
