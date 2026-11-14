$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/Zackriya-Solutions/meetily/releases/download/v0.5.0/meetily_0.5.0_x64_en-US.msi'
  checksum64     = '34333b28a2f8f5851ee546e5f917e2612dcca36729d1d6989a7854a86ba4d7ba'
  checksumType64 = 'sha256'
  softwareName   = 'meetily*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
