# Adrestia Change Proposals (ACPs)

Adrestia Change Proposals (ACPs) describe standards, processes; or provide general guidelines or information to the Adrestia team.
The current process is described in detail in [ACP1 - "ACP Process"](./proposals/02.md).

## Current ACPs

| # | Title | Status |
| --- | --- | --- |
| 1 | [Example formatting](./proposals/01.md) | Proposed |
| 2 | [ACP process](./proposals/02.md) | Active |
| 1 | [ACP process](./proposals/01.md) | Draft |
| 1 | [ACP process](./proposals/01.md) | Rejected |


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

pandoc configuration from: https://github.com/manubot/try-manubot
manubot: https://github.com/manubot/manubot
