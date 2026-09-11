$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.2/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '28f12ac6a8d57a95a89f6e884b9b44e3da3bc451bb61b4d084cbc39595e67f6d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
