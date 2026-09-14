# T3 Code Chocolatey Package

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
