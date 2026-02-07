-- Extra utility plugins

return {
    -- image.nvim: display images in neovim
    {
        "3rd/image.nvim",
        build = false,
        opts = {
            processor = "magick_cli",
        }
    },

    -- im-select: automatic input method switching
    {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({
                default_im_select = "com.apple.keylayout.US",
                set_default_events = {
                    "InsertLeave",
                    "CmdlineLeave",
                    "FocusGained",
                },
                set_previous_events = {
                    "InsertEnter",
                    "FocusLost",
                },
            })
        end,
    },
}
