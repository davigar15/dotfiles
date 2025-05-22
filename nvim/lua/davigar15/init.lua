require("davigar15.remap")
require("davigar15.set")
require("davigar15.lazy_init")
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})

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
