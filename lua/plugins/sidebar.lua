return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", "3rd/image.nvim" },
    config = function()
        require"neo-tree".setup {
            event_handlers = {
                {
                    event = "file opened",
                    handler = function()
                        require("neo-tree.command").execute({ action = "close" })
                        require("neo-tree.sources.filesystem").reset_search(state)
                    end
                }
            }
        }
        vim.keymap.set("n", "<C-b>", ":Neotree filesystem toggle<CR>", {})
    end
}
