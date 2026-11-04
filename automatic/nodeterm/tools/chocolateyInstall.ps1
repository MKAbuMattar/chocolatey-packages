$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/eneskirca/nodeterm/releases/download/v0.5.0/nodeterm-Setup-0.5.0.exe'
  checksum64     = 'af321a94ae82ef27f4a1a5eaea7249ff15ee0b48e1a4cd6ac6d2d514d1f840a0'
  checksumType64 = 'sha256'
  softwareName   = 'NodeTerm*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
