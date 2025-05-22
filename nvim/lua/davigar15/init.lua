require("davigar15.remap")
require("davigar15.set")
require("davigar15.lazy_init")
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})
local lsp_group = augroup("LspGroup", {})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})
autocmd("LspAttach", {
    group = lsp_group,
    callback = function(e)
        local opts = { buffer = e.buf }

        vim.keymap.set(
            "n",
            "gd",
            require("telescope.builtin").lsp_definitions,
            opts
        )
        vim.keymap.set(
            "n",
            "gr",
            require("telescope.builtin").lsp_references,
            opts
        )
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "]", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[", vim.diagnostic.goto_prev, opts)
    end,
})

vim.api.nvim_create_user_command("MarkdownToPDF", function()
    local input = vim.fn.expand("%")
    local output = input:gsub("%.md$", ".pdf")
    vim.fn.jobstart(
        { "pandoc", input, "-o", output, "--pdf-engine=tectonic" },
        {
            on_exit = function(_, code)
                if code == 0 then
                    vim.notify("PDF generated: " .. output, vim.log.levels.INFO)
                else
                    vim.notify("PDF generation failed", vim.log.levels.ERROR)
                end
            end,
        }
    )
end, {})
