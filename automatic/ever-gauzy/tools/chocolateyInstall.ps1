$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ever-co/ever-gauzy/releases/download/v111.0.12/gauzy-agent-x64-111.0.12.exe'
  checksum64     = 'abb480d6be40259b0c6f779ce7220a5c3928e0be7d8caafa1894d27851bb73f4'
  checksumType64 = 'sha256'
  softwareName   = 'Gauzy*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
