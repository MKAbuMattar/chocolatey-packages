$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ThinkInAIXYZ/deepchat/releases/download/v1.1.2/DeepChat-1.1.2-windows-x64.exe'
  checksum64     = 'c74fa41072daf6e22c69121ff19d81fd32ee9337dfd645f4c44d265f9bd24376'
  checksumType64 = 'sha256'
  softwareName   = 'DeepChat*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
