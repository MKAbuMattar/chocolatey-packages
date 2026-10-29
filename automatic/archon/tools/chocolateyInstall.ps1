$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as archon.exe so Chocolatey
# shims `archon`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/coleam00/Archon/releases/download/v0.13.2/archon-windows-x64.exe'
  checksum64     = '2ff11d7607a7b51df3ab03ced7bb22ff8dbc177db2dd4cb2de86bf7a3b1e91da'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'archon.exe'
}

Get-ChocolateyWebFile @packageArgs
