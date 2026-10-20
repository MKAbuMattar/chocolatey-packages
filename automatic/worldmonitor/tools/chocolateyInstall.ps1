$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/koala73/worldmonitor/releases/download/v2.11.2/World.Monitor_2.11.2_x64_en-US.msi'
  checksum64     = 'c1b2ee9efba17b17471ec27b3b4abf8d1c97620c5399029e68675089fe8c2d72'
  checksumType64 = 'sha256'
  softwareName   = 'World Monitor*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
