#!/bin/bash

TARGET_DIR="."

echo "Ink Watcher Active..."

while true; do
    find "$TARGET_DIR" -name "*.ink" -type f | while read -r src; do
        dest="${src%.ink}_ink.md"
        
        if [[ ! -f "$dest" || "$src" -nt "$dest" ]]; then
            cp "$src" "$dest"
        fi
    done

    find "$TARGET_DIR" -name "*_ink.md" -type f | while read -r shadow; do
        original="${shadow%_ink.md}.ink"
        
        if [[ ! -e "$original" ]]; then
            rm "$shadow"
        fi
    done

    sleep 2
done
