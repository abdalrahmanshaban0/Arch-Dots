return {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason").setup({
				ensure_installed = { "clangd", "clang-format", "stylua" },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "cmake" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})
			lspconfig.cmake.setup({})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "about" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "go to implementation" })
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "type definition" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename variable" })
			vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "code action" })
		end,
	},
}
