$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenLAIR/dr-claw/releases/download/v1.1.4/Dr.Claw-1.1.4-win-x64.exe'
  checksum64     = '8bd388d8e2ed3e155f21839c661abf1b19bb180451df6d974a3cbe0e49e56246'
  checksumType64 = 'sha256'
  softwareName   = 'Dr. Claw*'
  # electron-builder assisted installer (oneClick: false, allowToChangeInstallationDirectory:
  # true). Plain /S crashed it with 0xC0000005 on a clean runner; the documented silent
  # form for assisted installers also names the scope, and perMachine is false upstream.
  silentArgs     = '/S /currentuser'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
