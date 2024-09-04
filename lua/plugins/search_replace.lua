return {
    "s1n7ax/nvim-search-and-replace",
    config = function()

        require"nvim-search-and-replace".setup({
            ignore = { "**/node_modules/**", "**/.git/**", "**/.gitignore", "**/.gitmodules", "build/**" },
            replace_all_and_save_keymap = "<C-y>",
            update_changes = true
        })

        vim.keymap.set("n", "<esc>", ":noh<CR>", { silent = true, noremap = true })
    end
}
