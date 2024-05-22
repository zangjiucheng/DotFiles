# Start Env Desktop
if [ -f ~/.profile ]; then
    source ~/.profile
fi

export PATH=$PATH:/snap/bin

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$PATH:/home/jiucheng/.spicetify
export PATH="$PATH:/opt/nvim-linux64/bin"

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# >>> Bash Setting
export CLICOLOR=1
export LSCOLORS=ExGxFxdaCxDaDahbadeche

autoload -U colors && colors
#PROMPT="%{$fg_bold[magenta]%}%n%{$fg_bold[yellow]%}λ%{$fg_bold[magenta]%}%m %{$fg_bold[green]%}%0~ %{$reset_color%}"


# >>> fzf Setup
# source "$(fzf --zsh)"
source ~/fzf-git.sh/fzf-git.sh
export FZF_DEFAULT_OPTS='--height 60%'

# >>> Alias for eza with bat
alias ezal="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --tree --level=2"
#alias ls="eza"
alias ls='ls --color=auto'

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias scan_wifi='sudo iwlist wlp5s0 scan | grep ESSID'
