# VoiceStudio Chocolatey Package

## Install

```powershell
choco install voicestudio
```

Chocolatey downloads the official 64-bit installer at install time and runs it silently. The package itself carries no binaries.

Upstream ships a per-machine installer and a per-user one. This package installs the per-machine build, so the application is available to every account on the computer.

Install a specific version:

```powershell
choco install voicestudio --version=<version>
```

## What is VoiceStudio?

VoiceStudio is the open-source, fully-local ElevenLabs alternative: voice cloning, voice design, video dubbing, dictation, transcription and audiobook creation in 646 languages.

The models run on your own machine, so the first run downloads them and a capable GPU helps.

## Upgrade

```powershell
choco upgrade voicestudio
```

## Uninstall

```powershell
choco uninstall voicestudio
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://voicestudio.sh |
| Source code | https://github.com/debpalash/VoiceStudio |
| Releases | https://github.com/debpalash/VoiceStudio/releases |
| Issues | https://github.com/debpalash/VoiceStudio/issues |
| Chocolatey page | https://community.chocolatey.org/packages/voicestudio |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/voicestudio |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

VoiceStudio itself is distributed under its own [license](https://github.com/debpalash/VoiceStudio/blob/main/LICENSE).
