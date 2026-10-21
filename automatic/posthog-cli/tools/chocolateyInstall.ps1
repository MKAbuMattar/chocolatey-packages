$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.12/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '1cf5bb5c801d1fd7ed80bbe86559af33fc63c0ce769d4a823a22cdc30fa7dcfb'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
