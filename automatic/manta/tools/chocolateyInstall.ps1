$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/hql287/Manta/releases/download/v1.1.4/Manta.1.1.4.exe'
  checksum64     = 'f70084e104b8f25cda9fc3653567d9d4c52f7dbbb1038633191b9171263074bf'
  checksumType64 = 'sha256'
  softwareName   = 'Manta*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
