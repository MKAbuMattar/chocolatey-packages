$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/koala73/worldmonitor/releases/download/v2.11.4/World.Monitor_2.11.4_x64_en-US.msi'
  checksum64     = 'eb7f2a7db835108c13b768ad0f77c1354c2d0a2adbddfcaa5ab0ff5c71176ba4'
  checksumType64 = 'sha256'
  softwareName   = 'World Monitor*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
