# Adrestia Change Proposals (ACPs)

Adrestia Change Proposals (ACPs) describe standards, processes, or decisions the Adrestia team have made, or wish to discuss.
The current process is described in detail in [ACP1 - "ACP Process"](./proposals/acp-001/README.md).

## Current ACPs

| # | Title | Status |
| --- | --- | --- |
| 1 | [ACP process](./proposals/acp-001/README.md) | Proposed |

## Submitting an ACP

Formatting options available to you can be found [here](./proposals/acp-001/formatting.md).

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
