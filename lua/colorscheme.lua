-- define colorscheme
local colorscheme = 'catppuccin-latte'

local function apply_lsp_semantic_highlights()
    local links = {
        ["@lsp.type.class"] = "@type",
        ["@lsp.type.comment"] = "@comment",
        ["@lsp.type.decorator"] = "@attribute",
        ["@lsp.type.enum"] = "@type",
        ["@lsp.type.enumMember"] = "@constant",
        ["@lsp.type.function"] = "@function",
        ["@lsp.type.interface"] = "@type",
        ["@lsp.type.keyword"] = "@keyword",
        ["@lsp.type.macro"] = "@function.macro",
        ["@lsp.type.method"] = "@method",
        ["@lsp.type.namespace"] = "@namespace",
        ["@lsp.type.number"] = "@number",
        ["@lsp.type.operator"] = "@operator",
        ["@lsp.type.parameter"] = "@parameter",
        ["@lsp.type.property"] = "@property",
        ["@lsp.type.string"] = "@string",
        ["@lsp.type.struct"] = "@type",
        ["@lsp.type.type"] = "@type",
        ["@lsp.type.typeParameter"] = "@type",
        ["@lsp.type.variable"] = "@variable",
        ["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
        ["@lsp.typemod.method.defaultLibrary"] = "@function.builtin",
        ["@lsp.typemod.type.defaultLibrary"] = "@type.builtin",
        ["@lsp.typemod.variable.defaultLibrary"] = "@variable.builtin",
        ["@lsp.typemod.variable.readonly"] = "@constant",
    }

    for from, to in pairs(links) do
        vim.api.nvim_set_hl(0, from, { link = to })
    end
end

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

local group = vim.api.nvim_create_augroup("user_lsp_semantic_highlights", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = apply_lsp_semantic_highlights,
})

apply_lsp_semantic_highlights()



