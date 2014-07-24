#!/usr/bin/env bash
set -eo pipefail; [[ $PLUSHU_TRACE ]] && set -x

if [[ -z $2 ]]; then
  echo "Missing app name" >&2
  exit 1
else
  APP=$2
  ENV_FILE=$PLUSHU_ROOT/apps/$APP/config.env

  # Check if app exists with the same name
  if [ ! -d "$PLUSHU_ROOT/apps/$APP" ]; then
    echo "App $APP does not exist" >&2
    exit 1
  fi

  if [ ! -f "$ENV_FILE" ]; then
    touch "$ENV_FILE"
  fi
fi

cat "$ENV_FILE"
