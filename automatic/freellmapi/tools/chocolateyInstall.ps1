$ErrorActionPreference = 'Stop'

# A one-click electron-builder NSIS installer, so /S. It installs per user, into the
# account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tashfeenahmed/freellmapi/releases/download/v0.16.43/FreeLLMAPI-Setup-0.16.43.exe'
  checksum64     = 'f2af3658684ad4adef5ae2d1cdf80fe8a308b30560eeb330307d245821fff2fd'
  checksumType64 = 'sha256'
  softwareName   = 'FreeLLMAPI*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
