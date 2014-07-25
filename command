#!/usr/bin/env bash
set -eo pipefail; [[ $PLUSHU_TRACE ]] && set -x

if [[ -z $2 ]]; then
  echo "Missing app name" >&2
  exit 1
else
  app=$2
  app_root=$PLUSHU_ROOT/apps/$app
  env_file=$app_root/config.env

  # Check if app exists with the same name
  if [ ! -d "$app_root" ]; then
    echo "App $app does not exist" >&2
    exit 1
  fi

  if [ ! -f "$env_file" ]; then
    touch "$env_file"
  fi
fi

cat "$env_file"
