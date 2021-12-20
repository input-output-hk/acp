# README

## Usage

```
xdg-open $(nix-build -A acp-site)/share/doc/acp/index.html
```

## Hacking

```
nix-shell -A acp-site --pure
$ src=./ dontUnpack=true dontInstall=true genericBuild
$ python -m http.server --directory output/
$ ls output
```

## Credit

pandoc configuration from: https://github.com/manubot/try-manubot
manubot: https://github.com/manubot/manubot
