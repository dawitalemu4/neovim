return {
    {
        "williamboman/mason.nvim",
        config = function()
            require"mason".setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require"mason-lspconfig".setup({
                ensure_installed = { "lua_ls", "tsserver", "quick_lint_js", "html", "cssls", "pylsp", "jdtls", "bashls", "jsonls", "sqlls", "tailwindcss", "marksman", "grammarly", "typos_lsp" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()

            local lspconfig = require"lspconfig"
            local capabilities = require"cmp_nvim_lsp".default_capabilities()

            local get_path = function(file)
                return { vim.fn.stdpath("data") .. "/mason/bin/" .. file .. ".CMD" }
            end

            lspconfig.lua_ls.setup({
                cmd = get_path("lua-language-server"),
                capabilities = capabilities
            })
            lspconfig.tsserver.setup({
                cmd = get_path("typescript-language-server"),
                capabilities = capabilities
            })
            lspconfig.quick_lint_js.setup({
                cmd = get_path("quick-lint-js"),
                capabilities = capabilities
            })
            lspconfig.html.setup({
                cmd = get_path("vscode-html-language-server"),
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                cmd = get_path("vscode-css-language-server"),
                capabilities = capabilities
            })
            lspconfig.pylsp.setup({
                cmd = get_path("pylsp"),
                capabilities = capabilities
            })
            lspconfig.jdtls.setup({
                cmd = get_path("jdtls"),
                capabilities = capabilities
            })
            lspconfig.bashls.setup({
                cmd = get_path("bash-language-server"),
                capabilities = capabilities
            })
            lspconfig.jsonls.setup({
                cmd = get_path("vscode-json-language-server"),
                capabilities = capabilities
            })
            lspconfig.sqlls.setup({
                cmd = get_path("sql-language-server"),
                capabilities = capabilities
            })
            lspconfig.tailwindcss.setup({
                cmd = get_path("tailwindcss-language-server"),
                capabilities = capabilities
            })
            lspconfig.marksman.setup({
                cmd = get_path("marksman"),
                capabilities = capabilities
            })
            lspconfig.grammarly.setup({
                cmd = get_path("grammarly-languageserver"),
                capabilities = capabilities
            })
            lspconfig.typos_lsp.setup({
                cmd = get_path("typos-lsp"),
                capabilities = capabilities
            })

            vim.keymap.set("n", "<C-a>", vim.lsp.buf.hover, {})
            -- vim.keymap.set("n", "<C-a>", vim.lsp.buf.code_action, {})

        end
    }
}
