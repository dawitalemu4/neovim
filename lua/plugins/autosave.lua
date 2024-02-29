return {
    "Pocco81/auto-save.nvim",
    config = function()

        require"auto-save".setup({
            debounce_delay = 100
        })

        vim.api.nvim_set_keymap("n", "<C-s>", ":ASToggle<CR>", {})

    end
}
