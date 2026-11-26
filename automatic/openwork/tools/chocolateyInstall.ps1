$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/different-ai/openwork/releases/download/v0.18.73/openwork-win-x64-0.18.73.exe'
  checksum64     = 'bc86828f03101e9b90b6bd39e9b0239a57b10f9375bd9e9b5b10dcdd5aed87fb'
  checksumType64 = 'sha256'
  softwareName   = 'Openwork*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
