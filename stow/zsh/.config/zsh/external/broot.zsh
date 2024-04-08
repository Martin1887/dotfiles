
zmodload zsh/mapfile

# -- Run broot, cd into pathfile if successful --
# Depends: zmapfile
br () {  # [<broot-opt>...]
  emulate -L zsh

  local pathfile=$(mktemp)
  trap "rm ${(q-)pathfile}" EXIT INT QUIT
  if { broot --verb-output "$pathfile" $@ } {
    if [[ -r $pathfile ]] {
      local folder=${mapfile[$pathfile]}
      if [[ $folder ]]  cd $folder
    }
  } else {
    return
  }
}

# -- Refresh prompt, rerunning any hooks --
# Credit: Roman Perepelitsa
# Original: https://github.com/romkatv/zsh4humans/blob/v2/fn/-z4h-redraw-prompt
.zle_redraw-prompt () {
  for 1 ( chpwd $chpwd_functions precmd $precmd_functions ) {
    if (( $+functions[$1] ))  $1 &>/dev/null
  }
  zle .reset-prompt
  zle -R
}
zle -N .zle_redraw-prompt

# -- Folder Navigation --
# Key: ctrl+B
# Depends: ~/.config/broot/select-folder.hjson
# Optional: .zle_redraw-prompt
.zle_cd-broot () {
  echoti rmkx
  cd "$(
    <$TTY broot --color yes --git-ignored --show-git-info --only-folders \
    --conf "${XDG_CONFIG_HOME:-${HOME}/.config}/broot/select-folder.hjson;${XDG_CONFIG_HOME:-${HOME}/.config}/broot/conf.hjson"
  )"
  if (( $+functions[.zle_redraw-prompt] ))  zle .zle_redraw-prompt
  if (( $+functions[_zsh_highlight]     ))  _zsh_highlight
}
zle -N            .zle_cd-broot
bindkey "^B" .zle_cd-broot  # alt+down


# -- Complete current word as path using broot --
# Key: ctrl+F
# Depends: ~/.config/broot/select.hjson
.zle_insert-path-broot () {
  setopt localoptions extendedglob

  # If the current word is partially typed, grab it (partial),
  # pop it off the line, and create a search string for it (broot_search)
  local partial broot_search
  if [[ ${LBUFFER[-1]/ } ]] {

    # Store it (partial)
    partial=(${(z)LBUFFER})
    partial=${partial[-1]}

    # Remove it from the line
    LBUFFER=${LBUFFER[1,-$#partial-1]}

    # Expand home folder
    partial=${partial/#(\$HOME\/|\~\/)/~\/}

    # Store a sanitized version for broot search (broot_search)
    broot_search=${partial/#~\/}                 # strip leading '~/'
    broot_search=${broot_search//( |:|..\/|\;)}  # strip ' ', ':', '../', ';'
    broot_search=${broot_search//.\/}            # strip './'
    broot_search=${broot_search//\//\\/}         # replace '/' with '\/'

  }

  # If resulting search string starts with '.' or ends with '/.',
  # search hidden files (can be slow)
  local show_hidden=--no-hidden
  if [[ $broot_search[1] == . || $broot_search[-2,-1] == /. ]]  show_hidden=--hidden

  # If partial has leading '/', '../', or ~/,
  # set broot start folder (start_dir)
  local start_dir
  if [[ $partial == ~/* ]] {
    start_dir=~
  } else {
    local updirs=${(M)partial##(../|/)##}
    start_dir=${updirs:-.}
  }

  # Get a location (or not) from broot,
  # using select.hjson config
  echoti rmkx
  local locations=(${(f)"$(
    <$TTY broot --color yes --cmd "$broot_search" $show_hidden --no-sizes \
    --conf "${XDG_CONFIG_HOME:-${HOME}/.config}/broot/select.hjson;${XDG_CONFIG_HOME:-${HOME}/.config}/broot/conf.hjson" \
    $start_dir
  )"})

  # Add location to line or restore original partial
  if [[ $locations ]] {

    # If GNU coreutils realpath is present,
    # convert some paths from absolute to relative
    if (( $+commands[realpath] )) {
      if [[ $(realpath --help 2>&1) == *--relative-base* ]] {
        local locations_abs=($locations) loc
        locations=()
        for loc ( $locations_abs )  locations+=("$(realpath --relative-base ~ --relative-to . $loc)")
      }
    }

    # Ensure minimal and sufficient quoting
    locations=(${(q-)locations})

    LBUFFER+="$locations "
  } else {
    LBUFFER+=$partial
  }

  # If using fast-syntax-highlighting, retrigger it
  if (( $+functions[_zsh_highlight] ))  _zsh_highlight

}
zle -N       .zle_insert-path-broot
bindkey "^F" .zle_insert-path-broot  # ctrl+F
