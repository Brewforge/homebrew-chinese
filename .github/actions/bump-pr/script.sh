#!/bin/bash

# ========================
# Bump casks for Homebrew
casks=$(brew livecheck --tap brewforge/chinese --casks --json)

for cask in $(echo $casks | jq -r '.[] | .cask'); do
  cask_obj=$(echo $casks | jq --arg cask "$cask" '.[] | select(.cask == $cask)')

  cask_status=$(echo $cask_obj | jq -r '.status // empty')
  cask_version_current=$(echo $cask_obj | jq -r '.version.current')
  cask_version_latest=$(echo $cask_obj | jq -r '.version.latest')
  cask_outdated=$(echo $cask_obj | jq -r '.version.outdated')
  cask_newer=$(echo $cask_obj | jq -r '.version.newer_than_upstream')

  if [ "$cask_status" == "skipped" ]; then
    echo -e "$cask: \033[0;31m$(echo $cask_obj | jq -r '.messages[0]')\033[0m"
    continue
  elif [ "$cask_outdated" == "false" ]; then
    echo -e "$cask: \033[0;32mUp-to-date\033[0m"
    continue
  elif [ "$cask_newer" == "true" ]; then
    echo -e "$cask: \033[0;33mNewer than upstream\033[0m"
    continue
  fi

  echo "> Bumping $cask from $cask_version_current to $cask_version_latest..."
  brew bump-cask-pr $cask --version=$cask_version_latest --verbose
  echo "> Done for $cask"
done

# ========================
# Bump formulae for Homebrew
formulae=$(brew livecheck --tap brewforge/chinese --formulae --json)

for formula in $(echo $formulae | jq -r '.[] | .formula'); do
  formula_obj=$(echo $formulae | jq --arg formula "$formula" '.[] | select(.formula == $formula)')

  formula_status=$(echo $formula_obj | jq -r '.status // empty')
  formula_version_current=$(echo $formula_obj | jq -r '.version.current')
  formula_version_latest=$(echo $formula_obj | jq -r '.version.latest')
  formula_outdated=$(echo $formula_obj | jq -r '.version.outdated')
  formula_newer=$(echo $formula_obj | jq -r '.version.newer_than_upstream')

  if [ "$formula_status" == "skipped" ]; then
    echo -e "$formula: \033[0;31m$(echo $formula_obj | jq -r '.messages[0]')\033[0m"
    continue
  elif [ "$formula_outdated" == "false" ]; then
    echo -e "$formula: \033[0;32mUp-to-date\033[0m"
    continue
  elif [ "$formula_newer" == "true" ]; then
    echo -e "$formula: \033[0;33mNewer than upstream\033[0m"
    continue
  fi

  echo "> Bumping $formula from $formula_version_current to $formula_version_latest..."
  # brew bump-formula-pr $formula --version=$formula_version_latest --verbose
  echo -e "\033[0;33m> TDOO: brew bump-formula-pr $formula --version=$formula_version_latest --verbose\033[0m"
  echo "> Done for $formula"
done
