$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.19.2/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'c4a3da0d13a4439d6b27636c456e47fbf0e390c78e7690230eaebd7aae75cfe9'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
