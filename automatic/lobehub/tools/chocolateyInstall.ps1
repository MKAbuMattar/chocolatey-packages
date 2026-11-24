$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/lobehub/lobehub/releases/download/v2.3.6/LobeHub-2.3.6-setup.exe'
  checksum64     = 'b75c16ac8098bed653340ee52e7f9e0cc41e7ab7d08fc4c75ca06961d870175a'
  checksumType64 = 'sha256'
  softwareName   = 'LobeHub*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
