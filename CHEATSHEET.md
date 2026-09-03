# Neovim Keybinds Cheat Sheet

> Generated from plugin file inventory (not the actual config). Defaults are
> listed where a plugin doesn't require explicit keymap setup, and common
> conventions are listed where it does. Verify against the actual config when
> mappings change.

---

## Vanilla Neovim — Windows & Splits

| Key | Action |
|---|---|
| `:sp` / `:split` | Horizontal split (current buffer) |
| `:vsp` / `:vsplit` | Vertical split (current buffer) |
| `:sp <file>` | Horizontal split, open file |
| `:vsp <file>` | Vertical split, open file |
| `Ctrl-w s` | Split horizontally |
| `Ctrl-w v` | Split vertically |
| `Ctrl-w w` | Cycle to next window |
| `Ctrl-w h/j/k/l` | Move to window left/down/up/right |
| `Ctrl-w q` | Close current window |
| `Ctrl-w o` | Close all other windows (keep only current) |
| `Ctrl-w =` | Equalize all window sizes |
| `Ctrl-w _` | Maximize height of current window |
| `Ctrl-w \|` | Maximize width of current window |
| `Ctrl-w +` / `Ctrl-w -` | Increase/decrease height by 1 |
| `Ctrl-w >` / `Ctrl-w <` | Increase/decrease width by 1 |
| `:resize N` / `:res N` | Set height to N lines |
| `:vertical resize N` | Set width to N columns |
| `Ctrl-w x` | Swap current window with next |
| `Ctrl-w r` | Rotate windows |
| `Ctrl-w T` | Move current window to a new tab |

**Resizing with repeat count** — e.g. `10 Ctrl-w +` grows height by 10. This is
often worth remapping to something you can hold, e.g.:

```lua
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
```

## Vanilla Neovim — Tabs & Buffers

| Key | Action |
|---|---|
| `:tabnew <file>` | Open file in new tab |
| `gt` / `:tabnext` | Next tab |
| `gT` / `:tabprevious` | Previous tab |
| `Ngt` | Go to tab number N |
| `:tabclose` | Close current tab |
| `:bnext` / `:bn` | Next buffer |
| `:bprev` / `:bp` | Previous buffer |
| `:bd` | Delete (close) buffer |
| `Ctrl-^` | Toggle between current and last buffer |

## Vanilla Neovim — Misc Essentials

| Key | Action |
|---|---|
| `Ctrl-o` / `Ctrl-i` | Jump back / forward in jumplist |
| `gd` | Go to definition (needs LSP) |
| `gg` / `G` | Top / bottom of file |
| `zz` / `zt` / `zb` | Center / top / bottom current line in view |
| `Ctrl-d` / `Ctrl-u` | Half-page down / up |
| `q:` | Command-line window (edit & rerun past `:` commands) |

---

## Plugin Keybinds

### blink.cmp (`completions.lua`)

Default insert-mode maps under the `default` preset:

| Key | Action |
|---|---|
| `Ctrl-space` | Open/trigger completion menu |
| `Tab` | Move to the next snippet placeholder, otherwise fall back to tabout/Copilot |
| `Shift-Tab` | Move to the previous snippet placeholder, otherwise fall back to tabout |
| `Ctrl-n` / `Ctrl-p` | Next/previous completion item |
| `Ctrl-y` | Accept selected completion |
| `Ctrl-e` | Cancel/close menu |
| `Ctrl-b` / `Ctrl-f` | Scroll documentation up/down |

### copilot.vim (`copilot.lua`)

| Key | Action |
|---|---|
| `Tab` | Accept suggestion when one is available |
| `Ctrl-]` | Dismiss suggestion |
| `Alt-]` | Next suggestion |
| `Alt-[` | Previous suggestion |
| `:Copilot panel` | Open suggestions panel |
| `:Copilot enable` / `:Copilot disable` | Toggle |

### diffview.nvim (`diffview.lua`)

