ZSH completions and configuration. Completions and some ideas taken from
https://github.com/Phantas0s/mouseless-book-companion.

The following commands are available:

- `bd` to cd to back directories (`bd <number>` or `bd <directory_number>`).
- `d` to list the last visited directories and `<number>` to jump to the
directory with that number.

fzf is configured using ripgrep (both must be installed) and the default
mappings are available:
- CTRL+t to search files in subdirectories
- CTRL+r to search in history
- ALT+c to navigate into a sub-directory

zoxide and starship must also be installed.

This configuration also sets some broot mappings, see the broot directory of
this repository.
