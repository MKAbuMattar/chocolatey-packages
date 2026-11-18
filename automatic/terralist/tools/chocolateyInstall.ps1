$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/terralist/terralist/releases/download/v0.11.4/terralist_windows_amd64.zip'
  checksum64     = 'ba161cd7d8ea12a36dffe8a49988be8dd992bf91067ea0cf1e7b4028d5ce16af'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
