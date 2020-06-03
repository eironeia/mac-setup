#!/bin/bash
brew install zsh
chsh -s /bin/zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/themes/powerlevel10k
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font