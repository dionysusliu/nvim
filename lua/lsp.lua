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

        keymap.set("n", "gr", require('telescope.builtin').lsp_references, bufopts) --- reference
        keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, bufopts) --- definition
        keymap.set("n", "<space>rn", lsp.buf.rename, bufopts) --- rename
        keymap.set("n", "K", lsp.buf.hover, bufopts) --- hover
        keymap.set("n", "E", vim.diagnostic.open_float, bufopts) -- diagnostic messages
        keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts) --- formatter
        keymap.set("n", "<space>ca", lsp.buf.code_action, bufopts) --- code action, like quickfix, refractor, ...
    end
})

vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = false,
    float = { border = "rounded" },
    update_in_insert = false,
})

-- 配置LSP浮动窗口（hover、signature help等）
-- 设置自动换行和最大宽度，防止内容超出窗口
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    opts.max_width = opts.max_width or math.floor(vim.o.columns * 0.7)
    opts.max_height = opts.max_height or math.floor(vim.o.lines * 0.5)
    opts.wrap = true  -- 启用自动换行
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.lsp.enable({ "ty", "ruff", "clangd", "marksman", "gopls" })
