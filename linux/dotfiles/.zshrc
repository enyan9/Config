# initialize autocompletion
autoload -U compinit
compinit
bindkey '^X^X' history-beginning-search-menu

# history setup cf: https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/history.zsh
#set history size
HISTSIZE=50000
#save history after logout
SAVEHIST=10000
#history file
HISTFILE=$HOME/.zsh_history
#immediately append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY   
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

setopt HISTIGNORESPACE

# autocompletion using arrow keys (based on history)
# bindkey '\e[A' history-search-backward
# bindkey '\e[B' history-search-forward
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
## Ubuntu zsh distribution
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end
##
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end


# never beep
setopt NO_BEEP

setopt PROMPT_SUBST
function prompt_char {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

# Virtualenv: current working virtualenv
function prompt_virtualenv() {
    [[ -n "$VIRTUAL_ENV" ]] && echo '['`basename "$VIRTUAL_ENV"`']'
        [[ ! "$CONDA_DEFAULT_ENV" = "base" ]] && echo '['`basename "$CONDA_DEFAULT_ENV" | tr -d '\r'`']'
}

PS1='%B%F{160}$(prompt_char)%f %{$reset_color%}%b'
RPROMPT='%{$reset_color%}%B%F{111}$(prompt_virtualenv)%f%B%F{163}[%(!.%1~.%~)]%B%F{160}[%n%f%{$fg_bold[black]%}@%F{160}%m%F{160}]%f%{$reset_color%}'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<