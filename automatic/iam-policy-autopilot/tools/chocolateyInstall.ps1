$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/awslabs/iam-policy-autopilot/releases/download/0.2.3/iam-policy-autopilot-0.2.3-x86_64-pc-windows-msvc.zip'
  checksum64     = '469bf8806bdd6f6eb693299969fb79c3ddd47c4e9d6e8c88b459eedbe4fad961'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
