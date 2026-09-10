$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tonhowtf/omniget/releases/download/v0.9.1/omniget_0.9.1_x64_en-US.msi'
  checksum64     = '24679c5f710acc7a1f474fc1255053e77856cea189d93b3e38b2e1096fe8b923'
  checksumType64 = 'sha256'
  softwareName   = 'omniget*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
