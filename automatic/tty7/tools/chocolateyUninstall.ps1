$ErrorActionPreference = 'Stop'

# Run the Inno uninstaller directly, with a log, instead of Chocolatey's auto-uninstaller:
# that one only reported "exit code 1", which says nothing about what tty7's uninstall
# steps (stopping the daemon, unregistering the Explorer menu) tripped over.
[array]$keys = Get-UninstallRegistryKey -SoftwareName 'tty7*'
if ($keys.Count -eq 0) {
  Write-Warning 'tty7 is not installed; nothing to uninstall.'
  return
}
if ($keys.Count -gt 1) {
  Write-Warning "$($keys.Count) entries match tty7; uninstalling none rather than guess."
  return
}

$log = Join-Path $env:TEMP 'tty7-uninstall.log'
$uninstaller = $keys[0].UninstallString -replace '"', ''
try {
  Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'EXE' `
    -SilentArgs "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG=`"$log`"" -File $uninstaller `
    -ValidExitCodes @(0)
} catch {
  if (Test-Path $log) { Get-Content $log | Write-Host }
  throw
}
