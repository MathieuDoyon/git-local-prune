#!/usr/bin/env bash

## Clone the repo
git clone https://github.com/MathieuDoyon/git-local-prune.git --depth=1 || {
  echo >&2 "Clone failed with $?"
  exit 1
}

cd git-local-prune || exit

make install || {
  echo >&2 "Clone failed with $?"
  exit 1
}

cd ..

rm -rf git-local-prune