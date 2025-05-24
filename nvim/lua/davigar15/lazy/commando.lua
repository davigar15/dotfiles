return {
    {
        dir = vim.fn.stdpath("config") .. "/lua/commando",
        name = "commando",
        -- "davigar15/commando",
        dependencies = {
            "preservim/vimux",
            { "ThePrimeagen/harpoon", branch = "harpoon2" },
        },
        config = function()
            local commando = require("commando")

            -- -- Show commando list
            vim.keymap.set("n", "<leader>cm", commando.toggle_quick_menu)
            --
            -- -- Run commands by index
            vim.keymap.set(
                "n",
                "<leader>ch",
                function() commando.list:select(1) end
            )
            vim.keymap.set(
                "n",
                "<leader>cj",
                function() commando.list:select(2) end
            )
            vim.keymap.set(
                "n",
                "<leader>ck",
                function() commando.list:select(3) end
            )
            vim.keymap.set(
                "n",
                "<leader>cl",
                function() commando.list:select(4) end
            )
            vim.keymap.set(
                "n",
                "<leader>c;",
                function() commando.list:select(5) end
            )
            vim.keymap.set("n", "<leader>cc", commando.run_latest)
            -- vim.keymap.set("v", "<leader>cc", require("commando").run_selection)
        end,
    },
}
