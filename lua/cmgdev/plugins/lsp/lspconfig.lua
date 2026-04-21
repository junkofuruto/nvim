return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} }
    },
    config = function()
        local function pretty_diagnostic_float()
            local bufnr = vim.api.nvim_get_current_buf()
            local original_line = vim.api.nvim_win_get_cursor(0)[1] - 1

            local diagnostics = vim.diagnostic.get(bufnr, { lnum = original_line })
            if #diagnostics == 0 then return end

            local seen = {}
            local unique = {}
            for _, d in ipairs(diagnostics) do
                local key = (d.severity or 0) .. ":" .. (d.message or "")
                if not seen[key] then
                    seen[key] = true
                    table.insert(unique, d)
                end
            end
            diagnostics = unique

            table.sort(diagnostics, function(a, b)
                return a.severity < b.severity
            end)

            local lines = {}
            local ns = vim.api.nvim_create_namespace("diag_float_ns")

            local icons = {
                [vim.diagnostic.severity.ERROR] = " E: ",
                [vim.diagnostic.severity.WARN]  = " W: ",
                [vim.diagnostic.severity.INFO]  = " I: ",
                [vim.diagnostic.severity.HINT]  = " H: ",
            }

            local hl_groups = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticError",
                [vim.diagnostic.severity.WARN]  = "DiagnosticWarn",
                [vim.diagnostic.severity.INFO]  = "DiagnosticInfo",
                [vim.diagnostic.severity.HINT]  = "DiagnosticHint",
            }

            local max_width = math.min(80, vim.o.columns - 10)

            for _, diag in ipairs(diagnostics) do
                local icon = icons[diag.severity] or "•  "
                local msg = diag.message:gsub("\n", " ")

                local wrapped = vim.fn.split(msg, "\\s\\+")
                local current_line = icon

                for _, word in ipairs(wrapped) do
                    if #current_line + #word + 1 > max_width then
                        table.insert(lines, current_line)
                        current_line = "    " .. word .. " "
                    else
                        current_line = current_line .. word .. " "
                    end
                end
                table.insert(lines, current_line)
            end

            local buf = vim.api.nvim_create_buf(false, true)
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

            local ft = vim.bo[bufnr].filetype
            if ft and ft ~= "" then
                vim.bo[buf].filetype = ft
                pcall(vim.treesitter.start, buf, ft)
            end

            local row = 0
            for _, diag in ipairs(diagnostics) do
                local icon_len = #icons[diag.severity] or 3
                vim.api.nvim_buf_set_extmark(buf, ns, row, 0, {
                    end_col = icon_len,
                    hl_group = hl_groups[diag.severity],
                    priority = 100,
                })
                row = row + 1
            end

            local win = vim.api.nvim_open_win(buf, false, {
                relative = "cursor",
                row = 1,
                col = 0,
                width = max_width,
                height = #lines,
                border = "rounded",
                style = "minimal",
                title = " Diagnostics ",
                title_pos = "center",
                zindex = 50,
            })

            vim.api.nvim_set_option_value("winhl", "Normal:NormalFloat,FloatBorder:Normal", { win = win })

            vim.api.nvim_create_autocmd("CursorMoved", {
                buffer = bufnr,
                callback = function()
                    local current_line = vim.api.nvim_win_get_cursor(0)[1] - 1
                    if current_line ~= original_line then
                        if vim.api.nvim_win_is_valid(win) then
                            vim.api.nvim_win_close(win, true)
                        end
                        if vim.api.nvim_buf_is_valid(buf) then
                            vim.api.nvim_buf_delete(buf, { force = true })
                        end
                        return
                    end

                    if vim.api.nvim_win_is_valid(win) then
                        vim.api.nvim_win_set_config(win, {
                            relative = "cursor",
                            row = 1,
                            col = 0,
                        })
                    end
                end,
            })

            vim.api.nvim_create_autocmd({ "InsertEnter", "BufLeave", "WinLeave" }, {
                buffer = bufnr,
                once = true,
                callback = function()
                    if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
                    if vim.api.nvim_buf_is_valid(buf) then vim.api.nvim_buf_delete(buf, { force = true }) end
                end,
            })
        end

        vim.diagnostic.config({
            virtual_text = false,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            virtual_lines = false,
            float = { enabled = false },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "E",
                    [vim.diagnostic.severity.WARN]  = "W",
                    [vim.diagnostic.severity.INFO]  = "I",
                    [vim.diagnostic.severity.HINT]  = "H",
                },
            }
        })

        vim.api.nvim_create_autocmd("CursorHold", {
            group = vim.api.nvim_create_augroup("PrettyDiagnosticFloat", { clear = true }),
            callback = pretty_diagnostic_float,
        })

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

                opts.desc = "[CMGDEV] Format Buffer"
                vim.keymap.set("n", "<leader>ff", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)

                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if not client then return end

                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = ev.buf,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = ev.buf,
                                id = client.id,
                                async = false,
                                timeout_ms = 2000,
                            })
                        end,
                    })
                end
            end
        })
    end
}
