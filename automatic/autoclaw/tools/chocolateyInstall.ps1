$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://autoglm-public-oss.z.ai/autoclaw/updates/autoclaw-1.18.5-setup.exe'
  checksum64     = '2da28367e4ae5e5e52fe7790eccba6fd88ecac2fe9f910ad1661a4ab52796207'
  checksumType64 = 'sha256'
  softwareName   = 'AutoClaw*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
