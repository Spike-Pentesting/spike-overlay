#!/bin/bash
set -o nounset
set -o errexit


if [[ ! -e ~/.bosonstate ]]; then mkdir -p ~/.bosonstate; fi
echo ">> Starting build of $1"
echo ">> Extrapolating last commit, and saving it in $2"

curl -s $1 | \
        grep '"sha": "' | \
        sed -n '1p' | \
        sed 's/  "sha": "//g' | \
        sed 's/",//g'  > $2

if [[ ! -e $3 ]]  || [[ ! -s $3 ]]; then
  cp -rfv $2 $3
  echo ">> There wasn't a previous commit, saving it to $3"
fi

echo ">> Starting build from "
cat $3

#It's return value for now is not used
BOSON_FROM=$(cat $3) ~/boson -c $4 || true
cp -rfv $2 $3
