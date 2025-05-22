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

            -- Show commando list
            vim.keymap.set("n", "<leader>cm", commando.show)

            -- Run commands by index
            vim.keymap.set("n", "<leader>ch", function() commando.run(1) end)
            vim.keymap.set("n", "<leader>cj", function() commando.run(2) end)
            vim.keymap.set("n", "<leader>ck", function() commando.run(3) end)
            vim.keymap.set("n", "<leader>cl", function() commando.run(4) end)
            vim.keymap.set("n", "<leader>c;", function() commando.run(5) end)
            vim.keymap.set(
                "n",
                "<leader>cc",
                function() commando.run_latest() end
            )
        end,
    },
}
