# T3 Code Chocolatey Package

## Install

```powershell
choco install t3-code
```

Chocolatey downloads the official 64-bit installer at install time and runs it silently. The package itself carries no binaries.

Install a specific version:

```powershell
choco install t3-code --version=0.0.33
```

## What is T3 Code?

T3 Code is a minimal web GUI for coding agents. It works with Codex today, and Claude Code
support is planned.

It runs as a Node.js WebSocket server that wraps [Codex CLI](https://github.com/openai/codex)
(`codex app-server`) and serves a React web UI. It also ships as a standalone Electron
desktop app, which is the version this Chocolatey package installs.

What it gives you:

- A chat interface for AI coding sessions
- Full-access and supervised session modes, which control sandbox and approval policies
- Thread and project management, with conversation history
- Codex model selection, including the fast and flex service tiers
- Auto-update for the desktop app
- Remote access through an auth token and a custom host and port
- Customizable keybindings in `~/.t3/keybindings.json`

T3 Code is in early alpha. Expect bugs.

## Prerequisites

You need Codex CLI installed and authenticated before T3 Code will do anything useful.

1. Install Codex CLI:

   ```powershell
   npm install -g @openai/codex
   ```

2. Authenticate Codex with an API key or a ChatGPT login. The
   [Codex CLI docs](https://github.com/openai/codex) cover both.

3. Check that `codex` is on your `PATH`:

   ```powershell
   codex --version
   ```

Without an authenticated Codex CLI, T3 Code still launches, but sessions fail.

## Upgrade

```powershell
choco upgrade t3-code
```

## Uninstall

```powershell
choco uninstall t3-code
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://t3.codes/ |
| Source code | https://github.com/pingdotgg/t3code |
| Releases | https://github.com/pingdotgg/t3code/releases |
| Issues | https://github.com/pingdotgg/t3code/issues |
| Chocolatey page | https://community.chocolatey.org/packages/t3-code |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/t3-code |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

T3 Code itself is distributed under its own [license](https://github.com/pingdotgg/t3code/blob/main/LICENSE).
