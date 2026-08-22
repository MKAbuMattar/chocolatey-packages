$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/httpie/desktop/releases/download/v2025.2.0/HTTPie-Setup-2025.2.0.exe'
  checksum64     = ''
  checksumType64 = 'sha256'
  softwareName   = 'HTTPie*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
