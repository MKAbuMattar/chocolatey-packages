$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/farion1231/cc-switch/releases/download/v4.0.30/CC-Switch-v4.0.30-Windows.msi'
  checksum64     = 'c4d0eff6c8b0d9a67a9d21bc9b99b40c80b0f32cf1498bcc3cb8a0d0efbbed49'
  checksumType64 = 'sha256'
  softwareName   = 'CC Switch*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
