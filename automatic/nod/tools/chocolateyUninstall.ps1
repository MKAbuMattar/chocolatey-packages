$ErrorActionPreference = 'Stop'

[array]$keys = Get-UninstallRegistryKey -SoftwareName 'Nod'
if ($keys.Count -eq 0) {
  Write-Warning 'Nod is not installed; nothing to uninstall.'
  return
}
if ($keys.Count -gt 1) {
  Write-Warning "$($keys.Count) entries match Nod; uninstalling none rather than guess."
  return
}

# Nod's NSIS uninstaller sets no QuietUninstallString, so choco's auto uninstaller
# skips it. It also copies itself to TEMP and returns at once, so wait for the
# removal to finish.
$uninstaller = $keys[0].UninstallString -replace '"', ''
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'EXE' `
  -SilentArgs '/S' -File $uninstaller

for ($i = 0; $i -lt 120 -and ((Get-UninstallRegistryKey -SoftwareName 'Nod') -or (Test-Path $uninstaller)); $i++) {
  Start-Sleep 1
}
if ((Get-UninstallRegistryKey -SoftwareName 'Nod') -or (Test-Path $uninstaller)) {
  throw 'Nod is still installed after its uninstaller ran.'
}
