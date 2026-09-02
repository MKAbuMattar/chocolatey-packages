$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/NeuralNomadsAI/CodeNomad/releases/download/v0.19.0/CodeNomad-Electron-windows-x64-0.19.0.zip'
  checksum64     = '07b8894e82c468788deadbf09cc72b548d1022370b994598da69e83eff9e1214'
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
