$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as jcode.exe so Chocolatey
# shims `jcode`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/1jehuang/jcode/releases/download/v1.0.0/jcode-windows-x86_64.exe'
  checksum64     = 'b7ad60e1e0c6e5ccb1065f680a6d28a8081cef9de7ca74df0888a241bcb3e802'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'jcode.exe'
}

Get-ChocolateyWebFile @packageArgs
