#!/usr/bin/env bash

BRANCH="main"
CODE_DIR="$HOME/code"

case "$1" in
    arcanearena)
        REPO_PATH="$CODE_DIR/arcanearena"
        ;;
    dotfiles)
        REPO_PATH="$CODE_DIR/dotfiles"
        ;;
    gsw)
        REPO_PATH="$CODE_DIR/gsw"
        ;;
    novelistr)
        REPO_PATH="$CODE_DIR/novelistr.py"
        ;;
    Runa)
        REPO_PATH="$CODE_DIR/Runa"
        ;;
    Hugin)
        REPO_PATH="$CODE_DIR/hugin.py"
        ;;
    *)
        echo "{\"text\": \"❓\", \"tooltip\": \"Unknown repo: $1\", \"class\": \"git-unknown\"}"
        exit 1
        ;;
esac

# Proceed if it's a git repo
if [ -d "$REPO_PATH/.git" ]; then
    cd "$REPO_PATH" || exit
    git fetch origin &>/dev/null
    COMMITS_BEHIND=$(git rev-list --count HEAD..origin/$BRANCH 2>/dev/null)

    if [ "$COMMITS_BEHIND" -gt 0 ]; then
        echo "{\"text\": \"⬇️ $COMMITS_BEHIND\", \"tooltip\": \"$1: $COMMITS_BEHIND commits behind\", \"class\": \"git-behind\"}"
    else
        echo "{\"text\": \"✔️\", \"tooltip\": \"$1: Up to date\", \"class\": \"git-clean\"}"
    fi
else
    echo "{\"text\": \"\", \"tooltip\": \"$1: Not a git repo\", \"class\": \"git-error\"}"
    exit 1
fi
