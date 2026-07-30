$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/qodo-ai/qodo-cover/releases/download/0.3.10/cover-agent-windows.exe'
  checksum64     = 'eb751fd36f902c8054c6ac65531a9917b94cabf564e50c9869f79b22caa4634d'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'cover-agent.exe'
}

Get-ChocolateyWebFile @packageArgs
