$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/different-ai/openwork/releases/download/v0.18.63/openwork-win-x64-0.18.63.exe'
  checksum64     = 'c08964fc202a3f08e5fc84cde7ef8ede2d8579c4500c9269eff6d359c51b7eec'
  checksumType64 = 'sha256'
  softwareName   = 'Openwork*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
