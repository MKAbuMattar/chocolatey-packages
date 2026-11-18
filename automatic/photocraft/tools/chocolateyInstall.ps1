$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/photocraft/releases/download/v0.23.1/photocraft-0.23.1-windows-x64.msi'
  checksum64     = 'de757802d8a12a41718ba24248c281d83f3bbecd64c5230f46f10c7f62070671'
  checksumType64 = 'sha256'
  softwareName   = 'PhotoCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# The MSI also installs photocraft-cli.exe, the app's command line and MCP server
# (`photocraft-cli mcp`), but leaves it off PATH. The install folder differs between
# Craft apps, so find it.
$roots = @($env:ProgramFiles, ${env:ProgramFiles(x86)}) -ne $null
$cli = Get-ChildItem $roots -Recurse -Depth 2 -Filter 'photocraft-cli.exe' -ErrorAction Ignore |
  Select-Object -First 1
if (!$cli) { throw 'photocraft-cli.exe was not found after the install.' }
Install-BinFile -Name 'photocraft-cli' -Path $cli.FullName
