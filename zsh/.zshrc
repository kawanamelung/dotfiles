source ~/aliases.sh
source ~/functions.sh
source ~/custom.sh
source ~/secrets.sh

# add homebrew (mac)
export PATH=/opt/homebrew/bin:$PATH

# prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PROMPT='%F{blue}%~%f$(parse_git_branch) $ '
