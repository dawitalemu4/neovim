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
                ensure_installed = { "lua_ls", "tsserver", "html", "cssls", "pylsp", "jdtls", "jsonls", "tailwindcss", "marksman", "typos_lsp", "emmet_language_server", "gopls" }
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

            local get_path = function(file, flag)
                if flag == nil then
                    return { vim.fn.stdpath("data") .. "/mason/bin/" .. file .. ".CMD" }
                else
                    return { vim.fn.stdpath("data") .. "/mason/bin/" .. file .. ".CMD", flag }
                end
            end

            lspconfig.lua_ls.setup({
                cmd = get_path("lua-language-server", nil),
                capabilities = capabilities
            })
            lspconfig.tsserver.setup({
                cmd = get_path("typescript-language-server", "--stdio"),
                capabilities = capabilities
            })
            lspconfig.html.setup({
                cmd = get_path("vscode-html-language-server", "--stdio"),
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                cmd = get_path("vscode-css-language-server", "--stdio"),
                capabilities = capabilities,
                filetypes = { "css", "scss", "less", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
            })
            lspconfig.pylsp.setup({
                cmd = get_path("pylsp", nil),
                capabilities = capabilities
            })
            lspconfig.jdtls.setup({
                cmd = get_path("jdtls", nil),
                capabilities = capabilities,
                root_dir = function(fname)
                    return lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git")(fname) or vim.fn.getcwd()
                end
            })
            lspconfig.jsonls.setup({
                cmd = get_path("vscode-json-language-server", "--stdio"),
                capabilities = capabilities
            })
            lspconfig.tailwindcss.setup({
                cmd = get_path("tailwindcss-language-server", nil),
                capabilities = capabilities
            })
            lspconfig.marksman.setup({
                cmd = get_path("marksman", nil),
                capabilities = capabilities
            })
            lspconfig.typos_lsp.setup({
                cmd = get_path("typos-lsp", nil),
                capabilities = capabilities
            })
            lspconfig.emmet_language_server.setup({
                cmd = get_path("emmet-language-server", "--stdio"),
                capabilities = capabilities
            })
            lspconfig.gopls.setup({
                cmd = get_path("gopls", nil),
                capabilities = capabilities
            })

            vim.keymap.set("n", "<C-a>", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<C-s>", vim.lsp.buf.definition, {})
            -- vim.keymap.set("n", "<C-a>", vim.lsp.buf.code_action, {})

        end
    }
}
