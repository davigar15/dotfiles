return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
			},
			format_on_save = { timeout_ms = 1000 },
		})
	end,
}
