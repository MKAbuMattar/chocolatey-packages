$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive holds a single kimi.exe, which Chocolatey shims as `kimi`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.3.3/kimi-code-win32-x64.zip'
  checksum64     = 'ed05701af76919f7e2d0acd732b05931de185cb32ec928b0a535bfbad553a543'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
