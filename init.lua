vim.cmd("set number")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("syntax enable")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require"kanagawa".setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { bold = false }
			})
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl", opts = {},
		config = function()
			require"ibl".setup()
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope_builtin = require"telescope.builtin"
			vim.keymap.set("n", "<C-f>", telescope_builtin.find_files, {})
			vim.keymap.set("n", "<C-g>", telescope_builtin.live_grep, {})
		end
	},
	{
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
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		config = function()
			require"neo-tree".setup {
				event_handlers = {
					{
						event = "file opened",
						handler = function(file_path)
							require("neo-tree.command").execute({ action = "close" })
							require("neo-tree.sources.filesystem").reset_search(state)
						end
					}	
				}			
			}
			vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal left<CR>", {})
			vim.keymap.set("n", "<C-n>", ":Neotree close<CR>", {})
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local colors = {
				blue   = '#80a0ff',
				cyan   = '#79dac8',
				black  = '#080808',
				white  = '#c6c6c6',
				red    = '#ff5189',
				violet = '#d183e8',
				grey   = '#303030',
			}

			local bubbles_theme = {
				normal = {
					a = { fg = colors.black, bg = colors.violet },
					b = { fg = colors.white, bg = colors.grey },
					c = { fg = colors.black, bg = colors.grey },
				},

				insert = { a = { fg = colors.black, bg = colors.blue } },
				visual = { a = { fg = colors.black, bg = colors.cyan } },
				replace = { a = { fg = colors.black, bg = colors.red } },

				inactive = {
					a = { fg = colors.white, bg = colors.black },
					b = { fg = colors.white, bg = colors.black },
					c = { fg = colors.black, bg = colors.black },
				},
			}

			require"lualine".setup {
				options = {
					theme = bubbles_theme,
					component_separators = '|',
					section_separators = { left = '', right = '' },
				},
				sections = {
					lualine_a = {
						{ 'mode', separator = { left = '' }, right_padding = 2 },
					},
					lualine_b = { 'filename', 'branch' },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { 'filetype' },
					lualine_z = {
						{ 'location', separator = { right = '' }, left_padding = 2 },
					},
				},
				inactive_sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'filename', 'branch' },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { 'filetype' },
					lualine_z = { 'location' },
				},
				tabline = {},
				extensions = {},
			}
		end
	},
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require"alpha"
			local dashboard = require"alpha.themes.startify"

			dashboard.section.header.val = {
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[																		 ]],
				[[        ████   ██████             █████        ██                      ]],
				[[       ██████  █████               █████    █                          ]],
				[[       ███████  ██   ████████  ███ █████  ███  ███   ███ ████ ████    ]],
				[[      █  ████████    ███      █████  ████████ █████ █████ ████ █████   ]],
				[[     ███  ██████   ████████  ██   ██  ███████ █████ █████ ████ █████   ]],
				[[   ██████  █████   ███      ███   ███  ██████ █████ █████ ████ █████   ]],
				[[  ██████    ███  █████████  █████████   ████  █████ █████ ████ ██████  ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
			}

			alpha.setup(dashboard.opts)
		end
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require"mason".setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require"mason-lspconfig".setup({
				ensure_installed = { "lua_ls", "tsserver", "quick_lint_js", "html", "cssls", "pylsp", "jdtls", "bashls", "jsonls", "sqlls", "tailwindcss", "marksman" }

			})
		end
	}
}

require"lazy".setup(plugins)

vim.cmd("colorscheme kanagawa-dragon")
