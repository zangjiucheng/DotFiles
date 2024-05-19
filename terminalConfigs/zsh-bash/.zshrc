

# >>> Doom Emcas
export PATH="/Users/jiucheng/.config/emacs/bin:$PATH"
# <<< Doom Emacs End

# >>> Brew Setup
eval "$(/opt/homebrew/bin/brew shellenv)"
# <<< Brew End

# >>> Bash Setting
export CLICOLOR=1
export LSCOLORS=ExGxFxdaCxDaDahbadeche
autoload -U colors && colors
PROMPT="%{$fg_bold[magenta]%}%n%{$fg_bold[yellow]%}λ%{$fg_bold[magenta]%}%m %{$fg_bold[green]%}%0~ %{$reset_color%}"
alias g++20="g++ -std=c++20 -Wall -g"

#alias vim="vim -X"
# <<< Bash End

# >>> VIM >>>
export EDITOR=vim
export VISUAL="$EDITOR"
# <<< VIM End <<<

# >>> MacTex Setup >>>
export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"
# <<< MacTex End <<<

# <<< Spicetify Setup
export PATH=$PATH:/Users/jiucheng/.spicetify
# >>> Spicetify End

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Volumes/DevU/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Volumes/DevU/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Volumes/DevU/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Volumes/DevU/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# <<< pyenv End

# >>> Racket Setup
export PATH="/Applications/Racket/bin:$PATH"
# <<< Racket End

# >>> MMIX Setup
export PATH="/Users/jiucheng/Documents/MMIX:$PATH"
# <<< MMIX End

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# >>> fzf Setup
eval "$(fzf --zsh)"
source ~/fzf-git.sh/fzf-git.sh
export FZF_DEFAULT_OPTS='--height 60%'
# <<< fzf End

# >>> Alias for eza with bat
alias ezal="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --tree --level=2"

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}
# <<< eza End

##### <<< VIM STUFF
bindkey '\e' vi-cmd-mode
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1
function zle-line-init zle-keymap-select {
  RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
  RPS2=$RPS1
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
# >>> VIM END <<<
