$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ever-co/ever-gauzy-agent/releases/download/v111.138.2/gauzy-agent-x64-111.138.2.exe'
  checksum64     = '6c440ec0478966195aa8065447d95bbdb0300ae6d149427d3d3c796c2fef382a'
  checksumType64 = 'sha256'
  softwareName   = 'Gauzy*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
