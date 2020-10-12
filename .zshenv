# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

if [ -z $ZSH_ENV_LOADED ]; then
  # CapsをCtrlに入替え
  setxkbmap -option ctrl:nocaps
  export GOPATH=$HOME/go
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
export VENV="$HOME/pyenv/venv/bin/activate"
alias filer='nautilus'

# Go
export GO111MODULE=on

# Python製のライブラリにパスを通す
export PATH=$PATH:$HOME/.local/bin

# Java
export JAVA_HOME=/usr/lib/jvm/default-java
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:$PATH
