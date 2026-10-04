$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.4/opensre_0.1.2026.10.4_windows-x64.zip'
  checksum64     = '33b943d52fefa80bb2e3d8f58c0e939e5bea7ccf7d46be439baa3cc426653176'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
