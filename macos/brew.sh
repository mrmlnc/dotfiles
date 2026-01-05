#!/usr/bin/env bash

# Install brew
if ! hash "brew" 2>/dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Bash
brew install bash
brew tap homebrew/versions
brew install bash-completion

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
	echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
	chsh -s /usr/local/bin/bash;
fi;

# Install packages
brew install bat
brew install colima
brew install docker docker-buildx docker-completion docker-compose
brew install git
brew install htop
brew install bottom
brew install micro
brew install nano
brew install zed
brew install tree
brew install visual-studio-code
brew install volta
brew install bitwarden
brew install iterm2
brew install macfuse
brew install dbeaver-community
brew install rectangle
brew install microsoft-edge
brew install spotify
brew install xmind
brew install zoom
brew install telegram

# Remove outdated versions from the cellar.
brew cleanup
