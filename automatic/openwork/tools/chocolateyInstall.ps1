$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/different-ai/openwork/releases/download/v0.18.64/openwork-win-x64-0.18.64.exe'
  checksum64     = '24d278f0d3868bf7c69350af8c927a9c5d1726c589cfeb2b94e7cf9f98b40ced'
  checksumType64 = 'sha256'
  softwareName   = 'Openwork*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
