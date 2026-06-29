-- UI related plugins: theme, statusline, notifications, keybindings helper

return {
    -- monokai theme
    {
        "tanvirtin/monokai.nvim",
        opts = {
            -- transparent = vim.g.transparent_enabled,
            -- styles = {
            --     sidebars = "transparent",
            --     floats = "transparent",
            -- },
        },
    },

    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},

    -- catppuccin theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "latte",
            integrations = {
                flash = true,
            },
            custom_highlights = function(colors)
                return {
                    -- Flash.nvim: stronger contrast under Latte light theme
                    FlashBackdrop = { fg = colors.overlay0 },
                    FlashMatch = { fg = colors.base, bg = colors.sky, bold = true },
                    FlashCurrent = { fg = colors.base, bg = colors.peach, bold = true },
                    FlashLabel = { fg = "#ffffff", bg = colors.red, bold = true },
                }
            end,
        },
    },

    {
        "xiyaowong/transparent.nvim",
        lazy = false,
    },

    -- lualine statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'auto',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {
                        {
                            'filename',
                            path = 1,
                        },
                        {
                            'aerial',
                            depth = nil,
                            sep = ' > ',
                        },
                    },
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
            })
        end,
    },

    -- background lsp progress notifications
    {
        "j-hui/fidget.nvim",
        opts = {},
    },

    -- -- which-key: keybindings helper
    -- {
    --     "folke/which-key.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     keys = {
    --         {
    --             "<leader>?",
    --             function()
    --                 require("which-key").show({ global = false })
    --             end,
    --             desc = "buffer local keymaps (which-key)",
    --         },
    --     },
    -- },
}
