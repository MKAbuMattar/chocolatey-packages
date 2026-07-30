$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ThinkInAIXYZ/deepchat/releases/download/v1.0.9/DeepChat-1.0.9-windows-x64.exe'
  checksum64     = 'd3f8664b97f8de4a90ca6be55b75977dca7ba6f8e34daeee149d648436ac43e3'
  checksumType64 = 'sha256'
  softwareName   = 'DeepChat*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
