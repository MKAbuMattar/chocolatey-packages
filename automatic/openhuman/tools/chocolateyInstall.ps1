$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tinyhumansai/openhuman/releases/download/v0.64.0/OpenHuman_0.64.0_x64_en-US.msi'
  checksum64     = '475885cfd67a744a6509ff96fe6e7bb73bc52337424d848fea324d33f1c50053'
  checksumType64 = 'sha256'
  softwareName   = 'OpenHuman*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
