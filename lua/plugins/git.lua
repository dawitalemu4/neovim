return {
    { "tpope/vim-fugitive" },
    {
        "lewis6991/gitsigns.nvim",
        config = function()

            require"gitsigns".setup({})

            vim.keymap.set("n", "<C-q>", ":Gitsigns toggle_current_line_blame<CR>", {})

        end
    }
}
