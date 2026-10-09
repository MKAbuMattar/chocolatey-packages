$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tinyhumansai/openhuman/releases/download/v0.64.15/OpenHuman_0.64.15_x64_en-US.msi'
  checksum64     = 'd3add5f3ca48b62b7ca93bb53b7990d35e3d40673e42c9a951915f459993fdd9'
  checksumType64 = 'sha256'
  softwareName   = 'OpenHuman*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
