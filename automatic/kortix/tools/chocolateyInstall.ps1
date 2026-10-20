$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.14.3/Kortix-Setup-0.14.3.exe'
  checksum64     = 'a7ce57b64269ce0225c6daa7b4dc951b3d0229862d968ddf4fa22fb3a1c289ed'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
