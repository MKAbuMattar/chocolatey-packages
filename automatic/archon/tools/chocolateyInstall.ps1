$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as archon.exe so Chocolatey
# shims `archon`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/coleam00/Archon/releases/download/v0.11.1/archon-windows-x64.exe'
  checksum64     = '3effccfd09f9260452737f6468b9f200fd816f0540e120f4988ac630e47332cf'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'archon.exe'
}

Get-ChocolateyWebFile @packageArgs
