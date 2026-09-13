$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/wassgha/rescript/releases/download/v1.1.13/Rescript-Setup.exe'
  checksum64     = 'dfacc9307f5126f32066dbc390b9f933e297863a8246849b04e0f5fa48a8b962'
  checksumType64 = 'sha256'
  softwareName   = 'Rescript*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
