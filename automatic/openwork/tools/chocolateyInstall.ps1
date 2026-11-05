$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/different-ai/openwork/releases/download/v0.18.65/openwork-win-x64-0.18.65.exe'
  checksum64     = 'a3e6823e9b54fcb8216b60202a9e4753e87dce1b41d5ba786e6d53babeecf749'
  checksumType64 = 'sha256'
  softwareName   = 'Openwork*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
