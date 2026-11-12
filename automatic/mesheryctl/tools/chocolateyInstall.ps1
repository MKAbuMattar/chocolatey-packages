$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.78/mesheryctl_1.0.78_Windows_x86_64.zip'
  checksum64     = 'e4facd630c1afa8e05dfef6a37ad8abae5cf1a5162dee3824ae983bb069e9a59'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
