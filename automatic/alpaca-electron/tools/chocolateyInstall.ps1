$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ItsPi3141/alpaca-electron/releases/download/v1.0.6/Alpaca-Electron-win-x64-v1.0.6.exe'
  checksum64     = '15f6254695008953d85ce083d63ae1babbd10704f2cefd7935f83709537b8b1a'
  checksumType64 = 'sha256'
  softwareName   = 'Alpaca Electron*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
