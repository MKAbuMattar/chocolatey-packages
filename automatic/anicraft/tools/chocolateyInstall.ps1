$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/anicraft/releases/download/v0.2.1/anicraft-0.2.1-windows-x64.msi'
  checksum64     = '835ef10e964ae18169cc65bb5189953f5b4894d9725a31739cd16b2221fe8b92'
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
