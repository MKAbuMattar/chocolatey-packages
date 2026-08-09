$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/openinterpreter/openinterpreter/releases/download/rust-v0.0.34/open-interpreter-package-x86_64-pc-windows-msvc.tar.gz'
  checksum64     = 'c87adf4f85ef6a2eb36135ce8f583257a590a6e7e460de5ab9832cdde3187e4e'
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
