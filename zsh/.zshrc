if [ -z "${DOTFILES}" ]; then
  # If the environment variable is not set, set it to the desired value
  export DOTFILES="$HOME/.dotfiles"
fi

source $DOTFILES/shell/source.sh
source $DOTFILES/secrets/secrets.sh

# add homebrew (mac)
export PATH=/opt/homebrew/bin:$PATH

# prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST
export PROMPT='%F{blue}%~%f$(parse_git_branch) $ '

# custom aliases for Macbook Air 2024
alias p='cd $HOME/Python/'
alias pr='cd $HOME/Python/radiance/rad'

alias rad='cd $HOME/Python/radiance/; source apyv_env/bin/activate; source rad_env.sh; cd rad'
