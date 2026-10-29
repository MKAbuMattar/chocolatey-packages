$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://bionic-installers.lmstudio.ai/win32/x64/1.1.10-8/Bionic-1.1.10-8-x64.exe'
  checksum64     = '1d213b7d1fc06ad3af9990964169bcb6baa7c2b852ffeaa2bb2a560773ecc94d'
  checksumType64 = 'sha256'
  softwareName   = 'Bionic*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
