# Adrestia Change Proposals (ACPs)

Adrestia Change Proposals (ACPs) describe standards, processes, or decisions the Adrestia team have made, or wish to discuss.

## Hacking instructions

### Usage

```
xdg-open $(nix-build -A acp-site)/share/doc/acp/index.html
```

```
nix-shell -A acp-site --pure
src=./ dontUnpack=true dontInstall=true genericBuild
python -m http.server --directory output/
ls output
```

### Credit

- pandoc configuration from: https://github.com/manubot/try-manubot (modified)
- manubot: https://github.com/manubot/manubot
