$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as jcode.exe so Chocolatey
# shims `jcode`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/1jehuang/jcode/releases/download/v1.0.1/jcode-windows-x86_64.exe'
  checksum64     = 'c43a8c5a8489ecb1e52767a4f7c21982eb7f71b343de2f51d5b4b65c6197aec0'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'jcode.exe'
}

Get-ChocolateyWebFile @packageArgs
