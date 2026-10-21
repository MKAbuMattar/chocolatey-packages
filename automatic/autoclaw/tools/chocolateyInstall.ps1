$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://autoglm-public-oss.z.ai/autoclaw/updates/autoclaw-1.20.0-setup.exe'
  checksum64     = '7a0ad12b8c62c4194fe5016d914ec01f6f943fc92abb65503c4e4153d0a2c24b'
  checksumType64 = 'sha256'
  softwareName   = 'AutoClaw*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
