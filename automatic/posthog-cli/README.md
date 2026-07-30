# PostHog CLI Chocolatey Package

## Install

```powershell
choco install posthog-cli
```

Chocolatey downloads the official Windows build from the [PostHog/posthog](https://github.com/PostHog/posthog/releases) releases and puts it on your PATH.
PostHog is a monorepo that publishes releases for several components, so the updater tracks tags prefixed with `posthog-cli/` rather than the newest release.

## What is PostHog CLI?

:hedgehog: PostHog is the leading platform for building self-driving products. Our developer tools - AI observability, analytics, session replay, flags, experiments, error tracking, logs, and more - capture all the context agents need to diagnose problems, uncover opportunities, and ship fixes. Steer it all from Slack, web, desktop, or the MCP.

Upstream describes it with these topics: ab-testing, ai-analytics, analytics, cdp, data-warehouse, experiments, feature-flags, javascript.

## Upgrade

```powershell
choco upgrade posthog-cli
```

## Uninstall

```powershell
choco uninstall posthog-cli
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://posthog.com |
| Source code | https://github.com/PostHog/posthog |
| Releases | https://github.com/PostHog/posthog/releases |
| Chocolatey page | https://community.chocolatey.org/packages/posthog-cli |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/posthog-cli |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

PostHog CLI itself is distributed under its own [license](https://github.com/PostHog/posthog/blob/master/LICENSE).
