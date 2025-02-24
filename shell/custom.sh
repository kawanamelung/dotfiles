export PYTHON_PROJECTS=$HOME/Python

export DAB_DIR=$PYTHON_PROJECTS/Games/dots_and_boxes/
dab() {
    cd $DAB_DIR
    source $DAB_DIR/dab_env/bin/activate
}

# ascii treez
export TREE_DIR=$DOTFILES/ascii_treez
export PYTHONPATH=$TREE_DIR:$PYTHONPATH
export PATH=$TREE_DIR/treez/cli:$PATH
# alias tr='cd $TREE_DIR'
