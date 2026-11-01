$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/koala73/worldmonitor/releases/download/v2.11.7/World.Monitor_2.11.7_x64_en-US.msi'
  checksum64     = 'd3a13f77b3268810dc83e302735a75c2ba8b56809880671e8655ea1b94f2fe83'
  checksumType64 = 'sha256'
  softwareName   = 'World Monitor*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
