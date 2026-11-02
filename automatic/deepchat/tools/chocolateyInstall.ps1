$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ThinkInAIXYZ/deepchat/releases/download/v1.1.3/DeepChat-1.1.3-windows-x64.exe'
  checksum64     = '7b34ab55605c94ad17f7f4bf20d1ffbda0f7a27606b168b948cbb771d77e459d'
  checksumType64 = 'sha256'
  softwareName   = 'DeepChat*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
