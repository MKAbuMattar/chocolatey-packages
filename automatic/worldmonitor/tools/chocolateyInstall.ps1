$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/koala73/worldmonitor/releases/download/v2.11.1/World.Monitor_2.11.1_x64_en-US.msi'
  checksum64     = 'b07585c2aaa3c5ab67c57ba39c4b78e2b3093599b49636fc277d7043165cce0f'
  checksumType64 = 'sha256'
  softwareName   = 'World Monitor*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
