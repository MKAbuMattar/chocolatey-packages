$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/farion1231/cc-switch/releases/download/v4.0.10/CC-Switch-v4.0.10-Windows.msi'
  checksum64     = 'b7d3bb65c9bae3d7763eb049b51d1eef50d2519d5e7a73567ed7c3564f432103'
  checksumType64 = 'sha256'
  softwareName   = 'CC Switch*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
