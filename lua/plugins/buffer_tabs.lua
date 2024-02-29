return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()

        local bufferline = require"bufferline"

        bufferline.setup({
            options = {
                style_preset = bufferline.style_preset.minimal,
                diagnostics = "nvim_lsp",
                show_duplicate_prefix = false,
                buffer_close_icon = "",
                separator_style = {"", ""}
            }
        })

        vim.opt.termguicolors = true
        vim.keymap.set("n", "tp", ":BufferLinePick<CR>", {})
        vim.keymap.set("n", "td", ":BufferLinePickClose<CR>", {})
        vim.keymap.set("n", "ta", ":BufferLineCloseOthers<CR>", {})

    end
}
