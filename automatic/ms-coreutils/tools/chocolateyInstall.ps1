$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/microsoft/coreutils/releases/download/v2026.6.16/coreutils-2026.6.16-x64.exe'
  checksum64     = 'f862b1aa433310420ae20f9b1384f3f974a26ba98ae37ac548061116a3ef6c62'
  checksumType64 = 'sha256'
  softwareName   = 'Coreutils*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
