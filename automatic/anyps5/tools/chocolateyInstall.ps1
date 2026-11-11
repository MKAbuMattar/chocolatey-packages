$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The relinker converts an executable; the program it produces then needs the matching
# system libraries beside it. Both come from the same release, so install both.
$relinker = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/boykopovar/AnyPS5/releases/download/v0.1.5/relinker-v0.1.5.exe'
  checksum64     = '541fa50fb7255be93111b72ebe5c320f3ccb936905f8f522914f233177ca17e7'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'relinker.exe'
}
Get-ChocolateyWebFile @relinker

# Separate variables, not url64/checksum64 keys: AU's replacements run line by line, so
# a second url64 line would be rewritten to the relinker's URL.
$librariesUrl = 'https://github.com/boykopovar/AnyPS5/releases/download/v0.1.5/prx-windows-v0.1.5.zip'
$librariesChecksum = 'd026931807f977d9ce21d07bcecd8dd229e652ec849414ac69cefcab4cc96a57'
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
