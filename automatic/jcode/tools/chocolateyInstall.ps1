$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable. It is saved as jcode.exe so Chocolatey
# shims `jcode`; the nuspec excludes it from the package so it is never bundled.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/1jehuang/jcode/releases/download/v0.94.0/jcode-windows-x86_64.exe'
  checksum64     = 'd32b471adb6081e70c6631a9721edd953db8bc88671953245d72805c263dce4f'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'jcode.exe'
}

Get-ChocolateyWebFile @packageArgs
