$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.98.1/crush_0.98.1_Windows_x86_64.zip'
  checksum64     = 'f0e456c560cc2e69eb2d4565768ae0fe2e04f4da90a0898374c45ab2caa33f2e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
