$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable; its own Windows installer downloads it
# and saves it as omp.exe, so the package does the same and Chocolatey shims `omp`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/can1357/oh-my-pi/releases/download/v18.8.6/omp-windows-x64.exe'
  checksum64     = 'c139a5c4653ec475f63ac9076dcb1b1da150432a3b4f6c832131ceaf70ac8a86'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'omp.exe'
}

Get-ChocolateyWebFile @packageArgs
