$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tiny-craft/tiny-rdm/releases/download/v1.2.7/TinyRDM_Setup_1.2.7_windows_x64.exe'
  checksum64     = 'cc0bfa9b21883a913e2d4ec27d7b9f097b71c5288e5630921ead843f5ca86cdb'
  checksumType64 = 'sha256'
  softwareName   = 'Tiny RDM*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
