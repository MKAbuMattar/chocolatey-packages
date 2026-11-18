$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/figcraft/releases/download/v0.18.1/figcraft-0.18.1-windows-x64.msi'
  checksum64     = 'ac443eae9751cb129e030f2d5ee1bf5cc1fbd8c0da1650bbfe590a928a01971e'
  checksumType64 = 'sha256'
  softwareName   = 'FigCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# The MSI also installs figcraft-cli.exe, the app's command line and MCP server
# (`figcraft-cli mcp`), but leaves it off PATH. The install folder differs between
# Craft apps, so find it.
$roots = @($env:ProgramFiles, ${env:ProgramFiles(x86)}) -ne $null
$cli = Get-ChildItem $roots -Recurse -Depth 2 -Filter 'figcraft-cli.exe' -ErrorAction Ignore |
  Select-Object -First 1
if (!$cli) { throw 'figcraft-cli.exe was not found after the install.' }
Install-BinFile -Name 'figcraft-cli' -Path $cli.FullName
