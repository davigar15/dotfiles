return {
    { "numToStr/Comment.nvim", opts = {} },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set(
                "n",
                "<leader>u",
                vim.cmd.UndotreeToggle,
                { desc = "Toggle undotree", noremap = true, silent = true }
            )
        end,
    },
}
