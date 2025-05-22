return {
    -- DIAGNOSTICS
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
        },
    },
    -- FORMATTING
    {
        "stevearc/conform.nvim",
        opts = {},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "ruff_format" },
                },
                format_on_save = { timeout_ms = 1000 },
            })
        end,
    },
    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim", config = true },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/nvim-cmp" },

            -- Autocompletion source for LSP (optional but recommended)
            { "hrsh7th/cmp-nvim-lsp" },
        },
        config = function()
            local lsp = require("lsp-zero").preset("recommended")

            -- Mason will ensure these LSPs are installed
            require("mason").setup({})
            require("mason-lspconfig").setup({
                -- Replace the language servers listed here
                -- with the ones you want to install
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "ruff",
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                },
            })

            -- Optional: nicer signs and disable server suggestions
            lsp.set_preferences({
                suggest_lsp_servers = false,
                sign_icons = {
                    error = "✘",
                    warn = "▲",
                    hint = "⚑",
                    info = "»",
                },
            })

            lsp.on_attach(function(_, bufnr)
                local map = function(keys, func, desc)
                    vim.keymap.set(
                        "n",
                        keys,
                        func,
                        { buffer = bufnr, desc = "LSP: " .. desc }
                    )
                end

                map(
                    "gd",
                    require("telescope.builtin").lsp_definitions,
                    "[G]oto [D]efinition"
                )
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map(
                    "gr",
                    require("telescope.builtin").lsp_references,
                    "[G]oto [R]eferences"
                )
                -- map("gR", vim.lsp.buf.references, "[G]oto [R]eferences")
                map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
                map(
                    "<leader>ws",
                    vim.lsp.buf.workspace_symbol,
                    "[W]orkspace [S]ymbols"
                )
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("<leader>d", vim.lsp.buf.hover, "Hover Documentation")
            end)

            lsp.setup()

            -- nvim-cmp setup
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<S-TAB>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<TAB>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                },
                sources = {
                    { name = "nvim_lsp" },
                    -- you can add more sources here
                },
            })
        end,
    },
}
