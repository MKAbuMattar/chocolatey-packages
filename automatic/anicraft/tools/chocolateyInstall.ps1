$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/anicraft/releases/download/v0.3.0/anicraft-0.3.0-windows-x64.msi'
  checksum64     = 'b5aeef74c989811159bef331faac80fb4508307c56b74a139573bb03b1e4cbcb'
  checksumType64 = 'sha256'
  softwareName   = 'AniCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# The MSI also installs anicraft-cli.exe, the app's command line and MCP server
# (`anicraft-cli mcp`), but leaves it off PATH. The install folder differs between
# Craft apps, so find it.
$roots = @($env:ProgramFiles, ${env:ProgramFiles(x86)}) -ne $null
$cli = Get-ChildItem $roots -Recurse -Depth 2 -Filter 'anicraft-cli.exe' -ErrorAction Ignore |
  Select-Object -First 1
if (!$cli) { throw 'anicraft-cli.exe was not found after the install.' }
Install-BinFile -Name 'anicraft-cli' -Path $cli.FullName
