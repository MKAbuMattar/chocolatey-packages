$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/craft-anything/releases/download/v0.6.1/craft-anything-0.6.1-windows-x64.msi'
  checksum64     = 'e0d4daf96d657f98efda7348b20d399b183f2411cde00aea0116a685e6af2cdd'
  checksumType64 = 'sha256'
  softwareName   = 'Craft Anything*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# The MSI also installs craft-anything-cli.exe, the app's command line and MCP server
# (`craft-anything-cli mcp`), but leaves it off PATH. The install folder differs between
# Craft apps, so find it.
$roots = @($env:ProgramFiles, ${env:ProgramFiles(x86)}) -ne $null
$cli = Get-ChildItem $roots -Recurse -Depth 2 -Filter 'craft-anything-cli.exe' -ErrorAction Ignore |
  Select-Object -First 1
if (!$cli) { throw 'craft-anything-cli.exe was not found after the install.' }
Install-BinFile -Name 'craft-anything-cli' -Path $cli.FullName
