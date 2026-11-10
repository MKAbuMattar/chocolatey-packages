$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenLAIR/dr-claw/releases/download/v1.3.1/Dr.Claw-1.3.1-win-x64.exe'
  checksum64     = '16ca0795fd1bba78b4043785792e834addf0932c48c53b9686166d2bb68aa866'
  checksumType64 = 'sha256'
  softwareName   = 'Dr. Claw*'
  # electron-builder assisted installer (oneClick: false, allowToChangeInstallationDirectory:
  # true). Plain /S crashed it with 0xC0000005 on a clean runner; the documented silent
  # form for assisted installers also names the scope, and perMachine is false upstream.
  silentArgs     = '/S /currentuser'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
