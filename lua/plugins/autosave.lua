return {
    "Pocco81/auto-save.nvim",
    config = function()

        require"auto-save".setup({
            execution_message = {
                message = function()
                    vim.cmd("retab")
                    return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
                end,
                dim = 0.18,
                cleaning_interval = 1250
            },
            debounce_delay = 100
        })

    end
}
