$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/QwenLM/qwen-code/releases/download/v0.23.3/qwen-code-win-x64.zip'
  checksum64     = '2555446f3cad4c15e8a408b9f3d71bec7f1f7dfbd2a1ca4d4c04e1877d326c69'
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
