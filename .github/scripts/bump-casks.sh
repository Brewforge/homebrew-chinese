#!/bin/bash

set -euo pipefail

echo "> Running brew bump dry-run..."

items=$(brew livecheck --tap brewforge/chinese --extract-plist --full-name --json || echo "[]")
bump_options=(--verbose)

while IFS= read -r item_obj; do
  item=$(jq -r '.cask' <<< "$item_obj")
  status=$(jq -r '.status' <<< "$item_obj")
  current=$(jq -r '.version.current' <<< "$item_obj")
  latest=$(jq -r '.version.latest' <<< "$item_obj")
  outdated=$(jq -r '.version.outdated' <<< "$item_obj")
  newer=$(jq -r '.version.newer_than_upstream' <<< "$item_obj")

  echo "---"

  if [ "$status" = "skipped" ]; then
    message=$(jq -r '.messages[0]' <<< "$item_obj")
    echo -e "$item: \033[0;31m$message\033[0m"
    continue
  fi

  if [ "$outdated" = "false" ]; then
    echo -e "$item: \033[0;32mUp-to-date\033[0m"
    continue
  fi

  if [ "$newer" = "true" ]; then
    echo -e "$item: \033[0;33mNewer than upstream\033[0m"
    continue
  fi

  echo "> Bumping $item from $current to $latest..."

  if [ "$latest" = "null" ]; then
    echo "$item_obj"
    cat "$(brew edit --cask "$item" --print-path)"
    echo -e "\033[0;31m> Error: version.latest is null\033[0m"
    continue
  fi

  echo "* Running brew bump-cask-pr $item --version=$latest ${bump_options[*]}..."
  brew bump-cask-pr "$item" --version="$latest" "${bump_options[@]}"

  echo "> Done for $item"
done < <(jq -c '.[] | select(.cask != null)' <<< "$items")
