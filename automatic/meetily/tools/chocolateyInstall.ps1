$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/Zackriya-Solutions/meetily/releases/download/v0.4.0/meetily_0.4.0_x64_en-US.msi'
  checksum64     = '9c0d30802b5d7b097372b3c8969ea0f8ae5aa4e0028c4bb6fc1856fd5adcd8c8'
  checksumType64 = 'sha256'
  softwareName   = 'meetily*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
