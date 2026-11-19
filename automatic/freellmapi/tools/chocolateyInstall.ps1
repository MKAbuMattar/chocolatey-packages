$ErrorActionPreference = 'Stop'

# A one-click electron-builder NSIS installer, so /S. It installs per user, into the
# account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tashfeenahmed/freellmapi/releases/download/v0.16.36/FreeLLMAPI-Setup-0.16.36.exe'
  checksum64     = 'd9c35358e16f43ae4ed1c324a0679360e3391fc1927ff41d6df812c982b0948f'
  checksumType64 = 'sha256'
  softwareName   = 'FreeLLMAPI*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
