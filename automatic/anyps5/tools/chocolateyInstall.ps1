$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The relinker converts an executable; the program it produces then needs the matching
# system libraries beside it. Both come from the same release, so install both.
$relinker = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/boykopovar/AnyPS5/releases/download/v0.1.1/relinker-v0.1.1.exe'
  checksum64     = '1553f254a74f10b9c6bdd97934647709a1171dec9de15248455f827f0c174521'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'relinker.exe'
}
Get-ChocolateyWebFile @relinker

# Separate variables, not url64/checksum64 keys: AU's replacements run line by line, so
# a second url64 line would be rewritten to the relinker's URL.
$librariesUrl = 'https://github.com/boykopovar/AnyPS5/releases/download/v0.1.1/prx-windows-v0.1.1.zip'
$librariesChecksum = 'e1cae91e9cd846f5d5670b4ebe20f6d002d75efb974bb0cb64cec4e0b507f0c5'
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