| Command | Action |
|---|---|
| `:DiffviewOpen` | Open diff view against HEAD |
| `:DiffviewOpen <ref>` | Diff against a specific ref/branch |
| `:DiffviewClose` | Close |
| `:DiffviewFileHistory` | File/repository history |
| `:DiffviewFileHistory %` | History of current file |

Inside the diffview panel, defaults include `<Tab>`/`<S-Tab>` to cycle files,
`-` to stage/unstage a hunk, and `co`/`ct`/`cb` to choose ours/theirs/base during
merge conflicts.

### easy-dotnet.nvim (`easy_dotnet.lua`)

| Key/Command | Action |
|---|---|
| `<leader>dp` | Run the default .NET profile |
| `<leader>r` | Run test from the current buffer or selected test |
| `<leader>t` | Run all tests in the current file |
| `<leader>e` | Get build errors |
| `<leader>p` | Peek stack trace |
| `<leader>d` | Debug a test |
| `<leader>g` | Go to file |
| `<leader>R` | Run all tests |
| `<leader>pu` | Upgrade package under cursor |
| `<leader>pa` | Upgrade all outdated packages |
| `:Secrets` | Open .NET user secrets |

The test runner also provides its own context-sensitive mappings for expanding,
collapsing, refreshing, cancelling, and navigating failures.

### folding (`folding.lua`)

| Key | Action |
|---|---|
| `za` | Toggle fold under cursor |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zo` / `zc` | Open / close fold |
| `zj` / `zk` | Move to next/previous fold |

### tiny-inline-diagnostic (`inline_diagnostic.lua`)

Inline diagnostics are enabled by the plugin. Neovim's default virtual text is
disabled so diagnostics are not duplicated.

### nvim-lspconfig (`lsp.lua`)

The configured servers are `rust_analyzer`, `lua_ls`, `somesass_ls`, and the
Roslyn/easy-dotnet servers. LSP-specific mappings not explicitly configured here
remain at Neovim's defaults.

### neo-tree.nvim (`neo-tree.lua`)

| Key | Action |
|---|---|
| `<leader>e` | Toggle filesystem explorer |
| `<leader>E` | Reveal current file |
| `<leader>be` | Toggle buffer explorer |
| `<leader>ge` | Toggle Git explorer |
| `l` / `Enter` | Open file/expand directory |
| `h` | Close directory |
| `P` | Toggle floating preview |
| `Y` | Copy path to clipboard |
| `a` / `d` / `r` | Add / delete / rename |
| `R` | Refresh |
| `?` | Show help |

### nvim-dap (`nvim_dap.lua`)

| Key | Action |
|---|---|
| `<F5>` | Continue/start debugging |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>dq` | Terminate and clear breakpoints |
| `<leader>dO` | Step over (alternate) |
| `<leader>dC` | Run to cursor |
| `<leader>dr` | Toggle DAP REPL |
| `<leader>dj` / `<leader>dk` | Move down/up stack frame |

### tabout.nvim (`tabout.lua`)

| Key | Action |
|---|---|
| `Tab` | Jump out of surrounding bracket/quote pair |
| `Shift-Tab` | Jump backward |

blink.cmp handles its own buffer-local completion/snippet mapping and falls
through to the Copilot/tabout mapping when appropriate.

### telescope.nvim (`telescope.lua`)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fs` | Document symbols |
| `<leader>fd` | Diagnostics |
| `<leader>gd` | Go to definition |
| `<leader>gr` | References |

Inside pickers, `Ctrl-n`/`Ctrl-p` move selection, `Enter` opens, and
`Ctrl-x`/`Ctrl-v`/`Ctrl-t` open in a split, vertical split, or tab.

### nvim-treesitter (`treesitter.lua`)

Tree-sitter highlighting is enabled for C#, Razor, HTML, CSS, JSON, Lua,
TypeScript, and JavaScript. Tree-sitter also provides the folding and tabout
support used by this configuration.
