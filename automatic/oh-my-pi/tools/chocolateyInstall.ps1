$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable; its own Windows installer downloads it
# and saves it as omp.exe, so the package does the same and Chocolatey shims `omp`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/can1357/oh-my-pi/releases/download/v18.14.0/omp-windows-x64.exe'
  checksum64     = '620a5935cdb6a9ed52d8b0c93892d6b5bb84155244a98f3be82af0455177bf29'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'omp.exe'
}

Get-ChocolateyWebFile @packageArgs
