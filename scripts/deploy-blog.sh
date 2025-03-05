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
    git commit -m "feat: update blog posts $(date '+%Y-%m-%d %H:%M:%S')"

    # Push to GitHub
    git push origin main

    # Trigger GitHub Pages deployment
    gh workflow run deploy.yml

    echo "✨ Blog update triggered! Check status at: https://github.com/orarbel/blog/actions"
else
    echo "❌ No changes to commit!"
    git status
fi 