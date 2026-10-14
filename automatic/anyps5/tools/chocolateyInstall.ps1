$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The relinker converts an executable; the program it produces then needs the matching
# system libraries beside it. Both come from the same release, so install both.
$relinker = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/boykopovar/AnyPS5/releases/download/v0.1.2/relinker-v0.1.2.exe'
  checksum64     = '88cc311d19b1a4e41f0f34883dfb61b118bdfacd317c3960cb62e4c707bd9401'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'relinker.exe'
}
Get-ChocolateyWebFile @relinker

# Separate variables, not url64/checksum64 keys: AU's replacements run line by line, so
# a second url64 line would be rewritten to the relinker's URL.
$librariesUrl = 'https://github.com/boykopovar/AnyPS5/releases/download/v0.1.2/prx-windows-v0.1.2.zip'
$librariesChecksum = 'b26e507e7cc01922312f4ca9c7b36ab333ed3a1d7048d676f20214cadf2d4895'
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
