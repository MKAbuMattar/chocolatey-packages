$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/eneskirca/nodeterm/releases/download/v0.3.15/nodeterm-Setup-0.3.15.exe'
  checksum64     = '0726c4f03ce04c802b3daa39952b1f56f5ac859ab4290caf1381436a4f9a04a0'
  checksumType64 = 'sha256'
  softwareName   = 'NodeTerm*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
