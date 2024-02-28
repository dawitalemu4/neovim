return {
	{
		"williamboman/mason.nvim",
		config = function()
			require"mason".setup({ PATH = "prepend" })
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = { auto_install = true },
		config = function()
			require"mason-lspconfig".setup({
				ensure_installed = { "lua_ls", "tsserver", "quick_lint_js", "html", "cssls", "pylsp", "jdtls", "bashls", "jsonls", "sqlls", "tailwindcss", "marksman", "grammarly", "typos_lsp" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()

            local capabilities = require"cmp_nvim_lsp".default_capabilities()
            local lspconfig = require"lspconfig"

            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.tsserver.setup({ capabilities = capabilities })
            lspconfig.quick_lint_js.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.pylsp.setup({ capabilities = capabilities })
            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.bashls.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })
            lspconfig.sqlls.setup({ capabilities = capabilities })
            lspconfig.tailwindcss.setup({ capabilities = capabilities })
            lspconfig.marksman.setup({ capabilities = capabilities })
            lspconfig.grammarly.setup({ capabilities = capabilities })
            lspconfig.typos_lsp.setup({ capabilities = capabilities })

            vim.keymap.set("n", "<C-a>", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "<C-a>", vim.lsp.buf.code_action, {})

		end
	}
}
