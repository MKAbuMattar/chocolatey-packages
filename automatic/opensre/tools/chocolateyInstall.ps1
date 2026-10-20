$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.20/opensre_0.1.2026.10.20_windows-x64.zip'
  checksum64     = 'c78bd5624cfaa9a8b855491788d316e65ea7a5a4da47a2b8f861ea6f1e983fec'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
