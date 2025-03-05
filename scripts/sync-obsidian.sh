#!/bin/bash

# Enable debug mode
set -x

# Configuration
OBSIDIAN_POSTS_DIR="content/posts"
BLOG_POSTS_DIR="src/content/post"

# Create directories if they don't exist
mkdir -p "$OBSIDIAN_POSTS_DIR"
mkdir -p "$BLOG_POSTS_DIR"

# Sync files from Obsidian to blog
rsync -av --delete \
  --exclude ".*" \
  --exclude "_*" \
  --exclude "templates" \
  "$OBSIDIAN_POSTS_DIR/" \
  "$BLOG_POSTS_DIR/"

echo "�� Sync completed!" 