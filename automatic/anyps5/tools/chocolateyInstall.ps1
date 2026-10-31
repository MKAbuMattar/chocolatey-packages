$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The relinker converts an executable; the program it produces then needs the matching
# system libraries beside it. Both come from the same release, so install both.
$relinker = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/boykopovar/AnyPS5/releases/download/v0.1.4/relinker-v0.1.4.exe'
  checksum64     = '6f6d49e3613ea7fce859621265068bfd64161a729a8051c83150f2d45ec193e0'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'relinker.exe'
}
Get-ChocolateyWebFile @relinker

# Separate variables, not url64/checksum64 keys: AU's replacements run line by line, so
# a second url64 line would be rewritten to the relinker's URL.
$librariesUrl = 'https://github.com/boykopovar/AnyPS5/releases/download/v0.1.4/prx-windows-v0.1.4.zip'
$librariesChecksum = 'cbd61c521d555614dbcddc62cdabf45acfe409c520307cdb58732c8486dd0d7a'
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
