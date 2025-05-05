return {
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
}
