$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.11.564/GenOfficeSetup-v0.11.564-x64.exe'
  checksum64     = '7c89d6c53d18a88401f2457b6e3c0ccabd607f89272dcea6617133320647c8af'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
