$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.83/mesheryctl_1.0.83_Windows_x86_64.zip'
  checksum64     = 'b499162f136f911148fb1b1968c393eb20fc3e505814175c7f8f84b6872854d6'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
