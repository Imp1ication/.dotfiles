#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Obsidian Leju Log
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🕒

# Documentation:
# @raycast.author 1mplicationxwzi
# @raycast.authorURL https://raycast.com/1mplicationxwzi

time=$(date '+%Y-%m-%dT%H:%M:%S')
echo "Current time is: $time"
echo -n "(time:: $time) (log:: )" | pbcopy
echo "Copied to clipboard."
