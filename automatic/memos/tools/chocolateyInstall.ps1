$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usememos/memos/releases/download/v0.30.0/memos_0.30.0_windows_amd64.zip'
  checksum64     = '836bf523a56e2ca69b0733fe7da0042a724e4d96d922f4556a44403c34521bc2'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
