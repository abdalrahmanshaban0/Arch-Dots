--Tab setting & indentation
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set signcolumn=yes")

--Line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")

--cursor
vim.cmd("set cursorline")

--spliting
vim.cmd("set splitright")
vim.cmd("set splitbelow")

--clipboard
vim.cmd("set clipboard=unnamedplus")

--Configs
require("config.keyBindings")
require("config.lazy")

--colorscheme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme catppuccin]])
