#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

if [ -z $ZSH_ENV_LOADED ]; then
  # CapsをCtrlに入替え
  setxkbmap -option ctrl:nocaps
  export GOPATH=$HOME/repo/go
  export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
  export ZSH_ENV_LOADED="1"
else
  # print ".zshenv の 読み込みをスキップしました \n"
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# 仮想環境のパス
export IMGENV="$HOME/pyenv/imgenv/bin/activate"
export MLENV="$HOME/pyenv/mlenv/bin/activate"
alias filer='nautilus'
