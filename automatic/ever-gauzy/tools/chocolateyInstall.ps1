$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ever-co/ever-gauzy/releases/download/v111.0.11/gauzy-agent-x64-111.0.11.exe'
  checksum64     = 'f7124d2016122b78a50168e1a97ba13d533bcda9dee91150dd7968492f6eff7e'
  checksumType64 = 'sha256'
  softwareName   = 'Gauzy*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
