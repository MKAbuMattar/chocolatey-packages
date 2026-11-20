$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://bionic-installers.lmstudio.ai/win32/x64/1.2.2-3/Bionic-1.2.2-3-x64.exe'
  checksum64     = 'd6f35f47e070a879c6395c2a9c9cba4251425f31161b2ca2f4fdda52a26dee26'
  checksumType64 = 'sha256'
  softwareName   = 'Bionic*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
