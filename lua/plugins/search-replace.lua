return {
    "s1n7ax/nvim-search-and-replace",
    config = function()

        require"nvim-search-and-replace".setup({
            replace_keymap = "<C-y>",
            update_changes = true
        })

        vim.keymap.set("n", "<esc>", ":noh<CR>", { silent = true, noremap = true })
    end
}
