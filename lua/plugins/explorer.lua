-- File explorer and search plugins

return {
    -- nvim-tree: file explorer
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
            -- direct keybindings to avoid which-key delay
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "toggle file explorer" })
            vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "focus on file explorer" })
        end
    },

    -- telescope: fuzzy finder and search
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            vim.keymap.set("n", "<leader>fd", require('telescope.builtin').find_files, { desc = "find files in pwd" })
            vim.keymap.set("n", "<leader>fs", require('telescope.builtin').lsp_document_symbols, { desc = "list symbols in current buffer "})
            vim.keymap.set("n", "<leader>fs", require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = "list symbols in current workspace "})
            vim.keymap.set("n", "<leader>fg", require('telescope.builtin').live_grep, { desc = "project wide grep"})
            vim.keymap.set("n", "<leader>fw", require('telescope.builtin').grep_string, { desc = "search current word"})
            vim.keymap.set("n", "<leader>fz", require('telescope.builtin').current_buffer_fuzzy_find, { desc = "file wide grep"})
            vim.keymap.set("n", "<leader>en", function()
                require('telescope.builtin').find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end)
        end
    },
}
