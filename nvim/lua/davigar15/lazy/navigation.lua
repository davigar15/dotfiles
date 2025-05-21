return {
	"christoomey/vim-tmux-navigator",
	{
		"nvim-telescope/telescope.nvim",

		tag = "0.1.5",

		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},

		config = function()
			require("telescope").setup({
				pickers = {
					live_grep = { disable_devicons = true },
					find_files = { disable_devicons = true },
					grep_string = { disable_devicons = true },
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<leader>sw", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>sW", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>sg", builtin.live_grep)
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
	{
		"theprimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { desc = "Harpoon: " .. desc })
			end
			map("<leader>n", mark.add_file, "Add [N]ew entry")
			map("<leader>m", ui.toggle_quick_menu, "Show [M]enu")

			map("<leader>h", function()
				ui.nav_file(1)
			end, "Go to file 1")
			map("<leader>j", function()
				ui.nav_file(2)
			end, "Go to file 2")
			map("<leader>k", function()
				ui.nav_file(3)
			end, "Go to file 3")
			map("<leader>l", function()
				ui.nav_file(4)
			end, "Go to file 4")
			map("<leader>;", function()
				ui.nav_file(5)
			end, "Go to file 5")
		end,
	},
}
