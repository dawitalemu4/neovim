return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require"nvim-treesitter.install".prefer_git = false
        require"nvim-treesitter.configs".setup {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html", "css", "python", "java", "bash", "json", "sql", "gitignore", "go", "tsx" },
            highlight = { enable = true },
            indent = { enable = true }
        }
    end
}
