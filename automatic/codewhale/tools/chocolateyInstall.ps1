$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive carries the same binary as codewhale.exe and codew.exe, both of which
# Chocolatey shims; the .bat helpers beside them are not.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/codewhale-hq/Codewhale/releases/download/v0.10.3/codewhale-windows-x64.zip'
  checksum64     = 'b11f3a144dd7c422114a5aaa99ab58493500f690f7e1c6a0ee199da850e4ef76'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
