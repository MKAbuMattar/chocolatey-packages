$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive carries the same binary as codewhale.exe and codew.exe, both of which
# Chocolatey shims; the .bat helpers beside them are not.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/codewhale-hq/Codewhale/releases/download/v0.10.2/codewhale-windows-x64.zip'
  checksum64     = '21b27337a24d2f555ca3b4a1c5c47f5808a4939a363be14076655c4521ab272c'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
