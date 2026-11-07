$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as archon.exe so Chocolatey
# shims `archon`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/coleam00/Archon/releases/download/v0.14.0/archon-windows-x64.exe'
  checksum64     = 'aebc48ee8422ce9fbe426af730e17261f058923cd27293b46254d1cf9555744c'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'archon.exe'
}

Get-ChocolateyWebFile @packageArgs
