$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.16.0/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '7257d2c116a1c2e30606ea81a6792bb65118ffd5917d4e5bee3eae3b4253750a'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
