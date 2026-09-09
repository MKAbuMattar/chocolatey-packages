$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.9.431/GenOfficeSetup-v0.9.431-x64.exe'
  checksum64     = 'ef22e62ea83b7fe18447f4966ca1b2cc2d570d58013c7163d375a2dcea90b187'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
