$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/farion1231/cc-switch/releases/download/v4.0.20/CC-Switch-v4.0.20-Windows.msi'
  checksum64     = '332d7d8b8e8ff80e5bf64d70f119388b773d72a8a1b1152a6ff075745b1435b8'
  checksumType64 = 'sha256'
  softwareName   = 'CC Switch*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
