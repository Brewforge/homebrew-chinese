#!/bin/bash

URL=$1
STAGED_FILE=$2
APP_DIR=$3

# download lceda-pro from URL to STAGED_FILE, show progress
curl -L -o "$STAGED_FILE" "$URL"

# UNZIP STAGED_FILE to APP_DIR
/usr/bin/tar -xvf "$STAGED_FILE" -C "$APP_DIR" LCEDA-Pro.app
