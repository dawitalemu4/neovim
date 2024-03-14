return {
    { "github/copilot.vim" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "dcampos/cmp-emmet-vim" },
    { "mattn/emmet-vim" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" }
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()

            local cmp = require"cmp"
            require"luasnip.loaders.from_vscode".lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require"luasnip".lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                preselect = cmp.PreselectMode.None,
                mapping = cmp.mapping.preset.insert({
                    ['<C-Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
                    ['<C-Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
                    ['<Enter>'] = cmp.mapping.confirm({ select = true })
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = 'emmet_vim' }
                }, {
                    { name = "buffer" }
                })
            })
        end
    }
}
