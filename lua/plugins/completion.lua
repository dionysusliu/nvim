-- Auto-completion plugins

return {
    -- blink.cmp: fast completion engine
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "*",

        opts = {
           keymap = {
                preset = "enter",
                -- selection
                ["<Up>"] = {"select_prev", "fallback"},
                ["<Down>"] = {"select_next", "fallback"},
                ["<Tab>"] = {"select_next", "fallback"},
                ["<S-Tab>"] = {"select_prev", "fallback"},
                -- scroll documentation
                ["<C-b>"] = {"scroll_documentation_up", "fallback"},
                ["<C-f>"] = {"scroll_documentation_down", "fallback"},
                -- show/hide signature
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback"},
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            sources = {
                default = {"lsp", "path", "snippets", "buffer" },
            },

            fuzzy = {
                implementation = "prefer_rust_with_warning"
            },

            completion = {
                keyword = { range = "prefix" },
                menu = {
                    -- Use treesitter to highlight the label text
                    draw = {
                        treesitter = {"lsp"},
                    }
                },
                -- show completions
                trigger = { show_on_trigger_character = true },
                documentation = {
                    -- show docs automatically
                    auto_show = true,
                }
            },

            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },
}
