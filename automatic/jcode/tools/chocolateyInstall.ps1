$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as jcode.exe so Chocolatey
# shims `jcode`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/1jehuang/jcode/releases/download/v0.99.0/jcode-windows-x86_64.exe'
  checksum64     = 'c4a0699e17daf780c468238c0c0f88f950b28fac6acd7b5ebc08cf547f07168e'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'jcode.exe'
}

Get-ChocolateyWebFile @packageArgs
