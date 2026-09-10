$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/different-ai/openwork/releases/download/v0.18.45/openwork-win-x64-0.18.45.exe'
  checksum64     = '2e49e24cf81073221202b613de7161a7f4b59aa2448b48ccc6ce22e763962e07'
  checksumType64 = 'sha256'
  softwareName   = 'Openwork*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
