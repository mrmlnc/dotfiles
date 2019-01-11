export LC_ALL=en_US.UTF-8;

HISTSIZE=5000
HISTFILESIZE=10000

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

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion

	# Add tab completion for Git commands
	source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
	source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add powerline
source ~/.bash_powerline
source ~/.bash_up

# Add NVS
export NVS_HOME="/usr/local/nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

export PATH="$HOME/.npm-global/bin:$PATH"
