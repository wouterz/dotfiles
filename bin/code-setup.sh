#! /bin/bash

cd "$(dirname "${BASH_SOURCE[0]:-$0}")"

cat code-extensions.txt | while read extension || [[ -n $extension ]];
do
  code --install-extension $extension --force
done
