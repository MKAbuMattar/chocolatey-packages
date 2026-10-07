$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive carries the same binary as codewhale.exe and codew.exe, both of which
# Chocolatey shims; the .bat helpers beside them are not.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/codewhale-hq/Codewhale/releases/download/v0.10.0/codewhale-windows-x64.zip'
  checksum64     = 'f47da7eb64ae609e3772a87d3262d33c6d22da91474b24ee79322faa3f7d64ea'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
