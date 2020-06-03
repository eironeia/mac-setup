.PHONY: all
all: setup_environment

.PHONY: setup_environment
setup_environment: homebrew ruby zgen link open_sublime_terminal

# Install and steup Brew
.PHONY: homebrew
homebrew: 
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	brew bundle

# Install ruby and bundler
.PHONY: ruby
ruby:
	\curl -sSL https://get.rvm.io | bash -s stable --ruby
	gem install bundler

#OhMyZsh
.PHONY: install_ohmyzsh
install_ohmyzsh:
	@echo Installing OhMyZsh 🚀
	chmod +x scripts/zshConfig.sh
	./scripts/zshConfig.sh

# install zgen plugins for zsh
.PHONY: zgen
zgen: 
	git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${HOME}/.zgen/robbyrussell/oh-my-zsh-master/themes/powerlevel10k"

# link dotfiles to existing
.PHONY: link
link:
	cp "dots/zshrc" ~/.zshrc
	cp "dots/gitconfig" ~/.gitconfig
	rm -rf ~/.zsh; cp -r "zsh" ~/.zsh

# update current brewfile
.PHONY: update_brewfile
update_brewfile:
	@echo Updating current Brewfile
	rm -rf Brewfile
	brew bundle dump
	git commit -am 'Update Brewfile'
	git push
	vim Brewfile

.PHONY: install_appstore_apps
install_appstore_apps:
	@echo Installing appstore Apps 🚀
	chmod +x scripts/mas.sh
	./scripts/mas.sh 

.PHONY: open_sublime_terminal
open_sublime_terminal:
	@echo Open sulime from terminal with sublime word 🚀
	chmod +x scripts/openSublimeFromTerminal.sh
	./scripts/openSublimeFromTerminal.sh

# clean zgen directory
.PHONY: clean
clean:
	rm -rf ~/.zgen