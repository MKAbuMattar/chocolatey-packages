$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/wassgha/rescript/releases/download/v1.2.4/Rescript-Setup.exe'
  checksum64     = '3f571ec01771561a88236a00a96fe93006fefe0e407d0a114eea4975958a84f5'
  checksumType64 = 'sha256'
  softwareName   = 'Rescript*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
