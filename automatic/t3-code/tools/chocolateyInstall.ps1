$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/pingdotgg/t3code/releases/download/v0.0.45/T3-Code-0.0.45-x64.exe'
  checksum64     = '82caef7f3d9f856db972e4701b3336b8e230cd6dc5c659102fcbb0d9fba8fd6f'
  checksumType64 = 'sha256'
  softwareName   = 'T3 Code*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
