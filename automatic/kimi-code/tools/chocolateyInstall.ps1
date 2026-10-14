$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive holds a single kimi.exe, which Chocolatey shims as `kimi`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.2.0/kimi-code-win32-x64.zip'
  checksum64     = '4d679554b0e1c1c9b654c7d34562d71ffb1c9ee815ff8129a2d5a06d23a76f83'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
