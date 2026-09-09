$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/traccar/traccar/releases/download/v6.15.3/traccar-windows-64-6.15.3.zip'
  checksum64     = '515652bdfe062523171bde0c9db638fae9435e0a727fa0e50e218547d6a91596'
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
