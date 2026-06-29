-- LSP related plugins: language servers, diagnostics, code intelligence

return {
    -- mason: LSP server manager
    {
        "mason-org/mason.nvim",
        opts = {}
    },

    -- mason-lspconfig: bridge between mason and lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = { "clangd", "marksman", "gopls", "ruff", "ty" },
            -- rustaceanvim manages rust_analyzer; exclude it from auto-enable
            -- to avoid a duplicate LSP client attaching to rust buffers.
            automatic_enable = {
                exclude = { "rust_analyzer" },
            },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)

            -- configure marksman
            vim.lsp.config("marksman", {
                cmd = { "marksman", "server" },
                filetypes = { "markdown", "markdown.mdx" },
                root_markers = { ".git", ".marksman.toml" },
            })

            vim.lsp.enable("marksman")
        end,
    },

    -- typescript-tools: TypeScript/JavaScript language support
    {
        "pmizio/typescript-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
        },
        lazy = false,
        opts = {},
    },

    -- rustaceanvim: Rust language support
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
        ft = { "rust" },
        config = function()
            -- use mason's rust-analyzer if available, otherwise fallback to path
            local ra_path = "rust-analyzer"
            local mason_path = vim.fn.stdpath("data") .. "/mason/bin/rust-analyzer"
            if vim.fn.executable(mason_path) == 1 then
                ra_path = mason_path
            end

            vim.g.rustaceanvim = {
                server = {
                    cmd = { ra_path },
                    on_attach = function(client, bufnr)
                        -- automatically triggers lspattach event in lsp.lua
                    end,
                    default_settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allfeatures = true,
                            },
                            check = {
                                command = "clippy",
                            },
                        },
                    },
                },
            }
        end,
    },
}
