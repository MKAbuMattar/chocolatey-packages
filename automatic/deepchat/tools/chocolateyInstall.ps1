$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ThinkInAIXYZ/deepchat/releases/download/v1.1.4/DeepChat-1.1.4-windows-x64.exe'
  checksum64     = 'b14fc715e8c496a78fde22b2b3520b0935681ef124f43a4346a6716812d8ab59'
  checksumType64 = 'sha256'
  softwareName   = 'DeepChat*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
