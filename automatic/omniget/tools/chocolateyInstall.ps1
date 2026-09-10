$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tonhowtf/omniget/releases/download/v0.9.1/omniget_0.9.1_x64_en-US.msi'
  checksum64     = ''
  checksumType64 = 'sha256'
  softwareName   = 'omniget*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
