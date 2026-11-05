$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenLAIR/dr-claw/releases/download/v1.2.0/Dr.Claw-1.2.0-win-x64.exe'
  checksum64     = '3405c6dccd7bdc914f35fc2f203bc5a9d5833f94bbede06ae5964a1d03391850'
  checksumType64 = 'sha256'
  softwareName   = 'Dr. Claw*'
  # electron-builder assisted installer (oneClick: false, allowToChangeInstallationDirectory:
  # true). Plain /S crashed it with 0xC0000005 on a clean runner; the documented silent
  # form for assisted installers also names the scope, and perMachine is false upstream.
  silentArgs     = '/S /currentuser'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
