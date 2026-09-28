$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.28/opensre_0.1.2026.9.28_windows-x64.zip'
  checksum64     = 'cde8c0571da5b0cae21edea21404e6468a4e1fbeac7957ac64a9d8620d3c9ae1'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
