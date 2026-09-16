$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/QwenLM/qwen-code/releases/download/v0.24.0/qwen-code-win-x64.zip'
  checksum64     = 'd8bd1c7f8d7251eb1fd4b1ededeb78c8b8fb8de1f9b7aa158821c65795c81453'
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
