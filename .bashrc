
# some more ls aliases
alias la='ls -A'
alias l='ls -CF'

# zzq's personal aliases
alias md='mkdir'
alias ll='ls -alF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias reload='source ~/.bashrc'


# only display the two levels of directory
PROMPT_DIRTRIM=3
# display the current directory
export PS1="\[\e[33m\]\w\[\e[m\]$ "
