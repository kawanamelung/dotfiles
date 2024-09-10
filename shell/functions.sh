# git commit
gc() {
  git commit -m "$*"
}

gi() {
    # Path to the repository list
    REPO_LIST=~/repos.txt

    # Define folders to exclude (add more as needed)
    EXCLUDE_FOLDERS=(".local" "Downloads" )

    # Clear the existing repository list
    > "$REPO_LIST"

    # Find all Git repositories and filter out the excluded folders
    find "$HOME" -name ".git" -type d | while read -r git_dir; do
        repo_dir=$(dirname "$git_dir")

        # Check if the repository directory contains any of the excluded folders
        exclude_repo=false
        for exclude in "${EXCLUDE_FOLDERS[@]}"; do
            if [[ "$repo_dir" == *"$exclude"* ]]; then
                exclude_repo=true
                break
            fi
        done

        # Add the repository to the list if it's not excluded
        if ! $exclude_repo && [ -r "$repo_dir" ]; then
            echo "$repo_dir" >> "$REPO_LIST"
        fi
    done

    while read -r repo_dir; do
        # Check if the directory is still accessible
        if [ -d "$repo_dir" ] && [ -r "$repo_dir" ]; then

            cd "$repo_dir" || continue

            # Get current branch name
            branch=$(git rev-parse --abbrev-ref HEAD)

            # Get remote commit hash and local commit hash
            remote_commit=$(git ls-remote origin "$branch" | awk '{print $1}')
            local_commit=$(git rev-parse "$branch")

            # Check status
            if [ "$local_commit" = "$remote_commit" ]; then
                echo "Up to date: ${repo_dir#$HOME/}"
            else
                echo "Not up to date: ${repo_dir#$HOME/}"
                gl -n 3
                # Show how many commits behind
                commits_behind=$(git rev-list --count "$local_commit".."$remote_commit")
                echo "Commits behind: $commits_behind"

                # Show how long ago the last fetch occurred
                last_fetch=$(git reflog show --date=relative | grep 'fetch' | head -1 | awk '{$1=$2=""; print $0}')
                if [ -n "$last_fetch" ]; then
                    last_fetch=$(git reflog show --date=relative | grep 'fetch' | head -1 | awk '{$1=$2=""; print $0}')


            if [ -n "$last_fetch" ]; then
                echo "Last fetch: $last_fetch"
            else
                echo "No fetch history found."
            fi
            echo "Last fetch: $last_fetch"
                else
                    echo "No fetch history found."
                fi
                    echo ""
            fi
            # Show Git status and logs
            # echo "Status of the repository:"
            # git status


        else
            echo "Skipping inaccessible repository: ${repo_dir#$HOME/}"
        fi
    done < "$REPO_LIST"
    cd "$HOME"
}
#
# find "$HOME" -name ".git" -type d | while read -r git_dir; do
#     repo_dir=$(dirname "$git_dir")
#     echo "Repository: $repo_dir"
#
#     cd "$repo_dir" || continue
#
#     echo "Pulling latest changes..."
#     git pull --stat  # --stat shows summary of changes
#     echo ""
#
#     echo "Status of the repository:"
#     git status
#     echo ""
#
#     echo ""
#     git status
#     echo ""
# done
tmux_sessions_setup() {
    # Define session names and their respective window names and commands
    local session1="stamp"
    local windows1=("nvim" "cdr")
    local commands1=("bash" "bash")

    local session2="dot"
    local windows2=("nvim")
    local commands2=("ls -la")

    # Function to create a session and its windows
    create_session() {
        local session_name="$1"
        shift # Shift to skip the session name
        local -a windows=()
        local -a commands=()

        # Read windows array
        local window_count="$1"
        shift
        for (( i = 0; i < window_count; i++ )); do
            windows+=("$1")
            shift
        done

        # Read commands array
        local command_count="$1"
        shift
        for (( i = 0; i < command_count; i++ )); do
            commands+=("$1")
            shift
        done

        echo "Session: $session_name"
        echo "Windows: ${windows[*]}"
        echo "Commands: ${commands[*]}"

        # Check if the session already exists
        tmux has-session -t "$session_name" 2>/dev/null
        if [ $? != 0 ]; then
            echo "Creating new session: $session_name"
            tmux new-session -d -s "$session_name"
            echo "Session $session_name created."

            # Create windows and send commands
            for i in "${!windows[@]}"; do
                echo "Creating window: ${windows[$i]}"
                echo "Running command: ${commands[$i]}"
                local window_name="${windows[$i]}"
                local window_command="${commands[$i]}"

                # Create the window
                tmux new-window -t "$session_name" -n "$window_name"

                # Send the command to the window
                if [ -n "$window_command" ]; then
                    tmux send-keys -t "$session_name:$i" "$window_command" C-m
                fi
            done
        else
            echo "Session $session_name already exists."
        fi
    }

    # Create the sessions by passing the arrays as individual elements
    create_session "$session1" "${#windows1[@]}" "${windows1[@]}" "${#commands1[@]}" "${commands1[@]}"
    create_session "$session2" "${#windows2[@]}" "${windows2[@]}" "${#commands2[@]}" "${commands2[@]}"
}

