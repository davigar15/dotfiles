return {
	"pwntester/octo.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		-- OR 'ibhagwan/fzf-lua',
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("octo").setup({
			file_panel = {
				use_icons = true,
			},
			mappings_disable_default = false,
			use_local_fs = true,
			suppress_missing_scope = {
				projects_v2 = true,
			},
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "octo",
			callback = function()
				vim.keymap.set("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })
				vim.keymap.set("i", "#", "#<C-x><C-o>", { silent = true, buffer = true })
			end,
		})
	end,
}
