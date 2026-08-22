$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/hql287/Manta/releases/download/v1.1.4/Manta.1.1.4.exe'
  checksum64     = ''
  checksumType64 = 'sha256'
  softwareName   = 'Manta*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
