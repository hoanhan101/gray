#!/bin/sh

# If a command fails then the deploy stops.
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
JEKYLL_ENV=production bundle exec jekyll build

# Copy static site over hoanhan101.github.io
cp -R _site/. ../hoanhan101.github.io

# Push changes to github.
cd ../hoanhan101.github.io
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
git push origin master