$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.25/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '0a2715ddf7e24cdff876fb77b7b46413b0c1e01a79e5d0866d4bdbdfa441aa64'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
