$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.19.4/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'eeefbc136f080ec9249191b2ef51d9312de9db8b4890ca702e0738366134df18'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
