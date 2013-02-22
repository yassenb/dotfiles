autoload -U compinit promptinit colors
compinit
promptinit
colors

setopt AUTO_CD
setopt AUTO_PUSHD
setopt HIST_IGNORE_DUPS APPEND_HISTORY HIST_IGNORE_SPACE

export PS1="%m%(?..%{${fg[red]}%})%B%# %{${fg[default]}%}%b"
RPS1="    %~"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias -r ls="ls -F --color=auto" \
         ll="ls -l" \
         la="ls -al" \
         grep="grep --color=auto" \
         xo="xdg-open" \

source ~/.zsh/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search.zsh
[[ -r "$HOME/.rvm/scripts/rvm" ]] && source ~/.rvm/scripts/rvm

bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down
bindkey "${terminfo[kent]}" accept-line

compdef -d git
