## Overview

This Neovim configuration provides Tokyo Night theming, LSP support, Tree-sitter syntax highlighting and folding, Telescope, blink.cmp completion, Copilot inline suggestions, Neo-tree, Git integration, and .NET tooling through easy-dotnet.nvim.

See [CHEATSHEET.md](CHEATSHEET.md) for the broader Neovim and plugin reference.

## Install LSPs with Mason

Install these packages from `:Mason` as needed:

- `lua-language-server`
- `rust-analyzer`
- `some-sass-language-server`
- `html-lsp`
- `css-lsp`
- `json-lsp`
- `tree-sitter-cli`

The TypeScript tools plugin also needs a TypeScript installation. easy-dotnet manages its own Roslyn tooling and requires the .NET SDK and its documented dotnet tool setup.

`rg` is required by Telescope's live grep. `make` plus a C compiler, or CMake plus a C compiler, is required to build `telescope-fzf-native.nvim`; run `:Lazy build telescope-fzf-native.nvim` after installing the dependencies.

## Keybindings

Leader is `<Space>`.

| Key | Action |
|---|---|
| `<leader>e` | Toggle filesystem explorer |
| `<leader>E` | Reveal current file in explorer |
| `<leader>be` | Toggle buffer explorer |
| `<leader>ge` | Toggle Git explorer |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List buffers |
| `<leader>fs` | Document symbols |
| `<leader>fd` | Diagnostics |
| `<leader>gd` | Go to definition with Telescope |
| `<leader>gr` | Find references with Telescope |
| `<leader>>` / `<leader><` | Resize the current vertical split |
| `<leader>b` | Toggle breakpoint |
| `<leader>dq` | Terminate debugging and clear breakpoints |
| `<leader>dr` | Toggle DAP REPL |
| `<leader>dp` | Run the default .NET profile |
| `<C-p>` | Previous line in normal mode; previous completion item in insert mode |

The completion engine is blink.cmp. `<C-space>` opens completion, `<C-y>` accepts, `<C-n>`/`<C-p>` navigate, and `<Tab>`/`<S-Tab>` move through snippets or tab out of paired syntax. Copilot uses its normal inline-suggestion integration and falls back through the Tab mapping.

DAP also provides `<F5>` continue, `<F10>` step over, `<F11>` step into, `<F12>` step out, `<leader>dO` step over, `<leader>dC` run to cursor, and `<leader>dj`/`<leader>dk` move between stack frames.

Useful commands include `:DiffviewOpen`, `:DiffviewFileHistory`, `:DiffviewClose`, `:Mason`, `:Secrets`, and `:Copilot setup`.
