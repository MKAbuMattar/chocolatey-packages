$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/effectcraft/releases/download/v0.24.1/effectcraft-0.24.1-windows-x64.msi'
  checksum64     = '4bda68bafb4325f96e794b81819a1e6c4b2a42c012c3c82aa2ce8a668b70b295'
  checksumType64 = 'sha256'
  softwareName   = 'EffectCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# The MSI also installs effectcraft-cli.exe, the app's command line and MCP server
# (`effectcraft-cli mcp`), but leaves it off PATH. The install folder differs between
# Craft apps, so find it.
$roots = @($env:ProgramFiles, ${env:ProgramFiles(x86)}) -ne $null
$cli = Get-ChildItem $roots -Recurse -Depth 2 -Filter 'effectcraft-cli.exe' -ErrorAction Ignore |
  Select-Object -First 1
if (!$cli) { throw 'effectcraft-cli.exe was not found after the install.' }
Install-BinFile -Name 'effectcraft-cli' -Path $cli.FullName
