$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive holds a single kimi.exe, which Chocolatey shims as `kimi`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.7.3/kimi-code-win32-x64.zip'
  checksum64     = '3b25226b2ed9622f15619a27f7f0d139a9a0de24c33b91d66e885bca1aa08c5c'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
