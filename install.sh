#!/bin/sh
if [["$OSTYPE" == "*linux*"]]; then
  sudo apt install figlet
fi

if [["$OSTYPE" == "darwin"]]; then
  brew install figlet
fi

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

