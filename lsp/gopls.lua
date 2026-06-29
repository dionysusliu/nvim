return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.mod', '.git' },
    settings = {
        gopls = {
            semanticTokens = true,
        },
    },
    on_attach = function(client, bufnr)
        if client.server_capabilities.semanticTokensProvider then
            vim.lsp.semantic_tokens.start(bufnr, client.id)
        end
    end,
}
