$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.10.63/GenOfficeSetup-v0.10.63-x64.exe'
  checksum64     = '537f16ad76a4ff32fd3ba5a07355f1f9beaecb6d9fc92813b943db8ad0fb7f83'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
