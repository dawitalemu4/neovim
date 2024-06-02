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
                ensure_installed = { "lua_ls", "tsserver", "html", "cssls", "pylsp", "jdtls", "jsonls", "tailwindcss", "marksman", "typos_lsp", "emmet_language_server", "gopls", "rust_analyzer" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp" },
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            capabilities = {
                workspace = {
                    didChangeWatchedFiles = {
                        dynamicRegistration = true,
                    }
                }
            }
        },
        config = function()
            local lspconfig = require"lspconfig"
            local capabilities = require"cmp_nvim_lsp".default_capabilities()

            local get_path = function(file, flag)
                if flag == nil then
                    return { vim.fn.stdpath("data") .. "/mason/bin/" .. file .. ".CMD" }
                else
                    return { vim.fn.stdpath("data") .. "/mason/bin/" .. file .. ".CMD", flag }
                end
            end

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
                filetypes = { "css", "scss", "less", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities
            })
            lspconfig.jdtls.setup({
                capabilities = capabilities,
                root_dir = function(fname)
                    return lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git")(fname) or vim.fn.getcwd()
                end
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities
            })
            lspconfig.marksman.setup({
                capabilities = capabilities
            })
            lspconfig.typos_lsp.setup({
                capabilities = capabilities
            })
            lspconfig.emmet_language_server.setup({
                capabilities = capabilities
            })
            lspconfig.gopls.setup({
                capabilities = capabilities
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities
            })

            vim.keymap.set("n", "<C-a>", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<C-s>", vim.lsp.buf.definition, {})
            -- vim.keymap.set("n", "<C-a>", vim.lsp.buf.code_action, {})

        end
    }
}
