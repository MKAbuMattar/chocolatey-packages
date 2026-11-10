$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenLAIR/dr-claw/releases/download/v1.3.0/Dr.Claw-1.3.0-win-x64.exe'
  checksum64     = 'ee9fe6ad70b2186d6dded5032ba98a32372c9f2d412184571efa2aac65b57e5a'
  checksumType64 = 'sha256'
  softwareName   = 'Dr. Claw*'
  # electron-builder assisted installer (oneClick: false, allowToChangeInstallationDirectory:
  # true). Plain /S crashed it with 0xC0000005 on a clean runner; the documented silent
  # form for assisted installers also names the scope, and perMachine is false upstream.
  silentArgs     = '/S /currentuser'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
