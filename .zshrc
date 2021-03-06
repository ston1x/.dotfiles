bindkey -v
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source /usr/local/Cellar/fzf/0.22.0/shell/key-bindings.zsh
setopt PROMPT_SUBST
setopt +o nomatch

precmd() {
  if [ -d ".git" ]
  then
    export GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    PS1=$'\n%~ $fg[blue]$GIT_BRANCH$reset_color\n$ '
  else
    PS1=$'\n%~\n$ '
  fi
}

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='vim'
export PATH=~/.dotfiles/bin:/usr/local/bin:/usr/local/sbin:$PATH
export FZF_DEFAULT_COMMAND='rg --files ---hidden --follow -g "!.git" 2> /dev/null'
export FZF_DEFAULT_OPTS='--bind ctrl-a:select-all'
export HOMEBREW_INSTALL_CLEANUP=true
export KEYTIMEOUT=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export EDITOR=nvim

alias ls='ls -G'
alias brails='bin/spring rails'
alias brake='bin/spring rake'
alias reload!='source ~/.zshrc'
alias be='bundle exec'
alias sp='bin/spring'
alias rm='trash'

function gentags() {
  echo "Exporting tags..."
  ripper-tags -R -f .git/rubytags --tag-relative=yes
  ctags -R -f .git/tags --tag-relative=yes --languages=coffee,javascript,python,php,java
}

function j {
	cd -P "$MARKDIR/$1"
}

function _completemarks {
  reply=($(ls $MARKDIR))
}

compctl -K _completemarks j
