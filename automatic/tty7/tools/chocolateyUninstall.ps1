$ErrorActionPreference = 'Stop'

[array]$keys = Get-UninstallRegistryKey -SoftwareName 'tty7*'
if ($keys.Count -eq 0) {
  Write-Warning 'tty7 is not installed; nothing to uninstall.'
  return
}
if ($keys.Count -gt 1) {
  Write-Warning "$($keys.Count) entries match tty7; uninstalling none rather than guess."
  return
}

# tty7's uninstaller first runs `tty7-app.exe --stop-daemon --update-install-dir <app>`,
# which kills everything running from the install folder. That includes the first phase
# of the Inno uninstaller itself (unins000.exe), so it exits 1 while the second phase,
# running from TEMP, carries on and removes tty7. Accept that 1, then check the removal
# really finished rather than trusting either exit code.
$log = Join-Path $env:TEMP 'tty7-uninstall.log'
$uninstaller = $keys[0].UninstallString -replace '"', ''
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'EXE' `
  -SilentArgs "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG=`"$log`"" -File $uninstaller `
  -ValidExitCodes @(0, 1)

for ($i = 0; $i -lt 60 -and ((Get-UninstallRegistryKey -SoftwareName 'tty7*') -or (Test-Path $uninstaller)); $i++) {
  Start-Sleep 1
}
if ((Get-UninstallRegistryKey -SoftwareName 'tty7*') -or (Test-Path $uninstaller)) {
  if (Test-Path $log) { Get-Content $log | Write-Host }
  throw 'tty7 is still installed after its uninstaller ran.'
}
