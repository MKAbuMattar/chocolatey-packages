$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as jcode.exe so Chocolatey
# shims `jcode`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/1jehuang/jcode/releases/download/v0.90.1/jcode-windows-x86_64.exe'
  checksum64     = '2069fb7b1951b0c7d88b8adab2e018084451e1583de66d36a4423bbc538c1fc5'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'jcode.exe'
}

Get-ChocolateyWebFile @packageArgs
