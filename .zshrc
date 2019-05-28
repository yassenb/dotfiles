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
         be="bundle exec" \

source ~/.zsh/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search.zsh

bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down
bindkey "${terminfo[kent]}" accept-line

[ $(command -v rbenv) ] && eval "$(rbenv init -)"
[ $(command -v direnv) ] && eval "$(direnv hook zsh)"
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# if this is removed and the last expression above has a bad exit code zsh will start with showing a bad exit code from
# the previously executed command
true
