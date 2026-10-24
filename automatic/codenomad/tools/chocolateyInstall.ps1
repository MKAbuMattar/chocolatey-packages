$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/NeuralNomadsAI/CodeNomad/releases/download/v1.0.0/CodeNomad-Electron-windows-x64-1.0.0.zip'
  checksum64     = '5fcfd1d25c9f4dbd9099253f31fda4721207be571d5b20fd25a1e2e04cce60f3'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# CodeNomad bundles its own copies of tools the user may already have, so keep them
# off PATH rather than shimming a second one
Get-ChildItem -Path $toolsPath -Recurse -Include 'node.exe' | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}

# CodeNomad is a GUI application, so the shim must not wait for it to exit
Get-ChildItem -Path $toolsPath -Recurse -Filter 'CodeNomad.exe' | ForEach-Object {
  New-Item -Path "$($_.FullName).gui" -ItemType File -Force | Out-Null
}
