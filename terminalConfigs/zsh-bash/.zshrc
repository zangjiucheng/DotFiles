___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export PATH="/Applications/Racket v8.10/bin:/Users/jiucheng/.config/emacs/bin:$PATH"
export MAMBA_EXE="/Users/jiucheng/.micromamba/bin/micromamba";
export MAMBA_ROOT_PREFIX="/Users/jiucheng/micromamba";
__mamba_setup="$('/Users/jiucheng/.micromamba/bin/micromamba' shell hook --shell zsh --prefix '/Users/jiucheng/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/Users/jiucheng/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/Users/jiucheng/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/Users/jiucheng/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> Bash Setting
export CLICOLOR=1
export LSCOLORS=ExGxFxdaCxDaDahbadeche
autoload -U colors && colors
PROMPT="%{$fg_bold[magenta]%}%n%{$fg_bold[yellow]%}λ%{$fg_bold[magenta]%}%m %{$fg_bold[green]%}%1~ %{$reset_color%}"
# <<< Bash End

# >>> VIM >>>
export VIM_HOME=/usr/local/Cellar/vim/8.2.2100/
export PATH=$PATH:$VIM_HOME/bin
export EDITOR=vim
export VISUAL="$EDITOR"
# <<< VIM End <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jiucheng/micromamba/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jiucheng/micromamba/etc/profile.d/conda.sh" ]; then
        . "/Users/jiucheng/micromamba/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jiucheng/micromamba/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> iterm2 config
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
# <<< iterm2 End <<<

export TEXMFHOME="${HOME}/.texmf"

# >>> opam(Ocaml) configuration
[[ ! -r /Users/jiucheng/.opam/opam-init/init.zsh ]] || source /Users/jiucheng/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export PATH=$PATH:/Users/jiucheng/.spicetify
# <<< ocaml End
