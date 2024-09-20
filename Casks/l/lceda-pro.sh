#!/bin/bash

URL=$1
STAGED_FILE=$2
APP_DIR=$3

# TODO: download lceda-pro from URL to STAGED_FILE, show progress
curl -L -o $STAGED_FILE $URL

# TODO: UNZIP STAGED_FILE to APP_DIR
