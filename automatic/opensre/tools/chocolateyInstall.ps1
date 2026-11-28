$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.28/opensre_0.1.2026.11.28_windows-x64.zip'
  checksum64     = '7c930a54ffa0b7b8e397fceb8b32849a120d876cb67fa40fbcb89b509cb4cd80'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
