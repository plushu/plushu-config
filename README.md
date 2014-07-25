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

You can import an existing env variable list as a config (a la Heroku's
`config:push`) by using `config:set` with `xargs`:

```bash
$ xargs plushu config:set example < .env
```

(Here, `plushu` stands for whatever command you use to run commands on your
Plushu server: this will likely be a command like `ssh plushu@example.com`,
if you aren't using an alias or a utility like [pluchu][].)

[pluchu]: https://github.com/plushu/pluchu

## config:unset

Usage: `plushu config:unset <app> <key>...`

Unsets keys in an app's config.

## config:empty

Usage: `plushu config:empty <app>`

Unsets *all* keys in an app's config, reverting it to its initial empty and
unconfigured state.

## config:get

Usage: `plushu config:get <app> <key>`

Outputs the value of a given key.
