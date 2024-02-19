##!/usr/bin/env bash

# Guide: https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0

if [ command -v zsh > /dev/null ]; then
  sudo apt install zsh
  zsh
fi;

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/

echo "Change the value of ZSH_THEME to 'powerlevel10k/powerlevel10k'"
vim ~/.zshrc

## Install Zsh plugins
# syntax highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

