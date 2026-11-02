$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/farion1231/cc-switch/releases/download/v4.0.25/CC-Switch-v4.0.25-Windows.msi'
  checksum64     = 'f9e64fb97c4887b13b03e29b0a4d39fcd77deceeb2767174b0a1ccaed5991a00'
  checksumType64 = 'sha256'
  softwareName   = 'CC Switch*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
