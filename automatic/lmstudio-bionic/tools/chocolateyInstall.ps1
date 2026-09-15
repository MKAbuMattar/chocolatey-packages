$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://bionic-installers.lmstudio.ai/win32/x64/1.1.3-5/Bionic-1.1.3-5-x64.exe'
  checksum64     = '5c174f25839796c05e630814ef91e16f28cece0be97cce7c8e1901a5ccf55dd8'
  checksumType64 = 'sha256'
  softwareName   = 'Bionic*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
