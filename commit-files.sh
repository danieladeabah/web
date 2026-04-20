#!/bin/bash

# Script to commit each file individually
# This script will iterate through all tracked files and commit them one by one

echo "Starting individual file commits..."

# Get all tracked files
files=$(git ls-files)

# Counter for commits
count=0

# Loop through each file
for file in $files; do
    # Check if file exists
    if [ -f "$file" ]; then
        echo "Committing: $file"
        
        # Stage the file
        git add "$file"
        
        # Commit the file with a descriptive message
        git commit -m "Add $file"
        
        # Increment counter
        ((count++))
    else
        echo "Warning: $file not found, skipping..."
    fi
done

echo ""
echo "Completed! Total files committed: $count"
echo ""
echo "To push changes to remote, run: git push origin main"
