# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

This configuration adds some extensions and customizations:

- `broot.nvim` for files search (fzf can be used with `<Space>ff`).
- `numb.nvim` to preview lines when written in the command window.
- gitui keymaps (instead of lazygit ones).
- `<C-x>` to close buffer, `<C-q>` to close window and focus.nvim:
  - `<C-.>` to enable window autoresize (disabled by default).
  - `<C-,>` to disable window autoresize (disabled by default).
  - `<C-h/j/k/l>` to move to window in direction or create it if it does not
    exist.
  - `<C-m>` to maximize/set equal size of windows.
  - `<C-:>` to autoresize by golden ratio (default).
  Per-tab buffers with scope.nvim
- neo-tree source selector winbar and mappings, navigation with
`h` and `l` and modified untracked files highlight.
- Customized lualine with words count, lines and count, encoding and filetype.
- incline.nvim for custom minimal winbars with diagnostics, path and navic for the active window.
- relative-toggle.nvim to show relative numbers only in waiting events.
- `<C-p>` mapping to pick buffer and `<space>bsd` and `<space>bse` to sort them
by directory and extension.
- Legendary command-palette-like search with `<space>P`.
- flash (the new LazyVim default) has replaced hop.nvim (it was replacing the original defaults leap and flit).
- Rust, clangd, Python, markdown
(with markdown-preview disabled) and tex extras.
- DAP, DAPUI and nvim-dap-virtual-text with mappings (DAP core extra).
- vimtex and texlab (with cktex enabled on save) for LaTeX.
- ltex-ls-plus for text, Markdown and LaTeX files.
- harper for grammar check in text and programming languages files.
- typos-lsp.
- `nvim-scissors` configured for nvim-snippets with `<space>cpa` and
`<space>cpe` to add and edit snippets.
- mellifluous (disabled by default) and darker and warmer melange (default)
  colorschemes.
- nvim-scrollbar.
- Minimal notifications in nvim-notify.
- vim-illuminate.
- vim-gitgutter.
- diffview.nvim (`:DiffviewOpen`, `DiffviewFileHistory`): open git diff and
file history view in new tab.
- git-conflict.nvim for mappings and commands to solve and navigate conflicts.
- targets.nvim (new selection targets, like parenthesis).
- ferret (powerful find and replace).
- vim-abolish (`:Abolish`, `:Subvert` and coercion).
- vim-repeat (better dot operator).
- splitjoin.vim (`gS` to split and `gJ` to join).
- vim-matchup for better `%`.
- `https://github.com/hiphish/rainbow-delimiters.nvim` for colorized parenthesis with colors set
  as melangeDarkWarm theme.
- `snacks`'s indent and scope customized with colorful rainbow-like indent lines.
- dial extra to cycle among boolean values and other things (`<C-x>` is changed to `<C-z>`).
- tint to tint inactive windows.
- nvim-spider for subword and skipping punctuation `w,e,b,ge` movements.
- nvim-rip-substitute at `<space>fs` for a modern search/replace with ripgrep and friendly syntax.
- <https://github.com/PontusHanssen/pddl.vim> for PDDL syntax highlighting.
