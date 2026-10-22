$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.12.29/GenOfficeSetup-v0.12.29-x64.exe'
  checksum64     = '991870ce1acbeac7ddd516bcd3e2e5b6d5215b334fa60b935ec5fd11f24b88da'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
