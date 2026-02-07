-- UI related plugins: theme, statusline, notifications, keybindings helper

return {
    -- monokai theme
    {
        "tanvirtin/monokai.nvim",
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

    -- which-key: keybindings helper
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "buffer local keymaps (which-key)",
            },
        },
    },
}
