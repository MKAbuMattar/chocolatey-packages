$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usememos/memos/releases/download/26.11.2/memos_26.11.2_windows_amd64.zip'
  checksum64     = 'b7c8267e637db74c75f7caa00f60083c53d1f660a8c088e6f09eac1aa62eeb4f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
