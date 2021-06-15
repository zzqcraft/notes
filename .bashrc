
# some more ls aliases
alias la='ls -A'
alias l='ls -CF'

# only display the two levels of directory
PROMPT_DIRTRIM=3
# display the current directory
export PS1="\[\e[33m\]\w\[\e[m\]$ "

# alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# create tmux session work
work() { tmux new-session -A 0s ${1:-work}; }

