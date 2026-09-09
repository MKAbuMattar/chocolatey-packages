$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.9/opensre_0.1.2026.9.9_windows-x64.zip'
  checksum64     = 'a8eb5ff1997b40ca0d1d735221304dcad58c5605f9e80d5ddbc4e0407cb79f18'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
