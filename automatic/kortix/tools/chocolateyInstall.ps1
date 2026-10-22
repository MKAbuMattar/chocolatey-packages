$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.14.6/Kortix-Setup-0.14.6.exe'
  checksum64     = '4fbdc0f6a972be28565407c267332c210faf6260c04331005c76b875d36ff7c3'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
