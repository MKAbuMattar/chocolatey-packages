$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.10.639/GenOfficeSetup-v0.10.639-x64.exe'
  checksum64     = '13c7d57e87e1b396ea4aefec39f4c1a0a1f1c00f749608a86f1ac7ba72f06cd6'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
