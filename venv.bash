#!/bin/bash
export VENV=$HOME/.venv
input="$*"
echo "source $VENV/${input}/bin/activate"
shopt -s expand_aliases
. $VENV/${input}/bin/activate
