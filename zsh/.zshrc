if [ -z "${DOTFILES}" ]; then
  # If the environment variable is not set, set it to the desired value
  export DOTFILES="$HOME/.dotfiles"
fi

source $DOTFILES/shell/source.sh
source $dotfiles/secrets/secrets.sh

# add homebrew (mac)
export PATH=/opt/homebrew/bin:$PATH

# prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
setopt PROMPT_SUBST
export PROMPT='%F{blue}%~%f$(parse_git_branch) $ '
