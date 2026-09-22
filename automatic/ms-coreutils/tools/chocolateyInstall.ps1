$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/microsoft/coreutils/releases/download/v2026.9.3/coreutils-2026.9.3-x64.exe'
  checksum64     = '5600caf3ea219274feb3e8f8b626a80263eb5c41d531e36a0acbc72cc670a229'
  checksumType64 = 'sha256'
  softwareName   = 'Coreutils*'
  # Inno Setup 7.0.0.3, read out of the binary, not NSIS. Inno ignores /S, so the
  # installer opened its GUI on the runner and sat there until Chocolatey gave up
  # 45 minutes later. 2026.6.16 is the same family, so this was wrong before the
  # version bump too and only showed up once a tools change made CI install it.
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
