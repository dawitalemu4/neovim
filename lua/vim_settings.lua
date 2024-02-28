vim.cmd("set number")
vim.cmd("set wrap!")
vim.cmd("set formatoptions-=t")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("syntax enable")
vim.keymap.set("v", "k", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "j", ":m '<-2<CR>gv=gv")
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "LineNr", { fg="grey", bold=true })
	end
})
