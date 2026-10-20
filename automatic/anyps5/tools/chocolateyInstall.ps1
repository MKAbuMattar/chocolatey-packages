$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The relinker converts an executable; the program it produces then needs the matching
# system libraries beside it. Both come from the same release, so install both.
$relinker = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/boykopovar/AnyPS5/releases/download/v0.1.3/relinker-v0.1.3.exe'
  checksum64     = 'c0de554bd426c35d3a38b67720879a0ec8dbdb06d89b0360442e45c7c268d021'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'relinker.exe'
}
Get-ChocolateyWebFile @relinker

# Separate variables, not url64/checksum64 keys: AU's replacements run line by line, so
# a second url64 line would be rewritten to the relinker's URL.
$librariesUrl = 'https://github.com/boykopovar/AnyPS5/releases/download/v0.1.3/prx-windows-v0.1.3.zip'
$librariesChecksum = 'a0d6ce41859368f7be43bb7ceefda8542f9abaaa80f16d157a1847287d46d0e0'
$libraries = @{
  packageName    = "$env:ChocolateyPackageName-libs"
  url64          = $librariesUrl
  checksum64     = $librariesChecksum
  checksumType64 = 'sha256'
  unzipLocation  = Join-Path $toolsPath 'prx-windows'
}
Install-ChocolateyZipPackage @libraries

# The libraries ship three MinGW runtime DLLs for the converted program; none of them
# is a command, and the relinker is the only executable to shim.
Write-Host "Windows system libraries: $(Join-Path $toolsPath 'prx-windows\libs')"
