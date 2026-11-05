$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.100.0/crush_0.100.0_Windows_x86_64.zip'
  checksum64     = 'b860f21427e9a35263bcc574b1c660ad2041907da6d7cd339204bc16a32ab7c8'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
