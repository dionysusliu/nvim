-- Editor enhancement plugins: syntax, navigation, editing tools

return {
    -- treesitter: syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = { "marksdown", "markdown_inline", "c", "cpp" },
            highlight = { enable = true },
        },
    },

    -- flash: enhanced navigation
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type flash.config
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash"},
            { "s", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "remote flash" },
            { "r", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "treesitter search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "toggle flash search" },
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
}
