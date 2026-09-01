$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/openinterpreter/openinterpreter/releases/download/rust-v0.0.40/open-interpreter-package-x86_64-pc-windows-msvc.tar.gz'
  checksum64     = '816fc08a1fdb8e7e5eef9f30b92ab0d0e13f2c2253b568f2bab527152a4c03d9'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# upstream ships .tar.gz, so unpack the tar that the first extract left behind.
# The tar is found rather than named, because its name carries the version.
Get-ChildItem -Path $toolsPath -Filter *.tar | ForEach-Object {
  Get-ChocolateyUnzip -FileFullPath $_.FullName -Destination $toolsPath
  Remove-Item $_.FullName -Force
}

# Open Interpreter ships several executables, including a bundled ripgrep that would
# shadow one already on PATH, so shim only the entry point
Get-ChildItem -Path $toolsPath -Recurse -Filter *.exe | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
Install-BinFile -Name 'interpreter' -Path (Join-Path $toolsPath 'bin\interpreter.exe')
