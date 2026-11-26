$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable; its own Windows installer downloads it
# and saves it as omp.exe, so the package does the same and Chocolatey shims `omp`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/can1357/oh-my-pi/releases/download/v19.2.1/omp-windows-x64.exe'
  checksum64     = '2d039b068497333c2e23c06531ed50314edb9ec96123fa1a5d24a78316a1e5db'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'omp.exe'
}

Get-ChocolateyWebFile @packageArgs
