$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/QwenLM/qwen-code/releases/download/v0.28.4/qwen-code-win-x64.zip'
  checksum64     = '81234b13006160d5bd6b9ab2d5a072964d38796c83e23ee3395c626cb141458a'
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
