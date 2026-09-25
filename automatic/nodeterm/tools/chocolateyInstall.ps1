$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/eneskirca/nodeterm/releases/download/v0.3.14/nodeterm-Setup-0.3.14.exe'
  checksum64     = 'c82cd4c3969f22bafc0dcf47e3bc40a1c1ff8e645efa1bc2885be9c1f91c3b17'
  checksumType64 = 'sha256'
  softwareName   = 'NodeTerm*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
