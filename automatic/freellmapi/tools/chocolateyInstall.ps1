$ErrorActionPreference = 'Stop'

# A one-click electron-builder NSIS installer, so /S. It installs per user, into the
# account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tashfeenahmed/freellmapi/releases/download/v0.16.49/FreeLLMAPI-Setup-0.16.49.exe'
  checksum64     = 'd3803c636b2274c3e5942ba88e17f168f1acc4b9ea8417bb04d139141de343d3'
  checksumType64 = 'sha256'
  softwareName   = 'FreeLLMAPI*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
