$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.13.44/Kortix-Setup-0.13.44.exe'
  checksum64     = 'd6986db1769043f502b1c773bb4f2c071031e0bcc9f2bfad3b19e4b8d4258403'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
