$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/lobehub/lobehub/releases/download/v2.3.0/LobeHub-2.3.0-setup.exe'
  checksum64     = 'fc7fdb99e07f913480e5904b19cd4b05f8d1b7dfc39648f01128bd96baa9c921'
  checksumType64 = 'sha256'
  softwareName   = 'LobeHub*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
