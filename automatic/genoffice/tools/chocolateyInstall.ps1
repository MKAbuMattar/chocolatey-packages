$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.13.615/GenOfficeSetup-v0.13.615-x64.exe'
  checksum64     = 'fb0f383f3f690d79ec567e805b54eec6ea52b6ced371ffd4b09d0b55e87ff94f'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
