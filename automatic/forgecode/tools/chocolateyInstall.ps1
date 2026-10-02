$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as forge.exe so Chocolatey
# shims `forge`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/tailcallhq/forgecode/releases/download/v2.14.0/forge-x86_64-pc-windows-msvc.exe'
  checksum64     = '375c22cbeee8f91f7021cac08643ea562df2822c1e5e2886c07641f2820926c4'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'forge.exe'
}

Get-ChocolateyWebFile @packageArgs
