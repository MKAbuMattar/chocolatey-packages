$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable; its own Windows installer downloads it
# and saves it as omp.exe, so the package does the same and Chocolatey shims `omp`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/can1357/oh-my-pi/releases/download/v19.0.0/omp-windows-x64.exe'
  checksum64     = '36ac685c7b932f4bb81ccc5a7116abee90575d32110e74dd2a066e082690d941'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'omp.exe'
}

Get-ChocolateyWebFile @packageArgs
