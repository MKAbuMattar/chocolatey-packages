$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/lobehub/lobehub/releases/download/v2.2.16/LobeHub-2.2.16-setup.exe'
  checksum64     = 'c6268794659424938d149e4c4b4666f6dbe42c8095ea45c0dc60972368c35071'
  checksumType64 = 'sha256'
  softwareName   = 'LobeHub*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
