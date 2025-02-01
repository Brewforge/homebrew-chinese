#!/bin/bash

set -e

# ========================
# bump
echo "> Running brew bump dry-run..."

items=$(brew livecheck --tap brewforge/chinese --extract-plist --full-name --json || echo "[]")

for item in $(echo "$items" | jq -r '.[] | .formula'); do
  if [ "$item" == "null" ]; then
    continue
  fi

  echo "---" # newline

  item_obj=$(echo "$items" | jq --arg item "$item" '.[] | select(.formula == $item)')

  is_formula=$(echo "$item_obj" | jq -r '.formula')

  item_status=$(echo "$item_obj" | jq -r '.status')
  item_version_current=$(echo "$item_obj" | jq -r '.version.current')
  item_version_latest=$(echo "$item_obj" | jq -r '.version.latest')
  item_outdated=$(echo "$item_obj" | jq -r '.version.outdated')
  item_newer=$(echo "$item_obj" | jq -r '.version.newer_than_upstream')

  if [ "$item_status" == "skipped" ]; then
    # skipped.
    echo -e "$item: \033[0;31m$(echo "$item_obj" | jq -r '.messages[0]')\033[0m"
    continue
  elif [ "$item_outdated" == "false" ]; then
    # up-to-date.
    echo -e "$item: \033[0;32mUp-to-date\033[0m"
    continue
  elif [ "$item_newer" == "true" ]; then
    # newer than upstream.
    echo -e "$item: \033[0;33mNewer than upstream\033[0m"
    continue
  fi

  # bump.
  echo "> Bumping $item from $item_version_current to $item_version_latest..."

  if [ "$item_version_latest" == "null" ]; then
    echo "$item_obj"

    if [ -n "$is_formula" ]; then
      cat "$(brew edit "$item" --print-path)"
    fi

    echo -e "\033[0;31m> Error: version.latest is null\033[0m"
    continue
  fi

  # ========================
  # dry-run
  _BUMP_OPTIONS="--verbose"

  if [ "$is_formula" != "null" ]; then
    # is_formula.

    echo "* Running brew bump-formula-pr $item --version=$item_version_latest $_BUMP_OPTIONS..."
    brew bump-formula-pr "$item" --version="$item_version_latest" $_BUMP_OPTIONS
    # echo -e "\033[0;33m* TDOO: brew bump-formula-pr $item --version=$item_version_latest $_BUMP_OPTIONS\033[0m"
  fi

  echo "> Done for $item"
done
