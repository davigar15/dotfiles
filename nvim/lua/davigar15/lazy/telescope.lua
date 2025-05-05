
return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
        ,{
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },

    config = function()
        require('telescope').setup({
            pickers = {
                live_grep = { disable_devicons = true },
                find_files = { disable_devicons = true },
                grep_string = { disable_devicons = true },
            },
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>sw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>sW', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set("n", "<leader>sg", builtin.live_grep)
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[S]earch [N]eovim files" })
    end
}
