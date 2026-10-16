$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/koala73/worldmonitor/releases/download/v2.11.0/World.Monitor_2.11.0_x64_en-US.msi'
  checksum64     = 'df403590475b57ea820f2d2f4eabb2af7ff86ce4fbdf174b7bf61f4a72cf145e'
  checksumType64 = 'sha256'
  softwareName   = 'World Monitor*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
