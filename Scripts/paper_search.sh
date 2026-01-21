#!/bin/bash

# Directory to search for files (adjust to your specific directory)
SEARCH_DIR="$HOME/Documents/Papers/"

# Infinite loop to keep the fuzzy search open
while true; do
    # Use fd to list only PDF filenames, and pass them to fzf for fuzzy finding
    selected_file=$(fd --type f --extension pdf --base-directory "$SEARCH_DIR" --exec basename {} \; | sort  | fzf)

    # Check if a file was selected, if not, break the loop
    if [ -n "$selected_file" ]; then
        # Reconstruct the full path by combining the directory and the filename
        full_path="$SEARCH_DIR/$selected_file"
        
        # Open the selected file with zathura in the background
        zathura "$full_path" &
    else
        echo "No file selected. Exiting."
        break
    fi

    # Optionally, you can add a short pause to avoid overwhelming the system
    sleep 1

done
