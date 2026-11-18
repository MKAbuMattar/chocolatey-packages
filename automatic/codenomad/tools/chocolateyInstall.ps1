$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/NeuralNomadsAI/CodeNomad/releases/download/v1.1.0/CodeNomad-Electron-windows-x64-1.1.0.zip'
  checksum64     = 'cc1ea5ed7ee3fbca94d9f281741cb5b8dd7dd8c602017ff53f9b6496322fa93e'
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
