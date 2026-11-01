$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/traccar/traccar/releases/download/v6.17.0/traccar-windows-64-6.17.0.zip'
  checksum64     = 'e321921a4af0d9eb06e3cae09117561b05b212da075c152fb589f6180527b015'
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
