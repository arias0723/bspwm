#!/bin/zsh
setopt NO_singlelinezle
() {
  emulate -L zsh
  zmodload -F zsh/parameter p:functions

  # Workaround for https://github.com/zdharma/zinit/issues/366
  [[ -v functions[.zinit-shade-off] ]] &&
    .zinit-shade-off "${___mode:-load}"

  typeset -gHa _autocomplete__options=(
    clobber localoptions localtraps extendedglob rcquotes
    NO_aliases NO_banghist NO_listbeep NO_shortloops NO_warncreateglobal
  )
  setopt $_autocomplete__options

  typeset -gU FPATH fpath=( ${${(%):-%x}:h}/*(-/) $fpath )

  builtin autoload -Uz .autocomplete.__init__
  .autocomplete.__init__

  # Workaround for https://github.com/zdharma/zinit/issues/366
  [[ -v functions[.zinit-shade-on] ]] &&
    .zinit-shade-on "${___mode:-load}"

  return 0
}
