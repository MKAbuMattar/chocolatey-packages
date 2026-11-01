$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/QwenLM/qwen-code/releases/download/v0.26.5/qwen-code-win-x64.zip'
  checksum64     = '9d435b4546010d74f8f881930d7b48da7b7e7c9f9e98c28386be5856a876c833'
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
