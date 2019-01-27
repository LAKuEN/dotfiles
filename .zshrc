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
export webenv=$HOME/pyenv/webenv/bin/activate

# Prompt周りの設定
PROMPT='%K{blue}%F{white}  %K{white}%F{blue}%n %K{blue}%F{white}%1~ %k%F{blue}
%k%f'
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=""%F{white}'${vcs_info_msg_0_}'

# zsh起動時にtmux起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux
