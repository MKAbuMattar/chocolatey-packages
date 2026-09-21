$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tonhowtf/omniget/releases/download/v0.10.1/omniget_0.10.1_x64_en-US.msi'
  checksum64     = '6fad57184e6496e40e6ea9d857d705292f27af166517d7c256fb8c24465b7d8b'
  checksumType64 = 'sha256'
  softwareName   = 'omniget*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
