return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} }
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "[CMGDEV] LSP Show References"
                vim.keymap.set("n", "<leader>pd", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "[CMGDEV] LSP Show Definitions"
                vim.keymap.set("n", "gD", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "[CMGDEV] LSP Go to Definition"
                vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)

                opts.desc = "[CMGDEV] Rename Symbol"
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "[CMGDEV] Show Available Code Actions"
                vim.keymap.set("n", "<leader>fa", function() vim.lsp.buf.code_action() end, opts)

                opts.desc = "[CMGDEV] Show Buffer Diagnostics"
                vim.keymap.set("n", "<leader>fe", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "[CMGDEV] Show Signature Help"
                vim.keymap.set("i", "<C-d>", function() vim.lsp.buf.signature_help() end, opts)

                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if not client then return end


                if client.supports_method("textDocument/completion") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = ev.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
                        end
                    })
                end
            end
        })

        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            virtual_lines = {
                current_line = true
            },
            float = {
                border = "rounded",
                source = true,
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = "",
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "ErrorMsg",
                    [vim.diagnostic.severity.WARN] = "WarningMsg",
                }
            }
        })
    end
}
