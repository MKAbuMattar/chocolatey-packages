$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/different-ai/openwork/releases/download/v0.18.42/openwork-win-x64-0.18.42.exe'
  checksum64     = '315545bcbc19f5eadc0851d4d5cde6b8e260b5a8d274d42c2951ef5d0a5f8a41'
  checksumType64 = 'sha256'
  softwareName   = 'Openwork*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
