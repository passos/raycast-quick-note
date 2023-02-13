#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Quick note
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Note to add" }
# @raycast.packageName Productive

# Documentation:
# @raycast.description Make a quick note in iCloud Notes folder
# @raycast.author Jinyu Liu
# @raycast.authorURL http://github.com:passos/raycast-quick-note

note_file="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Notes/QuickNotes.md"
date_format="%Y-%m-%d"
date_prefix="## "
current_date=$(date +$date_format)

mkdir -p "$(dirname "$note_file")"

if [ -s "$note_file" ]; then
    date_of_today=$(cat "$note_file" | grep "$date_prefix$current_date")
else
    echo "# Quick Notes" >> "$note_file"
fi

if [ -z "$date_of_today" ]; then
    echo "" >> "$note_file"
    echo "$date_prefix$current_date" >> "$note_file"
fi

echo "- $1" >> "$note_file"