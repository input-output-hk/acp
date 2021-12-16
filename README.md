# README

## Usage

```
xdg-open $(nix-build -A acp-site)/share/doc/acp/index.html
```

## Hacking

```
nix-shell -A acp-site --pure
$ cd $(mktemp -d)
$ dontInstall=true genericBuild
$ ls output
```

## Credit

pandoc configuration from: https://github.com/manubot/try-manubot
manubot: https://github.com/manubot/manubot
