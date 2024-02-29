return {
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()

            local telescope = require"telescope"
            local telescope_builtin = require"telescope.builtin"
            local telescope_themes = require"telescope.themes"

            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        telescope_themes.get_dropdown({})
                    }
                }
            })

            require"telescope".load_extension("ui-select")

            vim.keymap.set("n", "<C-f>", telescope_builtin.find_files, {})
            vim.keymap.set("n", "<C-g>", telescope_builtin.live_grep, {})
        
        end
    }
}
