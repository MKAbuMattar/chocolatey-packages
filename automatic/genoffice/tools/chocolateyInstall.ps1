$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.12.600/GenOfficeSetup-v0.12.600-x64.exe'
  checksum64     = 'fe3020f7acbace52346d3f04d436ec22f8587eb6298de704075f1efb991437d1'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
