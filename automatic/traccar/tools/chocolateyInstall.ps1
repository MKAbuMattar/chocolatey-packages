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

# Traccar ships its installer inside the archive, so run that too
Install-ChocolateyInstallPackage -PackageName $env:ChocolateyPackageName `
  -FileType 'EXE' -File (Join-Path $toolsPath 'traccar-setup.exe') `
  -SilentArgs '/S' -ValidExitCodes @(0)
