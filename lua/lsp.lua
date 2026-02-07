-- Remove Global Default Key mapping
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")

-- Create keymapping
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        local keymap = vim.keymap
        local lsp = vim.lsp
	    local bufopts = { noremap = true, silent = true }

        keymap.set("n", "gr", lsp.buf.references, bufopts) --- reference
        keymap.set("n", "gd", lsp.buf.definition, bufopts) --- definition
        keymap.set("n", "<space>rn", lsp.buf.rename, bufopts) --- rename
        keymap.set("n", "K", lsp.buf.hover, bufopts) --- hover
        keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts) --- formatter
    end
})

vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = false,
    float = { border = "rounded" },
    update_in_insert = false,
})

vim.lsp.enable({ "ty", "clangd", "marksman" })
