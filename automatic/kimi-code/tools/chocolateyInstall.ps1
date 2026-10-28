$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive holds a single kimi.exe, which Chocolatey shims as `kimi`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.4.0/kimi-code-win32-x64.zip'
  checksum64     = '69550acada3379686f5d207465dc0688eec36a9345a6418b37119befd5bc8ef7'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
