$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ever-co/ever-gauzy-agent/releases/download/v111.44.48/gauzy-agent-x64-111.44.48.exe'
  checksum64     = 'd038745a32d5df9411f4a50bf244d9c267f1344fd5d353745f7cdc00c82c3eb4'
  checksumType64 = 'sha256'
  softwareName   = 'Gauzy*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
