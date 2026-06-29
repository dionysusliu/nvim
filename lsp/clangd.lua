return {
    cmd = { '/opt/homebrew/opt/llvm/bin/clangd', '--background-index' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = { 'compile_commands.json', '.git' },
}
