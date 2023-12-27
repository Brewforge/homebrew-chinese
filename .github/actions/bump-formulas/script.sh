#!/bin/bash

set -e

formula=$1

echo "Checking for $formula..."

# "sed" command not working on github action,
# because of the color code in the output of "brew livecheck --formula" command
brewCheck=$(brew livecheck --formula "$formula")
echo "[BrewCheck]: $brewCheck"

# if brewCheck contain "skipped", exit
if [[ $brewCheck == *"skipped"* ]]; then
  echo "Skipped for $formula"
  exit 0
fi

formatCheck=$(echo "$brewCheck" | tr -d ' ' | cut -d':' -f2-)
echo "[FormatCheck]: $formatCheck"
cleanCheck=$(echo "$formatCheck" | sed 's/\x1b[[0-9;]*m//g')
echo "[CleanCheck]: $cleanCheck"

fromV=${cleanCheck%==>*}
toV=${cleanCheck#*==>}

echo "Updating $formula from $fromV to $toV"
if [[ "$fromV" != "$toV" ]]; then
  brew bump-formula-pr "$formula" --version "$toV" --verbose --force
fi
echo "Done for $formula"
