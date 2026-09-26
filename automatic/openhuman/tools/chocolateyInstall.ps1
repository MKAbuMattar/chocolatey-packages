$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tinyhumansai/openhuman/releases/download/v0.64.4/OpenHuman_0.64.4_x64_en-US.msi'
  checksum64     = '906153256334f574a10d4f64bb6d11b9da7181ebc0ccdd8dddc3f8e208f73906'
  checksumType64 = 'sha256'
  softwareName   = 'OpenHuman*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
