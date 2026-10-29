$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/awslabs/iam-policy-autopilot/releases/download/0.4.0/iam-policy-autopilot-0.4.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '09f54f45daec4ccb5f5e75123b6e9cfbecb4109f11e2713d9c6dbeb510f7351e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
