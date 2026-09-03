$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ThinkInAIXYZ/deepchat/releases/download/v1.1.1/DeepChat-1.1.1-windows-x64.exe'
  checksum64     = '79f0c23d61b083dad046c895740970dcbc142dee32bff2d112caa98c99216931'
  checksumType64 = 'sha256'
  softwareName   = 'DeepChat*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
