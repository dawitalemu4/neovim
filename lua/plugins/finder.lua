return {
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    }
                }
            })
            local telescope_builtin = require"telescope.builtin"
            vim.keymap.set("n", "<C-f>", telescope_builtin.find_files, {})
            vim.keymap.set("n", "<C-g>", telescope_builtin.live_grep, {})
            require"telescope".load_extension("ui-select")
        end
    }
}
