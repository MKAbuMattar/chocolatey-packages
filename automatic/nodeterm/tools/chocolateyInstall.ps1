$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/eneskirca/nodeterm/releases/download/v0.5.3/nodeterm-Setup-0.5.3.exe'
  checksum64     = '47d53170f0e3d318c55db7073e8f24757b625486fcc3d3d8954873f24d18e608'
  checksumType64 = 'sha256'
  softwareName   = 'NodeTerm*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
