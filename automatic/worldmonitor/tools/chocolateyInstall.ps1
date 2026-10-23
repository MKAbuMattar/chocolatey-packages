$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/koala73/worldmonitor/releases/download/v2.11.3/World.Monitor_2.11.3_x64_en-US.msi'
  checksum64     = 'd86c349aab1749fc01eb327b4d9e2415742240bcbd80a0e5f2da8ff396da15dc'
  checksumType64 = 'sha256'
  softwareName   = 'World Monitor*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
