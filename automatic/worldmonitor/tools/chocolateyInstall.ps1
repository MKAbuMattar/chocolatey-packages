$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/koala73/worldmonitor/releases/download/v2.10.0/World.Monitor_2.10.0_x64_en-US.msi'
  checksum64     = '2e95fd62c7af365301d99076f0469a1edff8939bdced995e616c279fa94f6037'
  checksumType64 = 'sha256'
  softwareName   = 'World Monitor*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
