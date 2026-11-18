$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/pdfcraft/releases/download/v0.21.1/pdfcraft-0.21.1-windows-x64.msi'
  checksum64     = 'b28c4c8aa88910293f7a09a82e893db74759b9afc7860fc114c0cba56cf0830a'
  checksumType64 = 'sha256'
  softwareName   = 'PdfCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# The MSI also installs pdfcraft-cli.exe, the app's command line and MCP server
# (`pdfcraft-cli mcp`), but leaves it off PATH. The install folder differs between
# Craft apps, so find it.
$roots = @($env:ProgramFiles, ${env:ProgramFiles(x86)}) -ne $null
$cli = Get-ChildItem $roots -Recurse -Depth 2 -Filter 'pdfcraft-cli.exe' -ErrorAction Ignore |
  Select-Object -First 1
if (!$cli) { throw 'pdfcraft-cli.exe was not found after the install.' }
Install-BinFile -Name 'pdfcraft-cli' -Path $cli.FullName
