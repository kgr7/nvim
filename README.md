## Overview
nvim config that sets up the following basic theming, roslyn LSP, treesitter, telescope, blink.cmp (autocomplete).
i.e. Syntax highlighting for dotnet including .razor files, `gd` goto definition, fuzzy finder.

## Install the following using :Mason

- roslyn
- html-lsp
- css-lsp
- json-lsp
- tree-sitter-cli

Also for quicker fzf telescope implementation, it must be built with cmake. On Windows this will come with visual studio so just find the cmake installed by VS and add it into PATH. Run `:Lazy build telescope-fzf-native.nvim` to build the fzf plugin extension.

Ripgrep `rg` must also be installed and added to path. 

## Future
todo:
- Nerd font (better icons for telescope etc.)
- copilot / claude (?)

