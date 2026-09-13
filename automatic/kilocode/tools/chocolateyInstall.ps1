$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Kilo-Org/kilocode/releases/download/v7.6.2/kilo-windows-x64.zip'
  checksum64     = 'bfc2daae05ef7e44584928aab87b53d5cedd9e19d32af4a01903e08d36900dcf'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
