# Path config
export PATH=$HOME/bin:$PATH

# Only display the two levels of directory
PROMPT_DIRTRIM=3
# Display the current directory
export PS1="\[\e[33m\]\w\[\e[m\]$ "

# Alias definitions.
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# Create tmux session work
work() { tmux new-session -A -s work; }

