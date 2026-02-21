#!/usr/bin/env bash

BRANCH="main"
CODE_DIR="$HOME/Code"

case "$1" in
    arcanearena)
        REPO_PATH="$CODE_DIR/arcanearena"
        ;;
    dotfiles)
        REPO_PATH="$HOME/dotfiles"
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

#git rev-list --left-right --count origin/main...HEAD | awk '{print $1 - $2}'

# Proceed if it's a git repo
if [ -d "$REPO_PATH/.git" ]; then
    cd "$REPO_PATH" || exit 
    git fetch origin &>/dev/null
    COMMITS=$(git rev-list --left-right --count origin/main...HEAD | awk '{print $1 - $2}')

    if [ "$COMMITS" -gt 0 ]; then
        echo "{\"text\": \" $COMMITS\", \"tooltip\": \"$1: $COMMITS commits behind\", \"class\": \"git-behind\"}"
    elif [ "$COMMITS" -lt 0 ]; then
        AHEAD=$(( -1 * COMMITS ))
        echo "{\"text\": \" $AHEAD\", \"tooltip\": \"$1: $AHEAD commits ahead\", \"class\": \"git-ahead\"}"
    else
        echo "{\"text\": \"✔️\", \"tooltip\": \"$1: Up to date\", \"class\": \"git-clean\"}"
    fi
else
    echo "{\"text\": \"\", \"tooltip\": \"$1: Not a git repo\", \"class\": \"git-error\"}"
    exit 1
fi
