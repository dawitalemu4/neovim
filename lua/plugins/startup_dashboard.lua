return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()

        local alpha = require"alpha"
        local updatedStyle = require"alpha.themes.startify"

        updatedStyle.section.header.opts = {
            position = "center",
            hl = "Type",
            shrink_margin = false
        }

        updatedStyle.section.top_buttons.val = {}
        updatedStyle.section.mru_cwd.val = {}

        updatedStyle.section.mru.val[2].val = "Recent Files"

        alpha.setup(updatedStyle.opts)

    end
}
