$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/novincode/dlman/releases/download/v1.11.1/DLMan_1.11.1_x64_en-US.msi'
  checksum64     = 'cb43d2cbc07431bc7a954574beb270023fbada4a258909e06976cb824b4a3b03'
  checksumType64 = 'sha256'
  softwareName   = 'DLMan*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
