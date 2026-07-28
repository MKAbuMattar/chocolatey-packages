$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Kochava-Studios/witsy/releases/download/v3.5.2/Witsy-3.5.2-win32-x64.Setup.exe'
  checksum64     = '12E314DB4CDD40D5474C884551D571A8607CE1828A8D10C1F062D594B68E9106'
  checksumType64 = 'sha256'
  softwareName   = 'Witsy*'
  silentArgs     = '/S /quiet'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
