$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.81.0/OpenKnowledge-Setup-x64.exe'
  checksum64     = '97702c833b8b33d3bd14cfe319c18e8f4d6b6fee307c016b6ad0d15c3df957e3'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
