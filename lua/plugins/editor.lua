-- Editor enhancement plugins: syntax, navigation, editing tools

return {
    -- treesitter: syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                "marksdown",
                "markdown_inline",
                "python",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "c",
                "cpp",
                "rust",
                "json",
                "toml",
            },
            highlight = {
                enable = true
            },
            indent = {
                enable = true,
                disable = { "python" },
            },
        }
    },

    -- flash: enhanced navigation
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type flash.config
        opts = {
            jump = {
                jumplist = true,
            },
        },
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash"},
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "remote flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "treesitter search" },
            { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "toggle flash search" },
        },
    },

    -- neoscroll: smooth scrolling for Ctrl-U/D/F/B/Y/E, zt/zz/zb
    {
        "karb94/neoscroll.nvim",
        enabled = false,
        opts = {
            hide_cursor = true,
            easing = "linear",
            duration_multiplier = 1.0,
        },
    },

    -- splitjoin: gS split one-liner, gJ join block
    {
        "AndrewRadev/splitjoin.vim",
        keys = {
            { "gS", mode = "n" },
            { "gJ", mode = "n" },
        },
    },

    -- comment: block comment
    {
       "numtostr/comment.nvim",
        opts = {},
    },

    -- autopairs: auto-close brackets and quotes
    {
        "windwp/nvim-autopairs",
        event = "insertenter",
        config = true,
    },

    -- aerial: in-file symbols outline
    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
         },
         config = function()
           require("aerial").setup({
             layout = {
               max_width = { 40, 0.2 },
               default_direction = "right",
             },
             highlight_on_hover = true,
             filter_kind = {
               "Class", "Constructor", "Enum", "Function", "Interface", "Module", "Method"
             },
           })
           vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
         end
    },

    -- waka time: editor usage tracking 
    {
        'wakatime/vim-wakatime',
        lazy = false,
    },


    -- add / change / delete surrounding pairs
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
                keymaps = {
                    visual = "gs",
                    visual_line = "gS",
                },
            })
        end
    }; 
}
