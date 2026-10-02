$ErrorActionPreference = 'Stop'

# Chocolatey's automatic uninstaller skipped Sarab: it could not tell the installer type
# from the per-user Tauri NSIS entry, so `choco uninstall sarab` left the app installed.
# Run its uninstaller directly instead.
[array]$keys = Get-UninstallRegistryKey -SoftwareName 'Sarab'
if ($keys.Count -eq 0) {
  Write-Warning 'Sarab is not installed; nothing to uninstall.'
  return
}
if ($keys.Count -gt 1) {
  Write-Warning "$($keys.Count) entries match Sarab; uninstalling none rather than guess."
  return
}

$uninstaller = $keys[0].UninstallString -replace '"', ''
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'EXE' `
  -SilentArgs '/S' -File $uninstaller -ValidExitCodes @(0)

# An NSIS uninstaller copies itself to TEMP and returns at once, so the removal is still
# running here. Wait for its entry to go, so the uninstall is done when choco says so.
for ($i = 0; $i -lt 60 -and (Get-UninstallRegistryKey -SoftwareName 'Sarab'); $i++) { Start-Sleep 1 }
