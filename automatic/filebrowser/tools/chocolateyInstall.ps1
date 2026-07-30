$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/filebrowser/filebrowser/releases/download/v2.63.23/windows-amd64-filebrowser.zip'
  checksum64     = 'fdb1d86dfafff8b3861867c7797ce786570013088678e03de17cfd9476c72384'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
