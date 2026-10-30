$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.89.0/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'da1b8f03fe784207f0ef0b5b859a59d03985e0c33efee98b9f37e827bb37ed14'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
