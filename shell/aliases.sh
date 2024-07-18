# shell config
alias d='cd ~/.dotfiles/'
alias s='source ~/.zshrc'
alias b='source ~/.bashrc'

alias z='nvim ~/.zshrc'
alias rc='nvim ~/.bashrc'
alias aa='nvim ~/.aliases.sh'

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
alias nv='nvim ~/.config/nvim/lua/'
alias swp="cd $HOME/.local/state/nvim/swap"

# history
alias h='history'
alias h100='history -n 100'

# env debugging
alias echop='echo $PATH | tr ":" "\n"'
alias echopp='echo $PYTHON_PATH | tr ":" "\n"'
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
alias gl='git pull'
alias gp='git push'
alias ga='git add'
alias gs='git status'
alias gd='git diff'

# interactive python
alias ip='ipython'

# gpu
alias wg='watch -n0.1 nvidia-smi'
