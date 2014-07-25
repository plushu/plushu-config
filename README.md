# plushu config commands

The plushu "config" plugin provides commands for configuring the environment
for an app.

## config, config:pretty

Usage: `plushu config[:pretty] <app>`

These commands output all variables set in the current configuration.

The base `config` command outputs a shell-compatible list of key=value pairs
(akin to the `config --shell` option in Dokku or the Heroku toolbelt).

The `config:pretty` command outputs them in a justified, colon-separated list
(akin to the base `config` command in Dokku or the Heroku toolbelt) that may
be more easily human-readable.

## config:set

Usage: `plushu config:set <app> <key>=<value>...`

Sets keys in an app's config to the specified values.

## config:unset

Usage: `plushu config:unset <app> <key>...`

Unsets keys in an app's config.

## config:get

Usage: `plushu config:get <app> <key>`

Outputs the value of a given key.
