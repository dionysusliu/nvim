-- File explorer and search plugins

return {
    -- telescope: fuzzy finder and search
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            vim.keymap.set("n", "<leader>fd", require('telescope.builtin').find_files, { desc = "find files in pwd" })
            vim.keymap.set("n", "<leader>fs", require('telescope.builtin').lsp_document_symbols, { desc = "list symbols in current buffer" })
            vim.keymap.set("n", "<leader>fS", require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = "list symbols in workspace" })
            vim.keymap.set("n", "<leader>fx", require('telescope.builtin').diagnostics, { desc = "list diagnostics" })
            vim.keymap.set("n", "<leader>fg", require('telescope.builtin').live_grep, { desc = "project wide grep"})
            vim.keymap.set("n", "<leader>fw", require('telescope.builtin').grep_string, { desc = "search current word"})
            vim.keymap.set("n", "<leader>fz", require('telescope.builtin').current_buffer_fuzzy_find, { desc = "file wide grep"})
            vim.keymap.set("n", "<leader>fc", function()
                require('telescope.builtin').find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end, { desc = "find files in neovim config" })
            vim.keymap.set("n", "<leader>qf", require('telescope.builtin').quickfix, { desc = "list quick fix"})
        end
    },
}
