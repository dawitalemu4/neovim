return {
    "nvim-pack/nvim-spectre",
    config = function()

        require"spectre".setup({
            mapping = {
                ["run_replace"] = {
                    map = "<Enter>",
                    cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                    desc = "replace all"
                }
            }
        })

        vim.keymap.set("n", "<C-y>", "<cmd>lua require('spectre').toggle()<CR>", {
            desc = "Toggle Spectre"
        })
    end
}
