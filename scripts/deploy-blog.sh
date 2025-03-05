#!/bin/bash

# Enable debug mode
set -x

# Go to the blog directory
cd "$(dirname "$0")/.." || exit
echo "📂 Changed to directory: $(pwd)"


# Stage all changes including new files
git add -A
echo "📝 Staged changes"

# Show what's staged
echo "🔍 Staged files:"
git status

# Check if there are changes to commit
if ! git diff --cached --quiet; then
    echo "💫 Changes detected, committing..."
    # Commit with timestamp using conventional commit format
    if git commit -m "feat: update blog posts $(date '+%Y-%m-%d %H:%M:%S')" && git push origin main; then
        echo "✨ Changes pushed successfully!"
        # No need to trigger workflow - the push will trigger it automatically
    else
        echo "❌ Failed to commit or push changes"
        exit 1
    fi
else
    echo "❌ No changes to commit!"
    git status
fi 