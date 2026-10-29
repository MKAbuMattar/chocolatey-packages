$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as archon.exe so Chocolatey
# shims `archon`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/coleam00/Archon/releases/download/v0.13.1/archon-windows-x64.exe'
  checksum64     = 'f230ea4fb9e6462ae75a762b4bd38feba723a6fc84573a98d95ebc3ea7172717'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'archon.exe'
}

Get-ChocolateyWebFile @packageArgs
