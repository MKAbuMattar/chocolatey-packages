$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships one self-contained executable; its own Windows installer downloads it
# and saves it as omp.exe, so the package does the same and Chocolatey shims `omp`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/can1357/oh-my-pi/releases/download/v18.11.2/omp-windows-x64.exe'
  checksum64     = '97f5c9d534141cd6c4fc8abe85818de550772ce397da08623b0aa25d9f944946'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'omp.exe'
}

Get-ChocolateyWebFile @packageArgs
