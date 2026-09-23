$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.4/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '6adcad7c173efd379f6541d8baed05238d450ec4574d37620055ee9eafc2d574'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
