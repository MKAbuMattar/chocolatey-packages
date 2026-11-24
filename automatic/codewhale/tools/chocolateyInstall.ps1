$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive carries the same binary as codewhale.exe and codew.exe, both of which
# Chocolatey shims; the .bat helpers beside them are not.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/codewhale-hq/Codewhale/releases/download/v0.10.4/codewhale-windows-x64.zip'
  checksum64     = 'ed7489fbeea18492c5e96b1da2ccf59f0a826d0825b27e45f736ef9f4d97f788'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
