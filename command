#!/usr/bin/env bash
set -eo pipefail; [[ -n "$PLUSHU_TRACE" ]] && set -x

if [[ -z $2 ]]; then
  echo "Missing app name" >&2
  exit 1
else
  app=$2
  app_dir=$PLUSHU_ROOT/apps/$app
  env_file=$app_dir/config.env

  # Check if app exists with the same name
  if [ ! -d "$app_dir" ]; then
    echo "App $app does not exist" >&2
    exit 1
  fi

  if [ ! -f "$env_file" ]; then
    touch "$env_file"
  fi
fi

cat "$env_file"
