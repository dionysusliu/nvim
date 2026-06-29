-- yazi: terminal file manager integration

return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
        "folke/snacks.nvim",
    },
    keys = {
        -- Open yazi at current file's directory
        { "<leader>y", "<cmd>Yazi<cr>", desc = "open yazi at current file" },
        -- Open yazi at working directory
        { "<leader>Y", "<cmd>Yazi cwd<cr>", desc = "open yazi at cwd" },
        -- Resume last yazi session
        { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "resume yazi session" },
    },
    opts = {
        open_for_directories = false,
        floating_window_scaling_factor = 0.9,
        yazi_floating_window_border = "rounded",
    },
}
