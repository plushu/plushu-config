#!/usr/bin/env bash
set -eo pipefail; [[ $PLUSHU_TRACE ]] && set -x

config_styled_hash () {
  longest=""
  for word in $vars; do
    KEY=`echo $word | cut -d"=" -f1`
    if [ ${#KEY} -gt ${#longest} ]; then
      longest=$KEY
    fi
  done

  for word in $vars; do
    KEY=`echo $word | cut -d"=" -f1`
    VALUE=`echo $word | cut -d"=" -f2-`

    num_zeros=$((${#longest} - ${#KEY}))
    zeros=" "
    while [ $num_zeros -gt 0 ]; do
      zeros="$zeros "
      num_zeros=$(($num_zeros - 1))
    done
    echo "$KEY:$zeros$VALUE"
  done
}

if [[ -z $2 ]]; then
  echo "Missing app name" >&2
  exit 1
else
  APP="$2"
  ENV_FILE="$PLUSHU_ROOT/apps/$APP/config.env"

  # Check if app exists with the same name
  if [ ! -d "$PLUSHU_ROOT/apps/$APP" ]; then
    echo "App $APP does not exist" >&2
    exit 1
  fi

  if [ ! -f $ENV_FILE ]; then
    touch $ENV_FILE
  fi
fi

if [ ! -s $ENV_FILE ] ; then
  echo "$APP has no config vars"
  exit 0
fi

VARS=`cat $ENV_FILE`

for var in "$@"; do
  if [[ "$var" == "--shell" ]]; then
    echo $VARS
    exit 0
  fi
done

echo "=== $APP config vars ==="
config_styled_hash "$VARS"
