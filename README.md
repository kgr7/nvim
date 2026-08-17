## Overview
nvim config that sets up the following basic theming, roslyn LSP, treesitter, telescope, blink.cmp (autocomplete).
i.e. Syntax highlighting for dotnet including .razor files, `gd` goto definition, fuzzy finder.

## Install the following using :Mason

- html-lsp
- css-lsp
- json-lsp
- tree-sitter-cli

Also for quicker fzf telescope implementation, it must be built with cmake. On Windows this will come with visual studio so just find the cmake installed by VS and add it into PATH. Run `:Lazy build telescope-fzf-native.nvim` to build the fzf plugin extension.

Ripgrep `rg` must also be installed and added to path. 

`cc` is required on linux to compile telescope-fzf-native

Must have language server installed for nvim-lspconfig to be able to use it:
`dotnet tool install -g roslyn-language-server --prerelease`

## Future
todo:
- copilot / claude (?)
- inlayed messages from LSP / triggerable show/hide
- fix filename in lualine, update lualine colour to match nvim pane border

---

## Cheatsheep (AI generated, needs refinement)
# Neovim Keybinds Cheat Sheet

> Generated from plugin file inventory (not the actual config). Defaults are
> listed where a plugin doesn't require explicit keymap setup, and common
> conventions are listed where it does. **Verify against your actual
> `vim.keymap.set` calls in each file and edit before committing.**

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
Default insert-mode maps under the `"default"` preset:

| Key | Action |
|---|---|
| `Ctrl-space` | Open/trigger completion menu |
| `Tab` / `Ctrl-n` | Next item |
| `Shift-Tab` / `Ctrl-p` | Previous item |
| `Ctrl-y` / `Enter` | Accept selected item |
| `Ctrl-e` | Cancel/close menu |
| `Ctrl-b` / `Ctrl-f` | Scroll docs up/down |

⚠️ You're also running **tabout.lua**, which likely intercepts `Tab` — check
which one wins for your setup, since both want `Tab`.

### copilot.vim (`copilot.lua`)
| Key | Action |
|---|---|
| `Tab` | Accept suggestion (default, often remapped due to cmp conflict) |
| `Ctrl-]` | Dismiss suggestion |
| `Alt-]` | Next suggestion |
| `Alt-[` | Previous suggestion |
| `:Copilot panel` | Open suggestions panel |
| `:Copilot enable` / `:Copilot disable` | Toggle |

⚠️ Given your `completions.lua` also owns `Tab`/`Ctrl-y`, you've likely
remapped Copilot's accept key to something like `Ctrl-l` or `<C-CR>` — fill
this in.

### diffview.nvim (`diffview.lua`)
Common commands (no default keymaps — all `:Diffview*` commands, bound to
whatever you chose):

| Command | Action |
|---|---|
| `:DiffviewOpen` | Open diff view against HEAD |
| `:DiffviewOpen <ref>` | Diff against a specific ref/branch |
| `:DiffviewClose` | Close |
| `:DiffviewFileHistory` | File/repo history |
| `:DiffviewFileHistory %` | History of current file |

Inside the diffview panel (defaults): `<Tab>`/`<S-Tab>` cycle files, `-`
stages/unstages a hunk, `co`/`ct`/`cb` choose ours/theirs/base during merge
conflicts.

### easy-dotnet.nvim (`easy_dotnet.lua`)
No built-in default keymaps — all Lua function calls you bind yourself, e.g.:

| Typical binding | Function |
|---|---|
| `<leader>dr` | `require("easy-dotnet").run_project()` |
| `<leader>dt` | `require("easy-dotnet").testrunner()` |
| `<leader>db` | `require("easy-dotnet").build_solution()` |
| `<leader>dR` | restore |

This one's entirely yours to fill in — the file is 7.7KB so there's likely a
fair amount of custom mapping here worth documenting fully.

### folding (`folding.lua`)
If native treesitter folding:

| Key | Action |
|---|---|
| `za` | Toggle fold under cursor |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zo` / `zc` | Open / close fold |
| `zj` / `zk` | Move to next/previous fold |

If nvim-ufo, commonly remapped to `zR`/`zM` for open/close all with peek on `K`.

### tiny-inline-diagnostic / lsp_lines (`inline_diagnostic.lua`)
Usually just a toggle, e.g.:
```lua
vim.keymap.set("n", "<leader>l", toggle_inline_diagnostics)
```
Fill in your actual key.

### nvim-lspconfig (`lsp.lua`) — native LSP maps
Commonly set on `LspAttach`:

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `[d` / `]d` | Prev/next diagnostic |
| `<leader>D` | Buffer diagnostics (loclist) |
| `Ctrl-k` | Signature help (insert mode) |

### neo-tree.nvim (`neo-tree.lua`)
| Key | Action |
|---|---|
| `<leader>e` | Toggle Neo-tree (common custom bind) |
| `l` / `Enter` | Open file/expand dir |
| `h` | Close dir |
| `a` | Add file |
| `d` | Delete |
| `r` | Rename |
| `y` / `x` / `p` | Copy / cut / paste |
| `R` | Refresh |
| `?` | Show help |

### nvim-dap (`nvim_dap.lua`)
| Typical binding | Action |
|---|---|
| `<F5>` | Continue/start debugging |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Conditional breakpoint |
| `<leader>dr` | Open REPL |

### nvim-dap-ui (`nvim_dap_ui.lua`)
| Typical binding | Action |
|---|---|
| `<leader>du` | Toggle DAP UI |
| `<leader>de` | Eval expression under cursor |

### tabout.nvim (`tabout.lua`)
| Key | Action |
|---|---|
| `Tab` | Jump out of surrounding bracket/quote pair |
| `Shift-Tab` | Jump back in |

⚠️ Conflicts with completion `Tab` above — worth a note in your cheat sheet
about the actual precedence you've configured.

### telescope.nvim (`telescope.lua`)
| Typical binding | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fo` | Old/recent files |
| `<leader>fr` | Resume last picker |

Inside picker (defaults): `Ctrl-n`/`Ctrl-p` move selection, `Enter` open,
`Ctrl-x`/`Ctrl-v`/`Ctrl-t` open in split/vsplit/tab, `Ctrl-c` close.

### nvim-treesitter (`treesitter.lua`)
If using `nvim-treesitter-textobjects`:

| Key | Action |
|---|---|
| `af` / `if` | Around/inside function (textobject) |
| `ac` / `ic` | Around/inside class |
| `]f` / `[f` | Next/previous function start |
| `]m` / `[m` | Next/previous method |

---

## Gaps to fill in

These files almost certainly have **custom** leader-key bindings I can't see:
- `easy_dotnet.lua` — biggest unknown, custom .NET commands
- `neo-tree.lua`, `telescope.lua`, `nvim_dap*.lua` — leader-key choice varies a lot
- `tabout.lua` vs `completions.lua` (blink.cmp) — actual `Tab` precedence
- `copilot.vim` accept key (likely remapped off `Tab`)
- `inline_diagnostic.lua`, `folding.lua` — toggle keys

Send me the leader key and any of the actual `vim.keymap.set(...)` lines for
these and I'll fold them in and tighten this up.
