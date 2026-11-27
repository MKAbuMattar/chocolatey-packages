$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/farion1231/cc-switch/releases/download/v4.0.44/CC-Switch-v4.0.44-Windows.msi'
  checksum64     = '1200ab639eeda2f1db96f03c0aecfe6f122c2e9e417e2d7b8d87609cc3396fdc'
  checksumType64 = 'sha256'
  softwareName   = 'CC Switch*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
