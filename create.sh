#!/bin/sh

set -eu

DEMO_DIR=~/git/sc/sourcecred-demos
SOURCECRED_DIR="$DEMO_DIR/sourcecred"
SOURCECRED_CLI="$SOURCECRED_DIR/bin/sourcecred.js"
export SOURCECRED_DIRECTORY="$DEMO_DIR/sourcecred_data"
SITE_DIR="$DEMO_DIR/site"

(cd "$SOURCECRED_DIR" && git fetch && git checkout origin/load-for-org && yarn && yarn backend)

near() (
  node "$SOURCECRED_CLI" load --organization nearprotocol
)
near

(cd "$SOURCECRED_DIR" && yarn build --output-path "$SITE_DIR")
mkdir -p "$SITE_DIR/api/v1"
cp -r "$SOURCECRED_DIRECTORY" "$SITE_DIR/api/v1/data"
rm -rf "$SITE_DIR/api/v1/data/cache"
