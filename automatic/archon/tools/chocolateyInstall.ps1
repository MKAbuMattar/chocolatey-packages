$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as archon.exe so Chocolatey
# shims `archon`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/coleam00/Archon/releases/download/v0.13.0/archon-windows-x64.exe'
  checksum64     = 'f9badd90d575a983eb80a7381cb7c0ecded4c1efebedf87e46d3ac718a4c927e'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'archon.exe'
}

Get-ChocolateyWebFile @packageArgs
