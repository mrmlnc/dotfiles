export LC_ALL=en_US.UTF-8;

HISTSIZE=50000
HISTFILESIZE=100000

# Load the shell dotfiles, and then some:
for file in .{bash_aliases,bash_functions}; do
	if [ -f ~/$file ]; then
		. ~/$file
	fi
done

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# * Recursive globbing, e.g. `echo **/*.txt`
shopt -s globstar 2> /dev/null;

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add tab completion for many Bash commands
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion

	# Add tab completion for Git commands
	source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
	source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

# Add powerline
source ~/.bash_powerline

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
