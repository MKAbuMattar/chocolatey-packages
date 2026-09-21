$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/farion1231/cc-switch/releases/download/v3.20.3/CC-Switch-v3.20.3-Windows.msi'
  checksum64     = 'e2bf5d8181169a3bdb68672e65242aec8e76633239379b0387d724dd80573329'
  checksumType64 = 'sha256'
  softwareName   = 'CC Switch*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
