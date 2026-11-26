$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/QwenLM/qwen-code/releases/download/v0.28.6/qwen-code-win-x64.zip'
  checksum64     = 'dad1ab3ebadc33c0c8e4dec364adbf18fa7728c20bedf5c1b2af99f9d26eaf1e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# Qwen Code ships several executables, some of which would shadow tools the user
# already has on PATH, so shim only the entry points
Get-ChildItem -Path $toolsPath -Recurse -Include *.exe | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
Install-BinFile -Name 'qwen' -Path (Join-Path $toolsPath 'qwen-code\bin\qwen.cmd')
