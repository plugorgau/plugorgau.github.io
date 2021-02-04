#!/bin/sh

set -eux

if [ ! -f config.toml ]; then
    echo "Script must be run from base of repository" >&2
    exit 1
fi

# Delete any existing worktree
rm -rf ./public
git worktree prune

# Delete any local gh-pages branch
git branch -D gh-pages || true

# Create a worktree at ./public
git worktree add --detach ./public
git -C ./public checkout --orphan gh-pages
git -C ./public reset --hard

# Build the site
hugo "$@"
touch ./public/.nojekyll

# Commit site to gh-pages branch
git -C ./public add --all
git -C ./public commit -m "Publish to gh-pages"
