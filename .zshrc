#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
export XDG_CONFIG_HOME="$HOME/.config"
export IMGENV=$HOME/pyenv/imgenv/bin/activate
export MLENV=$HOME/pyenv/mlenv/bin/activate
export WEBENV=$HOME/pyenv/webenv/bin/activate
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

PROMPT='%K{white}%F{blue} %n %K{blue}%F{white} %1~ %k%F{blue}
%k%f%% '
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=""%F{white}'${vcs_info_msg_0_}'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=1000000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

[[ -s "/home/lakuen/.gvm/scripts/gvm" ]] && source "/home/lakuen/.gvm/scripts/gvm"

setopt nonomatch

# For Java
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
