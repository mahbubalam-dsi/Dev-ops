#!/bin/bash

# Function to fetch and print the latest commits
fetch_commits() {
    local owner="$1"
    local repo="$2"
    local count="${3:-5}"
# Default to 5 commits if not specified

    # Fetch commit data from GitHub API
    response=$(curl -s "https://api.github.com/repos/$owner/$repo/commits")

    # Parse and print commit messages with author names
    echo "$response" | jq -r ".[:$count] | .[] | \"Author: \(.commit.author.name)\nMessage: \(.commit.message)\n--------------------------------------\""
}

# Example usage
fetch_commits "$1" "$2" "${3:-5}" # Replace with any public repo
