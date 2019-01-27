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

# pwdは切り詰めて表示
PROMPT="%K{blue}%F{white}  %K{white}%F{blue}%n %K{blue}%F{white}$(pwd | sed -e "/^.\{30,\}$/s/^\(.\{15\}\).*\(.\{15\}\)$/\1...\2/") %k%F{blue}
%k%f"

# zsh起動時にtmux起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux
