$ErrorActionPreference = 'Stop'

# Chocolatey's automatic uninstaller does not know Squirrel's switches, so run its
# Update.exe directly. The entry is named just "Factory", so match it exactly.
[array]$keys = Get-UninstallRegistryKey -SoftwareName 'Factory'
if ($keys.Count -eq 0) {
  Write-Warning 'Factory Desktop is not installed; nothing to uninstall.'
  return
}
if ($keys.Count -gt 1) {
  Write-Warning "$($keys.Count) entries match Factory; uninstalling none rather than guess."
  return
}

if ($keys[0].UninstallString -notmatch '^"([^"]+)"') { throw "Unexpected UninstallString: $($keys[0].UninstallString)" }
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'EXE' `
  -SilentArgs '--uninstall -s' -File $Matches[1] -ValidExitCodes @(0)
