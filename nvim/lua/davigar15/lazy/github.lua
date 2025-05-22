

local function is_pr_buffer()
  local name = vim.api.nvim_buf_get_name(0)
  return name:match("octo://.*/pull/%d+")
end
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
                vim.keymap.set(
                    "i",
                    "@",
                    "@<C-x><C-o>",
                    { silent = true, buffer = true }
                )
                vim.keymap.set(
                    "i",
                    "#",
                    "#<C-x><C-o>",
                    { silent = true, buffer = true }
                )
                vim.keymap.set("n", "<leader>r", function()


                    if is_pr_buffer() then
                        vim.cmd("Octo comment add")
                        vim.defer_fn(function()
                            vim.api.nvim_put({"/gcbrun"}, "", true, true) -- insert /gcbrun
                            vim.cmd("w") -- save and close buffer
                        end, 200) -- wait 200ms for Octo buffer to open
                    end
                end)
            end,
        })
    end,
}
