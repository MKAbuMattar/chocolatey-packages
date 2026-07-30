$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/crynta/terax-ai/releases/download/v0.8.6/Terax_0.8.6_x64_en-US.msi'
  checksum64     = '468f5b25996cc379c8342af83028c6981657c21787376259ec3e8403be5c626f'
  checksumType64 = 'sha256'
  softwareName   = 'Terax*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
