$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.68.3/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'b11e67af7191fb1c156bad350c2d52a43c2ac7f9b39aa621ec56a190cf5d1bcd'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
