$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/schollz/e2ecp/releases/download/v3.2.0/e2ecp_windows.zip'
  checksum64     = '5b967fe0efccde548b16085c261d57cc3bb3a4acb249a24052a049c230529f40'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
