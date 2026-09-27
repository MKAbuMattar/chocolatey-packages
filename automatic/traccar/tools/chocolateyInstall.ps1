$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/traccar/traccar/releases/download/v6.16.0/traccar-windows-64-6.16.0.zip'
  checksum64     = 'c7b3a495767fe027dcaaf50133eade6565e63070fb2c139420a99543c3f41c95'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# Traccar ships its installer inside the archive, so run that too. It is Inno Setup
# 6.7.0, confirmed by the "Inno Setup Setup Data (6.7.0)" marker in the binary, not
# NSIS. Inno ignores /S, so the installer opened its GUI and sat there until Chocolatey
# gave up at its 2700 second timeout. These are the switches Inno actually reads.
Install-ChocolateyInstallPackage -PackageName $env:ChocolateyPackageName `
  -FileType 'EXE' -File (Join-Path $toolsPath 'traccar-setup.exe') `
  -SilentArgs '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' `
  -ValidExitCodes @(0, 3010, 1641)
