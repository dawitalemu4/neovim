return {
    "kndndrj/nvim-dbee",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()

        require"dbee".setup({})

        vim.keymap.set("n", "<C-z>", "<cmd>lua require'dbee'.open()<CR>", { silent = true, noremap = true })
    end
}
