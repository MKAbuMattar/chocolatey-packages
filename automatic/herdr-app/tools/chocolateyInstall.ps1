$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Upstream ships a .tar.gz, which 7-Zip would unpack in two passes. Windows' own tar
# does it in one, as herdr's install.ps1 does; Git's tar, often first on PATH, reads
# C:\ as a remote host.
$archive = Join-Path $toolsPath 'herdr-app.tar.gz'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = $archive
  url64          = 'https://releases.herdr.dev/app/0.1.17/herdr-app-windows-x86_64.tar.gz'
  checksum64     = '9a2bcfb8cf7210668965ebb6eaf68465fa8378841f578a3b116fd06550bd31bb'
  checksumType64 = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

& (Join-Path $env:SystemRoot 'System32\tar.exe') -xzf $archive -C $toolsPath
if ($LASTEXITCODE) { throw "tar could not unpack $archive (exit $LASTEXITCODE)" }
Remove-Item $archive -Force

$app = Join-Path $toolsPath 'herdr-app\herdr-app.exe'
New-Item -Path "$app.ignore" -ItemType File -Force | Out-Null
Install-BinFile -Name 'herdr-app' -Path $app -UseStart

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'Herdr.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $shortcut -TargetPath $app -WorkingDirectory $env:USERPROFILE
