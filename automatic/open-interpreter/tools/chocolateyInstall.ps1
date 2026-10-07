$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/openinterpreter/openinterpreter/releases/download/rust-v0.0.56/open-interpreter-package-x86_64-pc-windows-msvc.tar.gz'
  checksum64     = '0e7fd776ffb46cb3821d8acd54c4b45bc13d72110d1dfa0b92903f49fb2bb8a1'
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
