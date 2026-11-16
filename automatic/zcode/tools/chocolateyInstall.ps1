$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/zai-org/ZCode/releases/download/v3.18.2/ZCode-3.18.2-win-x64.exe'
  checksum64     = '268dfdb72a922a1a8c366f9e9e717331dc01b40158512b4f5a26cf639352a69e'
  checksumType64 = 'sha256'
  softwareName   = 'ZCode*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
