# shell config
alias d='cd $DOTFILES'
alias s='source $DOTFILES/.zshrc'
alias b='source ~/.bashrc'

    alias z='nvim $DOTFILES/zsh/.zshrc'
alias rc='nvim ~/.bashrc'
alias aa='nvim $DOTFILES/shell/aliases.sh'

# colorize the ls output
alias ls='ls --color=auto'

# use a long listing format
alias ll='ls -la'

# show hidden files
alias l.='ls -d .* --color=auto'

# grep with color
alias g='grep --color=always'

# clear
alias c='clear'

# nvim
alias nv='cd $DOTFILES/nvim/.config/nvim/lua/'
alias swp="cd $HOME/.local/state/nvim/swap"

# history
alias h='history'
alias h100='history -n 100'

# env debugging
alias echop='echo $PATH | tr ":" "\n"'
alias echopp='echo $PYTHONPATH | tr ":" "\n"'
alias pp=' | tr ":" "\n"'

# tmux
alias t='tmux'
alias tls='tmux ls'
alias tk='tmux kill-window'
alias tks='tmux kill-session'
alias tka='tmux kill-server'
alias ta='tmux attach -t'
alias td='tmux detach'
alias ts='tmux switch -t'
alias tt='tmux list-keys'

# git aliases
alias gl='git log --all --graph --decorate --pretty=format:"%C(yellow)%h%C(reset) - %C(cyan)%cr%C(reset)  %C(green)%cn%C(reset) %C(auto)%d%C(reset) %s"'
alias gp='git push'
alias ga='git add'
alias gs='git status'
alias gd='git diff'

# interactive python
alias ip='ipython'

# gpu
alias wg='watch -n0.1 nvidia-smi'
