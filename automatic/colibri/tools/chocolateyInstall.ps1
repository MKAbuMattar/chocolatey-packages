$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/JustVugg/colibri/releases/download/v1.12.0/colibri-v1.12.0-windows-x86_64.zip'
  checksum64     = 'c36e394ccda37637b4c864593a62c5d78a8abedfd224d138ad55f4b32975efbd'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# The archive ships nine executables and only one of them is a command. The rest are
# per-model engines named glm53, inkling, olmoe, qwen36 and so on, which upstream says
# are "not meant to be started directly" and which would take those words on PATH for
# every user of this package. Shim nothing by default, then name the entry points.
Get-ChildItem -Path $toolsPath -Recurse -Include *.exe | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}

# coli is the launcher and the thing users are told to run, but it is a Python script
# with no extension, so ShimGen skips it and `coli` was missing after install (#33).
# coli.cmd is upstream's Windows entry point for exactly this, and Install-BinFile
# shims a batch file where ShimGen will not.
Install-BinFile -Name 'coli' -Path (Join-Path $toolsPath 'coli.cmd')

# Keep the package name working too. Run bare it explains that coli is the launcher.
Install-BinFile -Name 'colibri' -Path (Join-Path $toolsPath 'colibri.exe')
