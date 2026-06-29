# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration written in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. The config targets C/C++, Rust, Python, and Markdown development.

## Architecture

**Entry point:** `init.lua` — loads `options`, `keymaps`, bootstraps lazy.nvim, then loads all `lua/plugins/*.lua` files automatically via `require("lazy").setup("plugins")`, and finally loads `colorscheme` and `lsp`.

**Module layout:**
- `lua/options.lua` — vim options (tabs, UI, search, clipboard)
- `lua/keymaps.lua` — base keymaps (leader = `<Space>`, `jk` → Esc, window nav)
- `lua/colorscheme.lua` — sets `monokai_ristretto` theme
- `lua/lsp.lua` — LSP attach keymaps, diagnostic config, floating window overrides, and `vim.lsp.enable()` calls
- `lua/plugins/` — one file per concern, each returns a lazy.nvim plugin spec table
- `lsp/` — built-in LSP config files (Neovim 0.11+ `vim.lsp.config` format) for `ty` (Python) and `clangd`

**Plugin files:**
| File | Responsibility |
|------|----------------|
| `lua/plugins/lsp.lua` | mason, mason-lspconfig, rustaceanvim |
| `lua/plugins/editor.lua` | treesitter, flash, comment, autopairs, aerial (`<leader>a`), surround, wakatime |
| `lua/plugins/explorer.lua` | neo-tree (`<leader>e`/`<leader>f`), telescope (`<leader>f*`), window-picker |
| `lua/plugins/completion.lua` | blink.cmp with LSP/path/snippets/buffer sources |
| `lua/plugins/ui.lua` | monokai theme, transparent.nvim, lualine, fidget |
| `lua/plugins/extras.lua` | image.nvim (magick_cli), im-select (macOS input method) |

## LSP Setup

LSP uses Neovim's built-in client (0.11+), not nvim-lspconfig:
- **Python:** `ty` server, configured in `lsp/ty.lua`, auto-detects `.venv/bin/python`
- **C/C++:** `clangd` — managed by mason-lspconfig, config in `lsp/clangd.lua` and `lua/plugins/lsp.lua`
- **Markdown:** `marksman` — managed by mason-lspconfig
- **Rust:** `rustaceanvim` handles rust-analyzer (prefers mason-installed binary)

LSP keymaps (set on `LspAttach`): `gr` refs, `gd` def, `<space>rn` rename, `K` hover, `E` diagnostics, `<space>f` format.

## Key Telescope Bindings

`<leader>fd` find files, `<leader>fg` live grep, `<leader>fw` grep word, `<leader>fs` document symbols, `<leader>fS` workspace symbols, `<leader>fx` diagnostics, `<leader>fc` find in nvim config dir.

## Adding Plugins

Add a new `.lua` file to `lua/plugins/` returning a lazy.nvim spec, or append to an existing file that matches the plugin's concern. lazy.nvim picks up all files in that directory automatically.

## Adding LSP Servers

Either add a config file to `lsp/` (for built-in LSP) and call `vim.lsp.enable()` in `lua/lsp.lua`, or add to `ensure_installed` in `lua/plugins/lsp.lua` and configure via `vim.lsp.config()`.
