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
                config = function() require("telescope").load_extension("fzf") end,
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
            vim.keymap.set(
                "n",
                "<leader>sn",
                function()
                    builtin.find_files({ cwd = vim.fn.stdpath("config") })
                end,
                { desc = "[S]earch [N]eovim files" }
            )
        end,
    },
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup({
                settings = {
                    save_on_toggle = true,
                    sync_on_ui_close = true,
                },
            })
            vim.keymap.set(
                "n",
                "<leader>n",
                function() harpoon:list():add() end
            )
            vim.keymap.set(
                "n",
                "<leader>m",
                function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
            )

            vim.keymap.set(
                "n",
                "<leader>h",
                function() harpoon:list():select(1) end
            )
            vim.keymap.set(
                "n",
                "<leader>j",
                function() harpoon:list():select(2) end
            )
            vim.keymap.set(
                "n",
                "<leader>k",
                function() harpoon:list():select(3) end
            )
            vim.keymap.set(
                "n",
                "<leader>l",
                function() harpoon:list():select(4) end
            )
            vim.keymap.set(
                "n",
                "<leader>;",
                function() harpoon:list():select(5) end
            )
        end,
    },
}
