$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive carries the same binary as codewhale.exe and codew.exe, both of which
# Chocolatey shims; the .bat helpers beside them are not.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/codewhale-hq/Codewhale/releases/download/v0.10.1/codewhale-windows-x64.zip'
  checksum64     = '04b774353d15b22ac4d5887a7a8c0988174be7c0cc8a31d1daeda2456776349c'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
