$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/awslabs/iam-policy-autopilot/releases/download/0.3.0/iam-policy-autopilot-0.3.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '944d82108294e19576083f452a91e32ac2e94a1e4495fa59daab8f0953eb8fea'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
