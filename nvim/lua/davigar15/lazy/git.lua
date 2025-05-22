return {
    {
        "tpope/vim-fugitive",
        config = function() vim.keymap.set("n", "<leader>g", vim.cmd.Git) end,
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },
}
