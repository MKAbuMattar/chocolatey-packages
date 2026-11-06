$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive holds a single kimi.exe, which Chocolatey shims as `kimi`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.5.2/kimi-code-win32-x64.zip'
  checksum64     = '821932edc413c68c24ce7c2705c9621676ba3e1b311cb8b46d7f90a0ad83e971'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
