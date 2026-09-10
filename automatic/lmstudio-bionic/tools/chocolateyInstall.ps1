$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://bionic-installers.lmstudio.ai/win32/x64/1.1.2-11/Bionic-1.1.2-11-x64.exe'
  checksum64     = '6b21aa94f2c2459220cc6b68046c2999f78edbed8c9885afc92d933973e43fb5'
  checksumType64 = 'sha256'
  softwareName   = 'Bionic*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
