$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.11.829/GenOfficeSetup-v0.11.829-x64.exe'
  checksum64     = '849cbd9dbc6809fe5ad062e4f20c8904103b09e6f57d8b831a79debcfac1a076'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
