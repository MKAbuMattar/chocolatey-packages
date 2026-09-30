$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tinyhumansai/openhuman/releases/download/v0.64.10/OpenHuman_0.64.10_x64_en-US.msi'
  checksum64     = 'c1ab12e4205b89825f7aaf0eb52dc6773beeb8f7e427566fbd463aba81ac8efe'
  checksumType64 = 'sha256'
  softwareName   = 'OpenHuman*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
