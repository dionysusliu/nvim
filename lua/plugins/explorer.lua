-- File explorer and search plugins

return {
    -- neo-tree: modern file explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = true,
                filesystem = {
                    follow_current_file = {
                        enabled = false,  -- 禁用自动跟随，提升性能
                    },
                    use_libuv_file_watcher = true,  -- 使用高效的文件监控
                },
                window = {
                    position = "left",
                    width = 30,
                },
            })

            -- 快捷键绑定
            vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "toggle file explorer" })
            vim.keymap.set("n", "<leader>f", ":Neotree focus<CR>", { noremap = true, silent = true, desc = "focus on file explorer" })
        end
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
        },
        config = function()
          require("lsp-file-operations").setup()
        end,
    },
    {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                -- if the buffer type is one of following, the window will be ignored
                buftype = { "terminal", "quickfix" },
              },
            },
          })
        end,
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
            vim.keymap.set("n", "<leader>fc", function()
                require('telescope.builtin').find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end, { desc = "find files in neovim config" })
        end
    },
}
